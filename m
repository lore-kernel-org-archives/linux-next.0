From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: linux-next: build failure after merge of the final tree (drm
 tree related)
Date: Mon, 2 Sep 2013 14:36:51 +0000
Message-ID: <A3397C8B8B789E45844E7EC5DEAD89D02E7EEFBC@satlexdag05.amd.com>
References: <20130902190123.e3cd30ac95fcefa1aaa95c8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-db9lp0253.outbound.messaging.microsoft.com ([213.199.154.253]:57914
	"EHLO db9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756399Ab3IBOhE convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Sep 2013 10:37:04 -0400
In-Reply-To: <20130902190123.e3cd30ac95fcefa1aaa95c8b@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Monday, September 02, 2013 5:01 AM
> To: Dave Airlie
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Deucher,
> Alexander
> Subject: linux-next: build failure after merge of the final tree (drm tree
> related)
> 
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/gpu/drm/radeon/ci_dpm.c: In function
> 'ci_request_link_speed_change_before_state_change':
> drivers/gpu/drm/radeon/ci_dpm.c:4212:4: error: implicit declaration of
> function 'radeon_acpi_pcie_performance_request' [-Werror=implicit-
> function-declaration]
>     if (radeon_acpi_pcie_performance_request(rdev,
> PCIE_PERF_REQ_PECI_GEN3, false) == 0)
>     ^
> 
> Caused by commit cc8dbbb4f62a ("drm/radeon: add dpm support for CI
> dGPUs
> (v2)").  These calls need protecting with CONFIG_ACPI (like is done in
> cypress_dpm.c, I guess).
> 
> I tried reverting commit 9c725e5bcdae ("Merge branch 'drm-next-3.12' of
> git://people.freedesktop.org/~agd5f/linux into drm-next") but that failed
> because that branch is based on v3.11-rc7 (!) which is later than the
> base of the drm tree (v3.11-rc3).  :-(
> 
> I added this fix up patch for today (it may be wrong, butfixes the build
> failure).
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 2 Sep 2013 18:57:41 +1000
> Subject: [PATCH] drm/radeon: protect ACPI calls with CONFIG_ACPI
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

The patch looks fine.

Thanks,

Alex

> ---
>  drivers/gpu/drm/radeon/ci_dpm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/radeon/ci_dpm.c
> b/drivers/gpu/drm/radeon/ci_dpm.c
> index 916630f..3cce533 100644
> --- a/drivers/gpu/drm/radeon/ci_dpm.c
> +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> @@ -4208,6 +4208,7 @@ static void
> ci_request_link_speed_change_before_state_change(struct radeon_devic
>  	pi->pspp_notify_required = false;
>  	if (target_link_speed > current_link_speed) {
>  		switch (target_link_speed) {
> +#ifdef CONFIG_ACPI
>  		case RADEON_PCIE_GEN3:
>  			if (radeon_acpi_pcie_performance_request(rdev,
> PCIE_PERF_REQ_PECI_GEN3, false) == 0)
>  				break;
> @@ -4217,6 +4218,7 @@ static void
> ci_request_link_speed_change_before_state_change(struct radeon_devic
>  		case RADEON_PCIE_GEN2:
>  			if (radeon_acpi_pcie_performance_request(rdev,
> PCIE_PERF_REQ_PECI_GEN2, false) == 0)
>  				break;
> +#endif
>  		default:
>  			pi->force_pcie_gen =
> ci_get_current_pcie_speed(rdev);
>  			break;
> @@ -4248,7 +4250,9 @@ static void
> ci_notify_link_speed_change_after_state_change(struct radeon_device
>  		    (ci_get_current_pcie_speed(rdev) > 0))
>  			return;
> 
> +#ifdef CONFIG_ACPI
>  		radeon_acpi_pcie_performance_request(rdev, request,
> false);
> +#endif
>  	}
>  }
> 
> --
> 1.8.4.rc3
> 
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
