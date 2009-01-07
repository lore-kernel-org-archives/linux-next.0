From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Wed, 7 Jan 2009 13:17:28 +1030
Message-ID: <200901071317.29141.rusty@rustcorp.com.au>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901061134.49369.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901060845001.11819@quilx.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:48273 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755428AbZAGCre (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 21:47:34 -0500
In-Reply-To: <Pine.LNX.4.64.0901060845001.11819@quilx.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, andi@firstfloor.org

On Wednesday 07 January 2009 01:35:57 Christoph Lameter wrote:
> +/* This macro obfuscates arithmetic on a variable address so that gcc
> +   shouldn't recognize it. This prevents optimizations such as the
> +   famous:
> +	strcpy(s, "xxx"+X) => memcpy(s, "xxx"+X, 4-X) */
> +#define reloc_hide(var, off)						\
> +  ({ __typeof__(&(var)) __ptr;					\
> +    __asm__ ("" : "=g"(__ptr) : "0"((void *)&(var) + (off)));	\
> +    *__ptr; })
> 
> I dont get the point here.

This one example of gcc making assumptions about pointer arithmetic.  It's
perfectly reasonable.  It's also unhelpful cases like for per-cpu offsets.

Thus we use this macro to prevent GCC from making such assumptions.

We can't audit current and future gcc versions to see what other
optimizations might break our code on every arch.  I just documented it,
and followed Richard's advice.

Am I missing a downside?

> Could we clearly document what the point of RELOC_HIDE is?

Sorry, I'm not sure I can improve on the current comment:

/* This macro obfuscates arithmetic on a variable address so that gcc
   shouldn't recognize the original var, and make assumptions about it */

Cheers,
Rusty.
