Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F25F3D333B
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041346; cv=pass; b=CRhdtpyoKgZP48cHzISiOGhqTDuaNjIRYaabyDw+w9xQJaiuJkh5rPRfGdwN0Idv73izxtBl5OhYC48l+h9t/6atgUWzG3R1Irr6jfv1EAYNBlKLpM5N5hhyeQ7WDAD3oUO/N6upHDdoGj7OAF2v0UmUaCbICs34jiX/Qygj0iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041346; c=relaxed/simple;
	bh=3lMyDoPzeZLd+bYl3QedbvUY5KHh+K1YsYUaP1hQHhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glME7wda0IlInV8n1jqZe8hNh9OEsBZmD70cuhNgwRhigZUUGBX6/e5ioRIKZ9C7U0NnKqcngwnjc7Kd31C35j4CbkYTHLBr6ROPKrEIc81A8HwWkZ2jgxCdDS92M0hRA/hZuy9Gi/sMOOz8YHsSbSLQKS2aelzVtKbdSfgkk+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oIS4cQ6k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGHRRLrc; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oIS4cQ6k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGHRRLrc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHShSI3057449
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 17:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w9eqOEEqpUIbvn+FIHMQPKHo
	uttVaVapgNZSLhT7TEc=; b=oIS4cQ6kmYplSUK5jiYkLKjk35wTwPpba84IegjO
	JltAowuu4TQZXlGYAovKfvSGHrir/xdZl1jem4eS2TOrcaTDn6qjVzYBsQ5bXCuC
	OpdjlSq4Rqdg6slUXV0cFGRwf5IJUUUGwKXigaB7d/oT70y7lVdgaIcnI/yHjHyc
	wJ1vvpB8s8a7Ne24qQnMZfp7HtBQsgkch9riBQfPk3Y6v6/8yuYUpjkyZeo9nR6Y
	reKEG1lJt0rXt9cLqiu70DcfgWuNclTwvIR9YZ3HYtpr8bK63dzYBLrpvPWOR3ts
	1nShBUnUsuhpq5hhMOzr+lLIL8fRjGO2G/Qg5L2WhT8NfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39hp13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 17:42:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-356236ae3c1so965088a91.1
        for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 09:42:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772041344; cv=none;
        d=google.com; s=arc-20240605;
        b=bf89QWMtPXEUUqf/lDP8NL8yKOi+tmcY+n0qurCgKYO+Kg0tRhcBxwrYxkz8BWCB8C
         gFWMeu1UsJqREopqE00+nFkDU4Y39ZVPk6nEoEX4K/n1NPePOJgJP8x11pAMwsJLcHvs
         KOPVcd8rq10Y/vMIQ2KchJwzo9gFpURUZf/SRyYQ+BhpI9zLABtSXhU000ChVTSyy68T
         Zpu2dFfTscPWqujg0cNYqIYaGCfom2wG1S7iFawVGdOfxoczdM9FEX2MKbqPAXBFTuht
         aCntGfBRRF/MlwjwOXS+3vF+ZPFqKoQGFkZ8vku/lpVL7JKk7ubUVWL4/zf7uliHyptF
         g8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w9eqOEEqpUIbvn+FIHMQPKHouttVaVapgNZSLhT7TEc=;
        fh=LRAwZ2BnPXqH+kto9u5JSWfs/YGuyAc1cG+Fdgafa44=;
        b=I6owIwzsC5see0m6qmDH2cRpr9sN6cp8Cvx9qarDH20CzvF8PeZxHeXm3F/7JZ2m5Z
         44hOU/wXW633SupegRSLInd5eei9ei8lMB4kZNIB5b8Kj3fa3Cp5v4xXddWClGySj0Gv
         u4xyAoMGuwXin0wCbgyYlr5eo452cgsRiki+hHPLwyFsejtfHA/n5UwKjoLI5VhU3h3F
         3oczZTjrC5dl2oDUNR11q2XTlgI4uxDkq8t9Hz+KyLLlyjE3nOEzYbIQEv8aScBTVOY0
         5nswf1J+sSvLXaX+YbDQNk5+v1MvAN3Du4982FZK+l6l42adCIgnMFmy4WBl5pHuwX1f
         JxgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772041344; x=1772646144; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w9eqOEEqpUIbvn+FIHMQPKHouttVaVapgNZSLhT7TEc=;
        b=jGHRRLrcp1DHbOKQ0jK8jdtLI4bh18XVrKxZfCjWgEkQQdb4fxN0eezbz20hIFTanF
         2s/bOKMg/P5aZn5EgWX7zLYbyxsnPNzepyE1/Mx8GiVB3O8bDRFbGA8kiPhMV83x4I3T
         A7uBN5cLVwQKw2/qE/TPbc+/8z2LVaBRW0xb53MGpLjVGeNiMNein0zClcswvIHmIJK7
         escpegrCg07zTdjsSCSd1N23HpgMPK9fcrp/v5VKd+U24gxJ3RG335vU69o80vH0Eiae
         uUSRr5Gu5MXcJgokDpv3LHNAkiuSpKKPHDuujKdJsscOq2E3EqbeoCfJX9uV73ozUONA
         S77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041344; x=1772646144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9eqOEEqpUIbvn+FIHMQPKHouttVaVapgNZSLhT7TEc=;
        b=Ss5RtmrwCtKH7QYkET4I3OxM+eOH13L57kGWgo3zl09lBgCREC/RfA7zm0vws2gVbU
         YKbcTecNGyjNMEtZZUavYxy7IHQqk1y3u5stStq/ARDGOIVoN4fZHLcVy8OI8kJswH+2
         UUqRQvcD42GRdvLEBjvnNcYEsch3zSM5/KR3S9Ve6p1EYg6IrASnssLIsEbqqov/vXHL
         17cDUQJmBRg+Sj0iZWkxMlj27g+MWDhhGefaxsZAFxBIaKlJ6ZcN/BZ5ol5AcVyKz1Ip
         tACrN2fQ2KfoN9mh5tZABxwZkdqVDnHsUGbs0uVCkxdXDONUVVeqWxdpcL7YqxfTzfoZ
         cVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuxIXWgOSAdFYYnqqNwa8xNgrjCmU4Sc9O/IGAqx+OzKUnc7ApUzQCihwDKBcilc/mRqPPqQL4yO5C@vger.kernel.org
