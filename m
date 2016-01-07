From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Thu, 7 Jan 2016 13:44:03 +1100
Message-ID: <20160107134403.59337b3f@canb.auug.org.au>
References: <20151231213124.1973e995@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60447 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752254AbcAGCoF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Jan 2016 21:44:05 -0500
In-Reply-To: <20151231213124.1973e995@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rex Zhu <Rex.Zhu@amd.com>, Alex Deucher <alexander.deucher@amd.com>

Hi all,

On Thu, 31 Dec 2015 21:31:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the drm tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/tonga_thermal.c: In function 'tonga_fan_ctrl_get_fan_speed_percent':
> drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/tonga_thermal.c:84:2: error: implicit declaration of function 'do_div' [-Werror=implicit-function-declaration]
>   do_div(tmp64, duty100);
>   ^
> drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/fiji_thermal.c: In function 'fiji_fan_ctrl_get_fan_speed_percent':
> drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/fiji_thermal.c:78:2: error: implicit declaration of function 'do_div' [-Werror=implicit-function-declaration]
>   do_div(tmp64, duty100);
>   ^
> 
> Caused by commit
> 
>   1e4854e96c35 ("drm/amdgpu/powerplay: implement thermal control for tonga.")
> 
> [I notice that that commit does not have a Signed-off-by from its
> committer (Alex)]
> 
> I applied the following fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 31 Dec 2015 21:20:20 +1100
> Subject: [PATCH] drm/amdgpu/powerplay: include asm/div64.h for do_div()
> 
> Fixes: 1e4854e96c35 ("drm/amdgpu/powerplay: implement thermal control for tonga.")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/fiji_thermal.c  | 2 +-
>  drivers/gpu/drm/amd/powerplay/hwmgr/tonga_thermal.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/fiji_thermal.c b/drivers/gpu/drm/amd/powerplay/hwmgr/fiji_thermal.c
> index def57d0675ed..e76a7de9aa32 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/fiji_thermal.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/fiji_thermal.c
> @@ -20,7 +20,7 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   *
>   */
> -
> +#include <asm/div64.h>
>  #include "fiji_thermal.h"
>  #include "fiji_hwmgr.h"
>  #include "fiji_smumgr.h"
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/tonga_thermal.c b/drivers/gpu/drm/amd/powerplay/hwmgr/tonga_thermal.c
> index 2e159b003e71..a188174747c9 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/tonga_thermal.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/tonga_thermal.c
> @@ -20,7 +20,7 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   *
>   */
> -
> +#include <asm/div64.h>
>  #include "tonga_thermal.h"
>  #include "tonga_hwmgr.h"
>  #include "tonga_smumgr.h"
> -- 
> 2.6.4

Ping?  I am still applying that patch ...

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
