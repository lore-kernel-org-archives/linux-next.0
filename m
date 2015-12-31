From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the thermal-soc tree
Date: Thu, 31 Dec 2015 09:01:24 -0800
Message-ID: <1451581284.4047.1.camel@linux.intel.com>
References: <20151231125356.233ae279@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:37341 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751100AbbLaRDX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Dec 2015 12:03:23 -0500
In-Reply-To: <20151231125356.233ae279@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

On Thu, 2015-12-31 at 12:53 +1100, Stephen Rothwell wrote:
> Hi Eduardo,
> 
> After merging the thermal-soc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/thermal/thermal_core.c: In function 'trip_point_temp_store':
> drivers/thermal/thermal_core.c:764:2: error: too few arguments to
> function 'thermal_zone_device_update'
>   thermal_zone_device_update(tz);   
>   ^
> drivers/thermal/thermal_core.c:612:6: note: declared here
>  void thermal_zone_device_update(struct thermal_zone_device *tz,
>       ^
> 
> Caused by commit
> 
>   ce0265dd6f8e ("thermal: trip_point_temp_store() calls
> thermal_zone_device_update()")
> 
> from the thermal-soc tree interacting with commit
> 
>   c4117cc3526e ("thermal: core: enhance thermal_zone_device_update")
> 
> from the thermal tree.
> 
> I have applied the following merge fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 31 Dec 2015 12:47:22 +1100
> Subject: [PATCH] thermal: fix for thermal_zone_device_update() API
> change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/thermal/thermal_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/thermal_core.c
> b/drivers/thermal/thermal_core.c
> index bd175218141f..7f7a3caf8892 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -761,7 +761,7 @@ trip_point_temp_store(struct device *dev, struct
> device_attribute *attr,
>  	if (ret)
>  		return ret;
>  
> -	thermal_zone_device_update(tz);
> +	thermal_zone_device_update(tz, THERMAL_DEVICE_EVENT_NONE);

This fix looks good to me.

Thanks,
Srinivas

>  
>  	return count;
>  }
> -- 
> 2.6.4
> 