X-Gm-Message-State: AOJu0YwZowjzdFFFeNiRJZQCtDQNIVVYAh7E62brM1SutBzt748Xc21M
	ZpaAN4wVK4yJMMmerGC23UpA4TbeThV6iFxKWp7tOw686sARRvtJvHfPojQH1uignuhBdikr43u
	upz6OXozj2OT82I4+AAmXmLZP6SwI64pRXnTh6Z7oYAYQw/oa3PWR9trMHQF1Qgm5MV6BkQW3Qd
	UjdVEJczqe4HornVay4zlSIHv00yHQthkrZplYr8E=
X-Gm-Gg: ATEYQzwU8EoExek6p1p4hfhBfthABrEtUj9QFmp8WiWTjRqSwlBAC59ifKR+/1RCY8a
	eUFal2aI/clHy2nwE7KbG6tUU1rvWMwkP5+8zvXHMSx/tQUnx4ufMc9Bh2b0rWPd4XBM9mGgzxc
	UHWZXcow8Pjc+DKE8qoPXoo5S9Bdy54w7IFbMxQAD4+ra4NCETkiWjxu3R2x8rCdd2zK4/rQKmw
	iSMB7oIERrd8pKLolZd7cl/euhqBWu7t6x5Fw==
X-Received: by 2002:a17:90b:1dce:b0:354:c3a4:3a6 with SMTP id 98e67ed59e1d1-359037f361amr3338655a91.3.1772041343623;
        Wed, 25 Feb 2026 09:42:23 -0800 (PST)
X-Received: by 2002:a17:90b:1dce:b0:354:c3a4:3a6 with SMTP id
 98e67ed59e1d1-359037f361amr3338627a91.3.1772041343016; Wed, 25 Feb 2026
 09:42:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZ73gWMLc_kMCIrA@sirena.org.uk>
