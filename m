From: Andi Kleen <andi@firstfloor.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Wed, 7 Jan 2009 18:20:51 +0100
Message-ID: <20090107172051.GK496@one.firstfloor.org>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901061134.49369.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901060845001.11819@quilx.com> <200901071317.29141.rusty@rustcorp.com.au> <Pine.LNX.4.64.0901070858260.8329@quilx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:35385 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbZAGRGz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Jan 2009 12:06:55 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0901070858260.8329@quilx.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, andi@firstfloor.org

> > This one example of gcc making assumptions about pointer arithmetic.  It's
> > perfectly reasonable.  It's also unhelpful cases like for per-cpu offsets.
> 
> What assumption does GCC make that would cause problems?

The C standard says that arithmetic on pointers in defined objects outside
the boundaries of these objects (except for the special case of one beyond 
the end for arrays) is undefined. The gcc optimizers take advantage
of this by assuming that such arithmetic doesn't wrap (and might have other
assumptions)

> 
> > Thus we use this macro to prevent GCC from making such assumptions.
> 
> Never seen any ill effect from just using a pointer recast and add.

One concrete miscompilation has been observed on PPC a couple
of years ago, so it was decided to try to avoid this on all
architectures.
> 
> One issue may be that issue of pointer into an object not being valid if
> they are made to point outside of the object?

"undefined" yes.

-Andi
-- 
ak@linux.intel.com
