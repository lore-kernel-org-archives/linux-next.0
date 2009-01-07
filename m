From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Wed, 7 Jan 2009 10:11:12 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0901070858260.8329@quilx.com>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au>
 <200901061134.49369.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901060845001.11819@quilx.com>
 <200901071317.29141.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi053.sbcis.sbc.com ([207.115.36.82]:57580 "EHLO
	nlpi053.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524AbZAGQMk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Jan 2009 11:12:40 -0500
In-Reply-To: <200901071317.29141.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, andi@firstfloor.org

On Wed, 7 Jan 2009, Rusty Russell wrote:

> > +   famous:
> > +	strcpy(s, "xxx"+X) => memcpy(s, "xxx"+X, 4-X) */
> > +#define reloc_hide(var, off)						\
> > +  ({ __typeof__(&(var)) __ptr;					\
> > +    __asm__ ("" : "=g"(__ptr) : "0"((void *)&(var) + (off)));	\
> > +    *__ptr; })
> >
> > I dont get the point here.
>
> This one example of gcc making assumptions about pointer arithmetic.  It's
> perfectly reasonable.  It's also unhelpful cases like for per-cpu offsets.

What assumption does GCC make that would cause problems?

> Thus we use this macro to prevent GCC from making such assumptions.

Never seen any ill effect from just using a pointer recast and add.

> We can't audit current and future gcc versions to see what other
> optimizations might break our code on every arch.  I just documented it,
> and followed Richard's advice.
>
> Am I missing a downside?

GCC cannot optimize the pointer arithmetic with the strange asm code. It
seems that no one really knows what the exact purpose of RELOC_HIDE is.

One issue may be that issue of pointer into an object not being valid if
they are made to point outside of the object?

> > Could we clearly document what the point of RELOC_HIDE is?
>
> Sorry, I'm not sure I can improve on the current comment:
>
> /* This macro obfuscates arithmetic on a variable address so that gcc
>    shouldn't recognize the original var, and make assumptions about it */

What assumptions? Obviously you still want the linker relocation to
happen.
