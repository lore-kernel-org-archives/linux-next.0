From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the rr tree
Date: Fri, 09 Jan 2009 14:54:19 -0800 (PST)
Message-ID: <20090109.145419.168966701.davem@davemloft.net>
References: <Pine.LNX.4.64.0901081539360.14124@quilx.com>
	<20090108.142510.263686170.davem@davemloft.net>
	<Pine.LNX.4.64.0901090836530.32079@quilx.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:49804
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1757343AbZAIWyS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Jan 2009 17:54:18 -0500
In-Reply-To: <Pine.LNX.4.64.0901090836530.32079@quilx.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: cl@linux-foundation.org
Cc: andi@firstfloor.org, rusty@rustcorp.com.au, sfr@canb.auug.org.au, linux-next@vger.kernel.org, travis@sgi.com, mingo@elte.hu, rth@twiddle.net, akpm@linux-foundation.org

From: Christoph Lameter <cl@linux-foundation.org>
Date: Fri, 9 Jan 2009 08:42:09 -0600 (CST)

> On Thu, 8 Jan 2009, David Miller wrote:
> 
> > Otherwise, if overflow is possible, tranforming an array index
> > comparison into a pointer comparison is no longer legal.
> 
> This means that access to an object immediately before or after would wrap
> around. If the object is not near 0 or near the end of the address space
> then such a thing cannot occur. We have the ZERO page at address 0 so the
> lower end is taken care and usually there are also special uses for very
> high addresses.

GCC, or any compiler, cannot know about such invariants.
What it does know is that it can always transform
comparisons between "i" and "max_i" into comparisons
between '&array[i]' and '&array[max_i]'

> The wrapping is mainly an issue if the percpu area is linked to very high
> addresses but later the per cpu areas for the individual processors are
> allocated on relatively low addresses. The address calculation of the
> location of a percpu address for a particular cpu then occurs by
> adding an offset that will wrap around zero. This is fine on x86.

Anyways, the original reason for the RELOC_HIDE business is that GCC
would do common subexpression elimination on the address computation.
The percpu stuff was a calculation using a symbol address as some kind
of base, and GCC took liberties with that (which were legal given
the amount of information we (weren't) giving to it).

I honestly forget the exact details, I'm sure Rusty could explain...
