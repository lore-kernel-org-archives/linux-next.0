From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: manual merge of the kmemleak tree with the x86 tree
Date: Thu, 07 May 2009 11:37:51 +0100
Message-ID: <1241692671.6648.12.camel@pc1117.cambridge.arm.com>
References: <20090507155444.47dd74ea.sfr@canb.auug.org.au>
	 <20090507092310.GA27707@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:36582 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750981AbZEGKjp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 06:39:45 -0400
In-Reply-To: <20090507092310.GA27707@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>

On Thu, 2009-05-07 at 11:23 +0200, Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
> > index 4c85b2e..0bbb2d1 100644
> > --- a/arch/x86/kernel/vmlinux.lds.S
> > +++ b/arch/x86/kernel/vmlinux.lds.S
> > @@ -107,6 +107,7 @@ SECTIONS
> >  
> >  	/* Data */
> >  	. = ALIGN(PAGE_SIZE);
> > +	_sdata = .;			/* Start of data section */
> >  	.data : AT(ADDR(.data) - LOAD_OFFSET) {
> >  		DATA_DATA
> >  		CONSTRUCTORS
> 
> At a quick glance, that line should be moved a line further down, to 
> avoid a boot crash of linux-next with CONFIG_RELOCATABLE=y (which 
> most distros ship with).

Fixed, see below (and changed Acked-by back to Cc).

> The kmemleak tree change should be submitted to the x86 tree as 
> well, so we can merge it properly.

OK, once you are fine with its new form.

> (it's fine if the kmemleak tree 
> has that commit too [it obviously needs it] - so there will still be 
> a conflict - just the resolution will be a straightforward 'pick the 
> x86 tree side' step.)

There may not be a conflict if the changes are identical (but it depends
on what else is in the x86 tree).


x86: Provide _sdata in the vmlinux_*.lds.S files

From: Catalin Marinas <catalin.marinas@arm.com>

_sdata is a common symbol defined by many architectures and made
available to the kernel via asm-generic/sections.h. Kmemleak uses this
symbol when scanning the data sections.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ingo Molnar <mingo@elte.hu>
---
 arch/x86/kernel/vmlinux_32.lds.S |    1 +
 arch/x86/kernel/vmlinux_64.lds.S |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kernel/vmlinux_32.lds.S b/arch/x86/kernel/vmlinux_32.lds.S
index 62ad500..171a534 100644
--- a/arch/x86/kernel/vmlinux_32.lds.S
+++ b/arch/x86/kernel/vmlinux_32.lds.S
@@ -64,6 +64,7 @@ SECTIONS
   /* writeable */
   . = ALIGN(PAGE_SIZE);
   .data : AT(ADDR(.data) - LOAD_OFFSET) {	/* Data */
+  _sdata = .;			/* Start of data section */
 	DATA_DATA
 	CONSTRUCTORS
 	} :data
diff --git a/arch/x86/kernel/vmlinux_64.lds.S b/arch/x86/kernel/vmlinux_64.lds.S
index c874250..121319f 100644
--- a/arch/x86/kernel/vmlinux_64.lds.S
+++ b/arch/x86/kernel/vmlinux_64.lds.S
@@ -59,6 +59,7 @@ SECTIONS
   . = ALIGN(PAGE_SIZE);		/* Align data segment to page size boundary */
 				/* Data */
   .data : AT(ADDR(.data) - LOAD_OFFSET) {
+  _sdata = .;			/* Start of data section */
 	DATA_DATA
 	CONSTRUCTORS
 	_edata = .;			/* End of data section */


-- 
Catalin
