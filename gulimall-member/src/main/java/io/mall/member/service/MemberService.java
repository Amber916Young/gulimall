package io.mall.member.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.common.utils.PageUtils;
import io.mall.member.entity.MemberEntity;
import io.mall.member.vo.MemberLoginVo;
import io.mall.member.vo.MemberRegisterVo;
import io.mall.member.vo.SocialUser;

import java.util.Map;

/**
 * 会员
 *
 * @author Ethan
 * @email hongshengmo@163.com
 * @date 2020-05-27 23:01:00
 */
public interface MemberService extends IService<MemberEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void register(MemberRegisterVo registerVo);

    MemberEntity login(MemberLoginVo loginVo);

    MemberEntity login(SocialUser socialUser);
}

