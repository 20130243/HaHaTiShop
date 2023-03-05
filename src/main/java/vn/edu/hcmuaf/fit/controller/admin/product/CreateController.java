package vn.edu.hcmuaf.fit.controller.admin.product;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Image;
import vn.edu.hcmuaf.fit.bean.PriceSize;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "Product create", value = "/admin/product/create")
@MultipartConfig(fileSizeThreshold = 0,
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 25 // 25MB
)


public class CreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Category> categoryList = (new CategoryService()).getAll();
            request.setAttribute("categoryList", categoryList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Product product = new Product();
        String name = request.getParameter("name");


        List<Image> images = new ArrayList<>();
        List<Part> fileParts = request.getParts().stream().filter(part -> "image".equals(part.getName())).collect(Collectors.toList());
        if (!fileParts.isEmpty()) {

            //new image
            for (Part image : fileParts) {
                String fileName = Path.of(image.getSubmittedFileName()).getFileName().toString();
                String realPath = request.getServletContext().getRealPath("/img/ProductImport");
                if (!fileName.equals("")) {
                    //extension --> filename
                    String extension = ".";
                    int i = fileName.lastIndexOf('.');
                    if (i > 0) {
                        extension = "." + fileName.substring(i + 1);
                    }
                    String imageName = name.replaceAll(" ", "") + LocalDateTime.now().toEpochSecond(java.time.ZoneOffset.UTC) + images.size() + extension;

                    //create directory
                    if (!Files.exists(Path.of(realPath))) {
                        Files.createDirectory(Path.of(realPath));
                    }
                    //upload file
                    String path = realPath + "/" + imageName;
                    image.write(path);
                    //save url image
                    String url = "/img/ProductImport/" + imageName;
                    images.add(new Image(0, imageName, url, 0, 0));
                }
            }
        }

        int category = Integer.parseInt(request.getParameter("category"));
        int status = Integer.parseInt(request.getParameter("status"));

        List<PriceSize> priceSizeList = new ArrayList<PriceSize>();
        float price_M = Float.parseFloat(request.getParameter("price_M"));
        PriceSize priceSizeM = new PriceSize(0, 0, "M", price_M, price_M);
        priceSizeList.add(priceSizeM);
        if (request.getParameter("price_L") != null) {
            float price_L = Float.parseFloat(request.getParameter("price_L"));
            PriceSize priceSizeL = new PriceSize(0, 0, "L", price_L, price_L);
            priceSizeList.add(priceSizeL);
        }
        product.setName(name);
        product.setIdCategory(category);
        product.setPriceSize(priceSizeList);
        product.setStatus(status);
        product.setImage(images);

        try {
            (new ProductService()).insert(product);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect("/admin/product");
    }
}
