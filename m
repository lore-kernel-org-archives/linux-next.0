From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Date: Thu, 24 Nov 2011 15:54:09 +0000
Message-ID: <201111241554.09598.arnd@arndb.de>
References: <20111124115239.ff33728e7e9a99426528c214@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:49972 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754406Ab1KXPyY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Nov 2011 10:54:24 -0500
In-Reply-To: <20111124115239.ff33728e7e9a99426528c214@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Shawn Guo <shawn.guo@linaro.org>

On Thursday 24 November 2011, Stephen Rothwell wrote:
> Hi Arnd,
> 
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/tools/mach-types between commit bb9b25f923fc ("ARM: Update
> mach-types") from the arm tree and commit 9b7c547f7747 ("ARM: Update
> mach-types to fix mxs build breakage") from the arm-soc tree.
> 
> The arm tree version is a superset of the arm-soc version, so I used that.

Thanks for catching this!

Shawn, please make sure that any updates to mach-types go only through
Russell's tree. Unfortunately I did not realize that this was out of
scope when I merged it, otherwise I would have complained yesterday.

Russell, is it ok for you if the patch (see below for reference)
goes into 3.2-rc4 through the arm-soc tree? I can remove if if you
think that's better, but I have a lot of fixes stacked on top now
that I'd prefer not to rebase.

	Arnd

---
commit 9b7c547f7747991fe62f622698ea1bf470f256f4
Author: Shawn Guo <shawn.guo@linaro.org>
Date:   Wed Nov 16 21:44:33 2011 +0800

    ARM: Update mach-types to fix mxs build breakage
    
    Add entry m28evk to fix the following mxs build breakage.
    
      CHK     include/generated/compile.h
      CC      arch/arm/mach-mxs/clock-mx28.o
    arch/arm/mach-mxs/clock-mx28.c: In function 'clk_misc_init':
    arch/arm/mach-mxs/clock-mx28.c:748: error: implicit declaration of
    function 'machine_is_m28evk'
    make[1]: *** [arch/arm/mach-mxs/clock-mx28.o] Error 1
    make: *** [arch/arm/mach-mxs] Error 2
    
    Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
    Acked-by: Uwe Kleine-K<C3><B6>nig <u.kleine-koenig@pengutronix.de>

diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
index 5bdeef9..ccbe16f 100644
--- a/arch/arm/tools/mach-types
+++ b/arch/arm/tools/mach-types
@@ -1123,5 +1123,6 @@ blissc                    MACH_BLISSC             BLISSC                  3491
 thales_adc             MACH_THALES_ADC         THALES_ADC              3492
 ubisys_p9d_evp         MACH_UBISYS_P9D_EVP     UBISYS_P9D_EVP          3493
 atdgp318               MACH_ATDGP318           ATDGP318                3494
+m28evk                 MACH_M28EVK             M28EVK                  3613
 smdk4212               MACH_SMDK4212           SMDK4212                3638
 smdk4412               MACH_SMDK4412           SMDK4412                3765
