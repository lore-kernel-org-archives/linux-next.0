From: vibi sreenivasan <vibi_sreenivasan@cms.com>
Subject: [PATCH]:Fix warning from drivers/pcmcia/at91_cf.c
Date: Tue, 11 Aug 2009 14:31:41 +0530
Message-ID: <1249981301.13065.2.camel@HunTEr>
Reply-To: vibi_sreenivasan@cms.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailgw3.cms.com ([203.124.163.53]:30864 "EHLO cms.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752740AbZHKPJH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Aug 2009 11:09:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.arm.linux.org.uk

Patch Fixes the following warning
        
        drivers/pcmcia/at91_cf.c:55:1: warning: "SZ_2K" redefined
        In file included from
        arch/arm/mach-at91/include/mach/hardware.h:17,
                         from
        arch/arm/mach-at91/include/mach/memory.h:24,
        
        from /media/skub/linux-git-wkg/linux-git/linux-next/arch/arm/include/asm/memory.h:18,
        
        from /media/skub/linux-git-wkg/linux-git/linux-next/arch/arm/include/asm/page.h:197,
                         from include/linux/mmzone.h:20,
                         from include/linux/gfp.h:4,
                         from include/linux/kmod.h:22,
                         from include/linux/module.h:13,
                         from drivers/pcmcia/at91_cf.c:12:
        /media/skub/linux-git-wkg/linux-git/linux-next/arch/arm/include/asm/sizes.h:32:1: warning: this is the location of the previous definition
        
        Signed-off-by: vibi sreenivasan, CMS COMPUTERS LTD, INDIA
        <vibi_sreenivasan@cms.com>
        ---
         drivers/pcmcia/at91_cf.c |    1 -
         1 files changed, 0 insertions(+), 1 deletions(-)
        
        diff --git a/drivers/pcmcia/at91_cf.c b/drivers/pcmcia/at91_cf.c
        index 9e1140f..a5a7842 100644
        --- a/drivers/pcmcia/at91_cf.c
        +++ b/drivers/pcmcia/at91_cf.c
        @@ -52,7 +52,6 @@ struct at91_cf_socket {
                unsigned long           phys_baseaddr;
         };
         
        -#define        SZ_2K                   (2 * SZ_1K)
         
         static inline int at91_cf_present(struct at91_cf_socket *cf)
         {
        -- 
        1.6.3.3
        
        
        