In-Reply-To: <aZ73gWMLc_kMCIrA@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 19:42:12 +0200
X-Gm-Features: AaiRm52nvhAeEcUleeI3ZQ9pJsdNHZRG2JjNjMYExoFlvTMjiYr8BmswqEaimKk
Message-ID: <CAO9ioeUM6ypgSLfZYj41LcjjENVpCuJ6ffk7f5yybdmd8UGJ3Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-msm-fixes tree with the
 origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Kees Cook <kees@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2OSBTYWx0ZWRfXyw8Jr3EZiS7p
 YxWJQPgOUbrHVqMw+v3bZZOqegMN41PyYUsaq7RBVW4731vS43FS1iKGp4W9+k0Q4vr7KH1ReoN
 2YpwXzPXeoPnQzaa2s1N8/8EvA2O2FPkkhMPF46PeBTqbokxNgFeiRG8MuhtHzMFUWoThmEDQta
 V6dx7HXQsz8xwPpWwwAaNE4AJJvxgRA/D2P94auheQLH0G3L+mJzxiVGYD8tC7oNyY47utej4bx
 oKAITKP6DG4TEHNfL+Y6hubLu3NRphXk89VFQFZ+Z0a3MOCR6EWT/Ht+mCCHawDFaKbkbTBqifT
 +A7TD8zK7gDTcvw8gJrKpuL1kZ28okCSfEphwr0QoTkaZw7Df6amYnOdRdLWdwz5UW3DdB9gLw7
 IFQI+8vUsxFgYpSbXZdPfBhtMQJu9n815kq/ndtoGG75Ak1zqz7p6MpU2fBimBkFQoxCJg6+Uic
 YuFjN3h+0kno88zUoGQ==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699f3480 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=kz4-KFSQ7HH0njDw:21 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=eNeFkkK_53lWrHSR8mcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: hfVEvB1pvw8adXXd1fkixb6UrTA7AeXr
X-Proofpoint-ORIG-GUID: hfVEvB1pvw8adXXd1fkixb6UrTA7AeXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250169

On Wed, 25 Feb 2026 at 15:22, Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the drm-msm-fixes tree got a conflict in:
>
>   drivers/gpu/drm/msm/msm_iommu.c
>
> between commits:
>
>   48634a9ea06a4 ("drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation type")

Kees, why was it landed? And how? It was not Ack'ed (nor was it
requested) to go through the non-drm-msm tree. There was no note that
it got applied. What is going on?

>   69050f8d6d075 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar types")
>   bf4afc53b77ae ("Convert 'alloc_obj' family to use the new default GFP_KERNEL argument")
>
> from the origin tree and commit:
>
>   6f6f3535192dd ("drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation type")
>
> from the drm-msm-fixes tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --combined drivers/gpu/drm/msm/msm_iommu.c
> index 7d449e5202c5d,271baf4dc4e80..0000000000000
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@@ -332,7 -332,7 +332,7 @@@ msm_iommu_pagetable_prealloc_allocate(s
>         struct kmem_cache *pt_cache = get_pt_cache(mmu);
>         int ret;
>
>  -      p->pages = kvmalloc_array(p->count, sizeof(*p->pages), GFP_KERNEL);
>  +      p->pages = kvmalloc_objs(*p->pages, p->count);
>         if (!p->pages)
>                 return -ENOMEM;
>
> @@@ -521,7 -521,7 +521,7 @@@ struct msm_mmu *msm_iommu_pagetable_cre
>         if (WARN_ONCE(!ttbr1_cfg, "No per-process page tables"))
>                 return ERR_PTR(-ENODEV);
>
>  -      pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
>  +      pagetable = kzalloc_obj(*pagetable);
>         if (!pagetable)
>                 return ERR_PTR(-ENOMEM);
>
> @@@ -734,7 -734,7 +734,7 @@@ struct msm_mmu *msm_iommu_new(struct de
>
>         iommu_set_pgtable_quirks(domain, quirks);
>
>  -      iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
>  +      iommu = kzalloc_obj(*iommu);
>         if (!iommu) {
>                 iommu_domain_free(domain);
>                 return ERR_PTR(-ENOMEM);



-- 
With best wishes
Dmitry
