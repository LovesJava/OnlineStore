import com.jsu.dao.CategoryMapper;
import com.jsu.pojo.Category;
import com.jsu.service.ICategoryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ICategoryServiceTest {

    @Autowired
    private CategoryMapper categoryMapper;

    @Test
    public void insertTest(){
        Category category = new Category();
        category.setId(10010);
        category.setName("微波炉");
        category.setStatus(true);
        category.setParentId(10001);

        categoryMapper.insert(category);
    }
}
