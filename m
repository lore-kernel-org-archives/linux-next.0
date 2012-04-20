From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: New ARM build coverage (was: linux-next: triage for April 18, 2012)
Date: Fri, 20 Apr 2012 17:59:52 +0000
Message-ID: <201204201759.52271.arnd@arndb.de>
References: <CAP=VYLrNpskLQDAw3Udnq7grddi-uD6TDjQQoZUd+FVg2rXPnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:57918 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754050Ab2DTR77 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Apr 2012 13:59:59 -0400
In-Reply-To: <CAP=VYLrNpskLQDAw3Udnq7grddi-uD6TDjQQoZUd+FVg2rXPnA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>

On Thursday 19 April 2012, Paul Gortmaker wrote:
> ARM folks,
> 
> Just a heads up that Stephen expanded the linux-next ARM coverage
> today to add a whole bunch more builds.
> 
> Possibly "new" build fails were detected in these configs:
> 
> ARM:mackerel_defconfig,ag5evm_defconfig
> ARM:ezx_defconfig
> ARM:mini2440_defconfig

I think this is needed to fix mini2440_defconfig after the platform
files have been moved around.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/arm/configs/mini2440_defconfig b/arch/arm/configs/mini2440_defconfig
index 42da918..082175c 100644
--- a/arch/arm/configs/mini2440_defconfig
+++ b/arch/arm/configs/mini2440_defconfig
@@ -14,6 +14,8 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_BLK_DEV_INTEGRITY=y
 CONFIG_ARCH_S3C24XX=y
+# CONFIG_CPU_S3C2410 is not set
+CONFIG_CPU_S3C2440=y
 CONFIG_S3C_ADC=y
 CONFIG_S3C24XX_PWM=y
 CONFIG_MACH_MINI2440=y
