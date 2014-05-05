From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/radeon: use NULL instead of zero
Date: Mon, 5 May 2014 12:53:58 +0000
Message-ID: <A3397C8B8B789E45844E7EC5DEAD89D040EEF93D@satlexdag05.amd.com>
References: <20140503135512.GA17068@ativ>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bl2lp0205.outbound.protection.outlook.com ([207.46.163.205]:53551
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932267AbaEEMyU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 May 2014 08:54:20 -0400
In-Reply-To: <20140503135512.GA17068@ativ>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michele CURTI <michele.curti@gmail.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@linux.ie" <airlied@linux.ie>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

> -----Original Message-----
> From: Michele CURTI [mailto:michele.curti@gmail.com]
> Sent: Saturday, May 03, 2014 9:55 AM
> To: Deucher, Alexander; Koenig, Christian; airlied@linux.ie
> Cc: linux-next@vger.kernel.org
> Subject: [PATCH] drm/radeon: use NULL instead of zero
> 
> 
> Use NULL instead of zero for NULL pointers
> 
> Signed-off-by: Michele Curti <michele.curti@gmail.com>

Can you break this into two patches?  One that changes that clearstate headers and one that changes object functions?

Thanks,

Alex

> ---
>  drivers/gpu/drm/radeon/clearstate_cayman.h | 8 ++++----
>  drivers/gpu/drm/radeon/clearstate_ci.h     | 4 ++--
>  drivers/gpu/drm/radeon/clearstate_si.h     | 4 ++--
>  drivers/gpu/drm/radeon/radeon_object.c     | 2 +-
>  drivers/gpu/drm/radeon/radeon_object.h     | 2 +-
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/clearstate_cayman.h
> b/drivers/gpu/drm/radeon/clearstate_cayman.h
> index aa908c5..ee428ac 100644
> --- a/drivers/gpu/drm/radeon/clearstate_cayman.h
> +++ b/drivers/gpu/drm/radeon/clearstate_cayman.h
> @@ -1050,7 +1050,7 @@ static const struct cs_extent_def
> SECT_CONTEXT_defs[] =
>      {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
>      {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
>      {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
> -    { 0, 0, 0 }
> +    {NULL, 0, 0 }
>  };
>  static const u32 SECT_CLEAR_def_1[] =
>  {
> @@ -1061,7 +1061,7 @@ static const u32 SECT_CLEAR_def_1[] =
>  static const struct cs_extent_def SECT_CLEAR_defs[] =
>  {
>      {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
> -    { 0, 0, 0 }
> +    {NULL, 0, 0 }
>  };
>  static const u32 SECT_CTRLCONST_def_1[] =
>  {
> @@ -1071,11 +1071,11 @@ static const u32 SECT_CTRLCONST_def_1[] =
>  static const struct cs_extent_def SECT_CTRLCONST_defs[] =
>  {
>      {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
> -    { 0, 0, 0 }
> +    {NULL, 0, 0 }
>  };
>  static const struct cs_section_def cayman_cs_data[] = {
>      { SECT_CONTEXT_defs, SECT_CONTEXT },
>      { SECT_CLEAR_defs, SECT_CLEAR },
>      { SECT_CTRLCONST_defs, SECT_CTRLCONST },
> -    { 0, SECT_NONE }
> +    { NULL, SECT_NONE }
>  };
> diff --git a/drivers/gpu/drm/radeon/clearstate_ci.h
> b/drivers/gpu/drm/radeon/clearstate_ci.h
> index c3982f9..1673c34 100644
> --- a/drivers/gpu/drm/radeon/clearstate_ci.h
> +++ b/drivers/gpu/drm/radeon/clearstate_ci.h
> @@ -936,9 +936,9 @@ static const struct cs_extent_def
> ci_SECT_CONTEXT_defs[] =
>      {ci_SECT_CONTEXT_def_5, 0x0000a2a0, 2 },
>      {ci_SECT_CONTEXT_def_6, 0x0000a2a3, 1 },
>      {ci_SECT_CONTEXT_def_7, 0x0000a2a5, 233 },
> -    { 0, 0, 0 }
> +    {NULL, 0, 0 }
>  };
>  static const struct cs_section_def ci_cs_data[] = {
>      { ci_SECT_CONTEXT_defs, SECT_CONTEXT },
> -    { 0, SECT_NONE }
> +    { NULL, SECT_NONE }
>  };
> diff --git a/drivers/gpu/drm/radeon/clearstate_si.h
> b/drivers/gpu/drm/radeon/clearstate_si.h
> index b994cb2..60474b8 100644
> --- a/drivers/gpu/drm/radeon/clearstate_si.h
> +++ b/drivers/gpu/drm/radeon/clearstate_si.h
> @@ -933,9 +933,9 @@ static const struct cs_extent_def
> si_SECT_CONTEXT_defs[] =
>      {si_SECT_CONTEXT_def_5, 0x0000a2a1, 1 },
>      {si_SECT_CONTEXT_def_6, 0x0000a2a3, 1 },
>      {si_SECT_CONTEXT_def_7, 0x0000a2a5, 233 },
> -    { 0, 0, 0 }
> +    {NULL, 0, 0 }
>  };
>  static const struct cs_section_def si_cs_data[] = {
>      { si_SECT_CONTEXT_defs, SECT_CONTEXT },
> -    { 0, SECT_NONE }
> +    { NULL, SECT_NONE }
>  };
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c
> b/drivers/gpu/drm/radeon/radeon_object.c
> index 19bec0d..95197aa 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -722,7 +722,7 @@ int radeon_bo_wait(struct radeon_bo *bo, u32
> *mem_type, bool no_wait)
>  {
>  	int r;
> 
> -	r = ttm_bo_reserve(&bo->tbo, true, no_wait, false, 0);
> +	r = ttm_bo_reserve(&bo->tbo, true, no_wait, false, NULL);
>  	if (unlikely(r != 0))
>  		return r;
>  	spin_lock(&bo->tbo.bdev->fence_lock);
> diff --git a/drivers/gpu/drm/radeon/radeon_object.h
> b/drivers/gpu/drm/radeon/radeon_object.h
> index 9e7b25a..5a873f3 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -65,7 +65,7 @@ static inline int radeon_bo_reserve(struct radeon_bo
> *bo, bool no_intr)
>  {
>  	int r;
> 
> -	r = ttm_bo_reserve(&bo->tbo, !no_intr, false, false, 0);
> +	r = ttm_bo_reserve(&bo->tbo, !no_intr, false, false, NULL);
>  	if (unlikely(r != 0)) {
>  		if (r != -ERESTARTSYS)
>  			dev_err(bo->rdev->dev, "%p reserve failed\n", bo);
> --
> 1.9.2
> 
> Regards,
> Michele
