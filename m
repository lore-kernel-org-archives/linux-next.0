From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 8 Jan 2009 16:21:32 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0901081539360.14124@quilx.com>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au>
 <200901061134.49369.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901060845001.11819@quilx.com>
 <200901071317.29141.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901070858260.8329@quilx.com>
 <20090107172051.GK496@one.firstfloor.org> <Pine.LNX.4.64.0901071300430.8329@quilx.com>
 <20090108204835.GI496@one.firstfloor.org> <Pine.LNX.4.64.0901081514360.13768@quilx.com>
 <20090108214908.GJ496@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi053.sbcis.sbc.com ([207.115.36.82]:41077 "EHLO
	nlpi053.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754290AbZAHWWT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jan 2009 17:22:19 -0500
In-Reply-To: <20090108214908.GJ496@one.firstfloor.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, akpm@linux-foundation.org

On Thu, 8 Jan 2009, Andi Kleen wrote:

> On Thu, Jan 08, 2009 at 03:15:48PM -0600, Christoph Lameter wrote:
> > This also then means that RELOC_HIDE can simply be pointer arithmetic on
> > non PPC, right?
>
> No, the C standard and the gcc optimizer are the same on all architectures.

The wrapping is okay on platforms that use straight 2 complement without
additional tricks in high bits. Some platforms do not wrap.

No need to stop the cc optimizer from optimizing pointer addition there.
The C compiler can generate more effective code if we do not go through
this asm segment. See how RELOC_HIDE is defined for the icc and
in include/linux/gcc.h.

Also: Would it not be better to rename RELOC_HIDE. To
ADD_POINTER_OFFSET_BEYOND_OBJECT_BOUNDARY or so?

What are the following uses of RELOC_HIDE to add a zero offset. Certainly
they have nothing to do with wrapping.

arch/mips/include/asm/page.h:#define __pa_symbol(x)
__pa(RELOC_HIDE((unsigned long)(x), 0))
arch/sh/include/asm/system.h:   struct pt_regs *regs = RELOC_HIDE(&__regs,
0);  \
arch/x86/include/asm/page_32.h:#define __phys_reloc_hide(x)
RELOC_HIDE((x), 0)

Guess we assume that GCC is passing some magic with a pointer that is
not lost when casting it?

What kind of magical properties are these? Address invalidation is messed
up in gcc and just icc does it right?
