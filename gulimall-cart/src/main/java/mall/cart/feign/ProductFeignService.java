package mall.cart.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;
import com.common.utils.R;

import java.util.List;

@FeignClient("gulimall-product")
public interface ProductFeignService {
    @RequestMapping("product/skuinfo/info/{skuId}")
     R info(@PathVariable("skuId") Long skuId);

    @RequestMapping("product/skusaleattrvalue/getSkuSaleAttrValuesAsString")
    List<String> getSkuSaleAttrValuesAsString(@RequestBody Long skuId);
}
