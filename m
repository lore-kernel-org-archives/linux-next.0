From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Thu, 17 Mar 2016 09:41:19 +0100
Message-ID: <56EA6DAF.1010007@amd.com>
References: <20160317154121.1b47aff1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-by2on0061.outbound.protection.outlook.com ([207.46.100.61]:24744
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932234AbcCQI5M (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Mar 2016 04:57:12 -0400
In-Reply-To: <20160317154121.1b47aff1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>

Hi Stephen,

yeah, indeed the release_pages() function is now used in two more files=
=2E

Your fix is Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>.

Regards,
Christian.

Am 17.03.2016 um 05:41 schrieb Stephen Rothwell:
> Hi Dave,
>
> After merging the drm tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c: In function 'amdgpu_gem_user=
ptr_ioctl':
> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:321:2: error: implicit declar=
ation of function 'release_pages' [-Werror=3Dimplicit-function-declarat=
ion]
>    release_pages(bo->tbo.ttm->pages, bo->tbo.ttm->num_pages, false);
>    ^
> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c: In function 'amdgpu_cs_parser=
_bos':
> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:410:5: error: implicit declara=
tion of function 'release_pages' [-Werror=3Dimplicit-function-declarati=
on]
>       release_pages(e->user_pages,
>       ^
>
> Caused by commit
>
>    2f568dbd6b94 ("drm/amdgpu: move get_user_pages out of amdgpu_ttm_t=
t_pin_userptr v6")
>
> Presumably a forgotten include file.
>
> I added this fix patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 17 Mar 2016 15:30:49 +1100
> Subject: [PATCH] drm/amdgpu: release_pages requires linux/pagemap.h
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_cs.c
> index 4f5ef4149e87..9392e50a7ba4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -25,6 +25,7 @@
>    *    Jerome Glisse <glisse@freedesktop.org>
>    */
>   #include <linux/list_sort.h>
> +#include <linux/pagemap.h>
>   #include <drm/drmP.h>
>   #include <drm/amdgpu_drm.h>
>   #include "amdgpu.h"
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_gem.c
> index 1ecdf6c01368..0f2391ec1ed9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -26,6 +26,7 @@
>    *          Jerome Glisse
>    */
>   #include <linux/ktime.h>
> +#include <linux/pagemap.h>
>   #include <drm/drmP.h>
>   #include <drm/amdgpu_drm.h>
>   #include "amdgpu.h"
