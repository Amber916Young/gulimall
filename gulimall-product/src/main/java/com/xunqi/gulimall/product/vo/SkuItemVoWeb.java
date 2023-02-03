package com.xunqi.gulimall.product.vo;

import com.xunqi.gulimall.product.entity.SkuImagesEntity;
import lombok.Data;
import java.util.List;

@Data
public class SkuItemVoWeb {
    private SkusVoWeb info;
    private Long skuId;
    private boolean hasStock = true;
    private List<SkuImagesEntity> images;
    public SkuItemVoWeb(SkusVoWeb info, Long skuId, boolean hasStock, List<SkuImagesEntity> images) {
        this.info = info;
        this.skuId = skuId;
        this.hasStock = hasStock;
        this.images = images;
    }
}
