From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: commit "Thermal: CPU Package temperature thermal" has reject
 files
Date: Tue, 18 Jun 2013 07:28:14 +0800
Message-ID: <1371511694.22538.0.camel@rzhang1-mobl4>
References: <51BF6F74.80504@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:28179 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751361Ab3FQX2f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Jun 2013 19:28:35 -0400
In-Reply-To: <51BF6F74.80504@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: srinivas.pandruvada@linux.intel.com, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Mon, 2013-06-17 at 16:20 -0400, Paul Gortmaker wrote:
> Hi Guys,
> 
> Can you please respin this linux-next commit to not contain reject files?
> 
fixed in thermal -next.

thanks,
rui
> $ git show  37056864a02dd6c79d8f2842e42576a4bfb694b2|diffstat -p0
>  b/drivers/thermal/Kconfig                |   12 
>  b/drivers/thermal/Makefile               |    2 
>  b/drivers/thermal/cpu_cooling.c.rej      |   11 
>  b/drivers/thermal/exynos_thermal.c.rej   |   96 ++++
>  b/drivers/thermal/rcar_thermal.c.rej     |   59 ++
>  b/drivers/thermal/thermal_core.c.rej     |   10 
>  b/drivers/thermal/x86_pkg_temp_thermal.c |  642 +++++++++++++++++++++++++++++++
>  7 files changed, 831 insertions(+), 1 deletion(-)
> $ 
> 
> Thanks,
> Paul.
