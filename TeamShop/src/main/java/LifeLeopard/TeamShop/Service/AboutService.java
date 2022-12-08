package LifeLeopard.TeamShop.Service;

import LifeLeopard.TeamShop.Models.About;
import LifeLeopard.TeamShop.Models.Event;
import LifeLeopard.TeamShop.Responsibility.AboutReps;
import LifeLeopard.TeamShop.UploadImagesProduct.FileUploadUtil;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class AboutService {
    public static String UPLOAD_DIRECTORY = Paths.get("")
            .toAbsolutePath()
            .toString() + "/src/main/resources/static/images/about";
    public static String DELETE_DIRECTORY = Paths.get("")
            .toAbsolutePath()
            .toString() + "/src/main/resources/static";
    @Autowired
    private AboutReps aboutReps;
    public List<About> getAllAboutOn(){
        return aboutReps.findAllByStatusIs(1);
    }
    public int CreateAboutInfo(About about, MultipartFile multipartFile) throws IOException {
        aboutReps.save(about);
        String Check = StringUtils.getFilename(multipartFile.getOriginalFilename());
        if(!Check.isEmpty()){
            String FileName = RandomString.make(10);
            String Ex = StringUtils.getFilenameExtension(StringUtils.cleanPath(multipartFile.getOriginalFilename()));
            FileName = FileName + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
            FileName = FileName.replace('.','-');
            FileName = FileName.replace(' ','-');
            FileName = FileName + "."+ Ex;
            String uploadDir = UPLOAD_DIRECTORY + "/"+ about.getAboutId();
            String urlImg = new String();
            urlImg = "/images/about/" + about.getAboutId() +"/"+ FileName;
            about.setAboutImg(urlImg);
            aboutReps.save(about);
            FileUploadUtil.saveFile(uploadDir,FileName,multipartFile);
        }
        return about.getAboutId();
    }
}
