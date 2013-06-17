From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: commit "Thermal: CPU Package temperature thermal" has reject files
Date: Mon, 17 Jun 2013 16:20:04 -0400
Message-ID: <51BF6F74.80504@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:50686 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751320Ab3FQUUC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Jun 2013 16:20:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: srinivas.pandruvada@linux.intel.com, rui.zhang@intel.com
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Guys,

Can you please respin this linux-next commit to not contain reject files?

$ git show  37056864a02dd6c79d8f2842e42576a4bfb694b2|diffstat -p0
 b/drivers/thermal/Kconfig                |   12 
 b/drivers/thermal/Makefile               |    2 
 b/drivers/thermal/cpu_cooling.c.rej      |   11 
 b/drivers/thermal/exynos_thermal.c.rej   |   96 ++++
 b/drivers/thermal/rcar_thermal.c.rej     |   59 ++
 b/drivers/thermal/thermal_core.c.rej     |   10 
 b/drivers/thermal/x86_pkg_temp_thermal.c |  642 +++++++++++++++++++++++++++++++
 7 files changed, 831 insertions(+), 1 deletion(-)
$ 

Thanks,
Paul.
