From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 28 Jul 2015 18:34:19 +0200
Message-ID: <20150728163419.GZ30479@wotan.suse.de>
References: <20150728153303.2ba27786@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36480 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751124AbbG1Qeb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2015 12:34:31 -0400
Content-Disposition: inline
In-Reply-To: <20150728153303.2ba27786@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org, benh@kernel.crashing.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 28, 2015 at 03:33:03PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/video/fbdev/aty/atyfb_base.c: In function 'atyfb_setup_generic':
> drivers/video/fbdev/aty/atyfb_base.c:3447:2: error: implicit declaration of function 'ioremap_uc' [-Werror=implicit-function-declaration]
>   par->ati_regbase = ioremap_uc(info->fix.mmio_start, 0x1000);
>   ^
> drivers/video/fbdev/aty/atyfb_base.c:3447:19: warning: assignment makes pointer from integer without a cast
>   par->ati_regbase = ioremap_uc(info->fix.mmio_start, 0x1000);
>                    ^
> 
> Caused by commits
> 
>   3cc2dac5be3f ("drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC")
>   8c7ea50c010b ("x86/mm, asm-generic: Add IOMMU ioremap_uc() variant default")
> 
> The latter defines ioremap_uc() for x86 and those architectures that
> use asm-generic/io.h - which is not all of them :-( .  The former commit
> then uses ioremap_uc().
> 
> I have reverted commit 3cc2dac5be3f (and 7d89a3cb159a that follows it)
> for today.

This should be fixed by:

http://git.kernel.org/tip/8c7ea50c010b2f1e006ad37c43f98202a31de2cb

The way it was defined was to return NULL if an arch does not have it,
*but* if the asm-generic io.h header is not included on some archs it will still
fail, which leaves us no option but to then poke and define its implementaiton
for archs which opt-out of asm-generic io.h

Benh, in this case I believe its OK to to just map it to ioremap(), let me know
what you think.

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index a8d2ef30d473..91db9153cd44 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -721,6 +721,7 @@ extern void __iomem *ioremap_prot(phys_addr_t address, unsigned long size,
 				  unsigned long flags);
 extern void __iomem *ioremap_wc(phys_addr_t address, unsigned long size);
 #define ioremap_nocache(addr, size)	ioremap((addr), (size))
+#define ioremap_uc(addr, size)	ioremap((addr), (size))
 
 extern void iounmap(volatile void __iomem *addr);
 

  Luis
