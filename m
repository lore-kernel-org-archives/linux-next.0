From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: linux-next: build warning after merge of the arm tree
Date: Wed, 29 Nov 2017 01:58:23 -0500 (EST)
Message-ID: <nycvar.YSQ.7.76.1711290121350.5925@knanqh.ubzr>
References: <20171129101637.1e4c7af3@canb.auug.org.au> <20171128231959.GU8052@flint.armlinux.org.uk> <20171129103805.767cc813@canb.auug.org.au> <20171128234111.GB19925@flint.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171128234111.GB19925@flint.armlinux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <rmk@armlinux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: linux-next.vger.kernel.org

On Tue, 28 Nov 2017, Russell King wrote:

> On Wed, Nov 29, 2017 at 10:38:05AM +1100, Stephen Rothwell wrote:
> > Hi Russell,
> > 
> > On Tue, 28 Nov 2017 23:19:59 +0000 Russell King <rmk@armlinux.org.uk> wrote:
> > >
> > > Stephen, which binutils version are you using?
> > 
> > GNU ld (GNU Binutils) 2.25.2
> > 
> > built from upstream source some time ago.
> 
> Hmm, so slightly younger than mine (2.25) which also generates the
> warnings.

Well... somehow I failed to notice those warning when I initially tested 
the patch. Sorry about that.

Now that I do see those warnings, that patch just needs the following to 
"fix" them the way they just like we already do for a Thumb2 build:

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 80351e505f..e83f5161fd 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -115,9 +115,11 @@ ifeq ($(CONFIG_ARM_UNWIND),y)
 CFLAGS_ABI	+=-funwind-tables
 endif
 
+# Accept old syntax despite ".syntax unified"
+AFLAGS_NOWARN	:=$(call as-option,-Wa$(comma)-mno-warn-deprecated,-Wa$(comma)-W)
+
 ifeq ($(CONFIG_THUMB2_KERNEL),y)
 AFLAGS_AUTOIT	:=$(call as-option,-Wa$(comma)-mimplicit-it=always,-Wa$(comma)-mauto-it)
-AFLAGS_NOWARN	:=$(call as-option,-Wa$(comma)-mno-warn-deprecated,-Wa$(comma)-W)
 CFLAGS_ISA	:=-mthumb $(AFLAGS_AUTOIT) $(AFLAGS_NOWARN)
 AFLAGS_ISA	:=$(CFLAGS_ISA) -Wa$(comma)-mthumb
 # Work around buggy relocation from gas if requested:
@@ -125,7 +127,7 @@ ifeq ($(CONFIG_THUMB2_AVOID_R_ARM_THM_JUMP11),y)
 KBUILD_CFLAGS_MODULE	+=-fno-optimize-sibling-calls
 endif
 else
-CFLAGS_ISA	:=$(call cc-option,-marm,)
+CFLAGS_ISA	:=$(call cc-option,-marm,) $(AFLAGS_NOWARN)
 AFLAGS_ISA	:=$(CFLAGS_ISA)
 endif
 

New patch submitted.


Nicolas
