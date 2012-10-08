From: "Zhang, Rui" <rui.zhang@intel.com>
Subject: RE: linux-next: build failure after merge of the thermal tree
Date: Mon, 8 Oct 2012 02:14:05 +0000
Message-ID: <744357E9AAD1214791ACBA4B0B90926322F516@SHSMSX101.ccr.corp.intel.com>
References: <20121008110205.1e0abbe228186fcf30afad74@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:11515 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750820Ab2JHCOJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 7 Oct 2012 22:14:09 -0400
In-Reply-To: <20121008110205.1e0abbe228186fcf30afad74@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Amit Daniel Kachhap <amit.kachhap@linaro.org>, "Wu, Fengguang" <fengguang.wu@intel.com>, Andrew Morton <akpm@linux-foundation.org>

Hi,

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Monday, October 08, 2012 8:02 AM
> To: Zhang, Rui
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Amit
> Daniel Kachhap; Wu, Fengguang; Andrew Morton
> Subject: linux-next: build failure after merge of the thermal tree
> Importance: High
> 
> Hi Zhang,
> 
> After merging the thermal tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/thermal/cpu_cooling.c: In function 'get_idr':
> drivers/thermal/cpu_cooling.c:89:14: error: 'MAX_ID_MASK' undeclared
> (first use in this function)
> 
> Caused by commit 023614183768 ("thermal: add generic cpufreq cooling
> implementation") interacting with commit 125c4c706b68 ("idr: rename
> MAX_LEVEL to MAX_IDR_LEVEL") which very recently entered Linus' tree.
> 
> I have applied the following fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 8 Oct 2012 10:56:56 +1100
> Subject: [PATCH] thermal: fix for for MAX_ID_MASK to MAX_IDR_MASK
> rename
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

The patch looks good to me, thanks for the fix.

-rui
> ---
>  drivers/thermal/cpu_cooling.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/cpu_cooling.c
> b/drivers/thermal/cpu_cooling.c index 9050c1b..cc1c930 100644
> --- a/drivers/thermal/cpu_cooling.c
> +++ b/drivers/thermal/cpu_cooling.c
> @@ -86,7 +86,7 @@ again:
>  	else if (unlikely(err))
>  		return err;
> 
> -	*id = *id & MAX_ID_MASK;
> +	*id = *id & MAX_IDR_MASK;
>  	return 0;
>  }
> 
> --
> 1.7.10.280.gaa39
> 
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
