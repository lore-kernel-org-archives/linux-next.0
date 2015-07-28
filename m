From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 28 Jul 2015 20:17:13 +0200
Message-ID: <20150728181713.GB30479@wotan.suse.de>
References: <20150728153303.2ba27786@canb.auug.org.au>
 <20150728163419.GZ30479@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42719 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751878AbbG1SRP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2015 14:17:15 -0400
Content-Disposition: inline
In-Reply-To: <20150728163419.GZ30479@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org, benh@kernel.crashing.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 28, 2015 at 06:34:19PM +0200, Luis R. Rodriguez wrote:
> On Tue, Jul 28, 2015 at 03:33:03PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > drivers/video/fbdev/aty/atyfb_base.c: In function 'atyfb_setup_generic':
> > drivers/video/fbdev/aty/atyfb_base.c:3447:2: error: implicit declaration of function 'ioremap_uc' [-Werror=implicit-function-declaration]
> >   par->ati_regbase = ioremap_uc(info->fix.mmio_start, 0x1000);
> >   ^
> > drivers/video/fbdev/aty/atyfb_base.c:3447:19: warning: assignment makes pointer from integer without a cast
> >   par->ati_regbase = ioremap_uc(info->fix.mmio_start, 0x1000);
> >                    ^
> > 
> > Caused by commits
> > 
> >   3cc2dac5be3f ("drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC")
> >   8c7ea50c010b ("x86/mm, asm-generic: Add IOMMU ioremap_uc() variant default")
> > 
> > The latter defines ioremap_uc() for x86 and those architectures that
> > use asm-generic/io.h - which is not all of them :-( .  The former commit
> > then uses ioremap_uc().
> > 
> > I have reverted commit 3cc2dac5be3f (and 7d89a3cb159a that follows it)
> > for today.
> 
> This should be fixed by:
> 
> http://git.kernel.org/tip/8c7ea50c010b2f1e006ad37c43f98202a31de2cb
> 
> The way it was defined was to return NULL if an arch does not have it,
> *but* if the asm-generic io.h header is not included on some archs it will still
> fail, which leaves us no option but to then poke and define its implementaiton
> for archs which opt-out of asm-generic io.h
> 
> Benh, in this case I believe its OK to to just map it to ioremap(), let me know
> what you think.
> 

I checked and there are other architectures that do not include asm-generic/io.h,
so here is the full patch fix, which I'll post next.

From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: [PATCH] arch/*/io.h: Add ioremap_uc() to all architectures

This adds ioremap_uc() only for architectures that do not
include asm-generic.h/io.h as that already provides a default
definition for them for both cases where you have CONFIG_MMU
and you do not, and because of this, the number of architectures
this patch address is less than the architectures that the
ioremap_wt() patch addressed, "arch/*/io.h: Add ioremap_wt() to all
architectures").

In order to reduce the number of architectures we have to
modify by adding new architecture IO APIs we'll have to review
the architectures in this patch, see why they can't add
asm-generic.h/io.h or issues that would be created by doing
so and then spread a consistent inclusion of this header
towards the end of their own header. For instance arch/metag
includes the asm-generic/io.h *before* the ioremap*()
definitions, this should be the other way around but only
once we have guard wrappers for the non-MMU case also for
asm-generic/io.h.

Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>
---
 arch/avr32/include/asm/io.h   | 1 +
 arch/frv/include/asm/io.h     | 1 +
 arch/m32r/include/asm/io.h    | 1 +
 arch/m68k/include/asm/io_mm.h | 1 +
 arch/mn10300/include/asm/io.h | 1 +
 arch/powerpc/include/asm/io.h | 1 +
 arch/sh/include/asm/io.h      | 1 +
 arch/tile/include/asm/io.h    | 1 +
 8 files changed, 8 insertions(+)

diff --git a/arch/avr32/include/asm/io.h b/arch/avr32/include/asm/io.h
index e998ff5d8e1a..f855646e0db7 100644
--- a/arch/avr32/include/asm/io.h
+++ b/arch/avr32/include/asm/io.h
@@ -297,6 +297,7 @@ extern void __iounmap(void __iomem *addr);
 
 #define ioremap_wc ioremap_nocache
 #define ioremap_wt ioremap_nocache
+#define ioremap_uc ioremap_nocache
 
 #define cached(addr) P1SEGADDR(addr)
 #define uncached(addr) P2SEGADDR(addr)
diff --git a/arch/frv/include/asm/io.h b/arch/frv/include/asm/io.h
index a31b63ec4930..70dfbea8c8d7 100644
--- a/arch/frv/include/asm/io.h
+++ b/arch/frv/include/asm/io.h
@@ -278,6 +278,7 @@ static inline void __iomem *ioremap_fullcache(unsigned long physaddr, unsigned l
 }
 
 #define ioremap_wc ioremap_nocache
+#define ioremap_uc ioremap_nocache
 
 extern void iounmap(void volatile __iomem *addr);
 
diff --git a/arch/m32r/include/asm/io.h b/arch/m32r/include/asm/io.h
index f8de767ce2bc..61b8931bc192 100644
--- a/arch/m32r/include/asm/io.h
+++ b/arch/m32r/include/asm/io.h
@@ -69,6 +69,7 @@ extern void iounmap(volatile void __iomem *addr);
 #define ioremap_nocache(off,size) ioremap(off,size)
 #define ioremap_wc ioremap_nocache
 #define ioremap_wt ioremap_nocache
+#define ioremap_uc ioremap_nocache
 
 /*
  * IO bus memory addresses are also 1:1 with the physical address
diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
index f55cad529400..c98ac81582ac 100644
--- a/arch/m68k/include/asm/io_mm.h
+++ b/arch/m68k/include/asm/io_mm.h
@@ -468,6 +468,7 @@ static inline void __iomem *ioremap_nocache(unsigned long physaddr, unsigned lon
 {
 	return __ioremap(physaddr, size, IOMAP_NOCACHE_SER);
 }
+#define ioremap_uc ioremap_nocache
 static inline void __iomem *ioremap_wt(unsigned long physaddr,
 					 unsigned long size)
 {
diff --git a/arch/mn10300/include/asm/io.h b/arch/mn10300/include/asm/io.h
index 07c5b4a3903b..62189353d2f6 100644
--- a/arch/mn10300/include/asm/io.h
+++ b/arch/mn10300/include/asm/io.h
@@ -283,6 +283,7 @@ static inline void __iomem *ioremap_nocache(unsigned long offset, unsigned long
 
 #define ioremap_wc ioremap_nocache
 #define ioremap_wt ioremap_nocache
+#define ioremap_uc ioremap_nocache
 
 static inline void iounmap(void __iomem *addr)
 {
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index a8d2ef30d473..5879fde56f3c 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -721,6 +721,7 @@ extern void __iomem *ioremap_prot(phys_addr_t address, unsigned long size,
 				  unsigned long flags);
 extern void __iomem *ioremap_wc(phys_addr_t address, unsigned long size);
 #define ioremap_nocache(addr, size)	ioremap((addr), (size))
+#define ioremap_uc(addr, size)		ioremap((addr), (size))
 
 extern void iounmap(volatile void __iomem *addr);
 
diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index 728c4c571f40..93ec9066dbef 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -368,6 +368,7 @@ static inline int iounmap_fixed(void __iomem *addr) { return -EINVAL; }
 #endif
 
 #define ioremap_nocache	ioremap
+#define ioremap_uc	ioremap
 #define iounmap		__iounmap
 
 /*
diff --git a/arch/tile/include/asm/io.h b/arch/tile/include/asm/io.h
index dc61de15c1f9..322b5fe94781 100644
--- a/arch/tile/include/asm/io.h
+++ b/arch/tile/include/asm/io.h
@@ -55,6 +55,7 @@ extern void iounmap(volatile void __iomem *addr);
 #define ioremap_nocache(physaddr, size)		ioremap(physaddr, size)
 #define ioremap_wc(physaddr, size)		ioremap(physaddr, size)
 #define ioremap_wt(physaddr, size)		ioremap(physaddr, size)
+#define ioremap_uc(physaddr, size)		ioremap(physaddr, size)
 #define ioremap_fullcache(physaddr, size)	ioremap(physaddr, size)
 
 #define mmiowb()
-- 
2.3.2.209.gd67f9d5.dirty
