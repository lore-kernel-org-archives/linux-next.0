From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: manual merge of the rr tree
Date: Fri, 9 Jan 2009 08:42:09 -0600 (CST)
Message-ID: <Pine.LNX.4.64.0901090836530.32079@quilx.com>
References: <Pine.LNX.4.64.0901081514360.13768@quilx.com>
 <20090108214908.GJ496@one.firstfloor.org> <Pine.LNX.4.64.0901081539360.14124@quilx.com>
 <20090108.142510.263686170.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi025.sbcis.sbc.com ([207.115.36.54]:50406 "EHLO
	nlpi025.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753791AbZAIOm5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Jan 2009 09:42:57 -0500
In-Reply-To: <20090108.142510.263686170.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: andi@firstfloor.org, rusty@rustcorp.com.au, sfr@canb.auug.org.au, linux-next@vger.kernel.org, travis@sgi.com, mingo@elte.hu, rth@twiddle.net, akpm@linux-foundation.org

On Thu, 8 Jan 2009, David Miller wrote:

> > The wrapping is okay on platforms that use straight 2 complement without
> > additional tricks in high bits. Some platforms do not wrap.
>
> It's not okay for loop termination conditions and that's where GCC
> takes advantage of this invariant.

Can you give me a concrete code example?

> Otherwise, if overflow is possible, tranforming an array index
> comparison into a pointer comparison is no longer legal.

This means that access to an object immediately before or after would wrap
around. If the object is not near 0 or near the end of the address space
then such a thing cannot occur. We have the ZERO page at address 0 so the
lower end is taken care and usually there are also special uses for very
high addresses.

The wrapping is mainly an issue if the percpu area is linked to very high
addresses but later the per cpu areas for the individual processors are
allocated on relatively low addresses. The address calculation of the
location of a percpu address for a particular cpu then occurs by
adding an offset that will wrap around zero. This is fine on x86.
