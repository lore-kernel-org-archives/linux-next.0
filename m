From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 08 Jan 2009 14:25:10 -0800 (PST)
Message-ID: <20090108.142510.263686170.davem@davemloft.net>
References: <Pine.LNX.4.64.0901081514360.13768@quilx.com>
	<20090108214908.GJ496@one.firstfloor.org>
	<Pine.LNX.4.64.0901081539360.14124@quilx.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:34565
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754443AbZAHWZI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Jan 2009 17:25:08 -0500
In-Reply-To: <Pine.LNX.4.64.0901081539360.14124@quilx.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: cl@linux-foundation.org
Cc: andi@firstfloor.org, rusty@rustcorp.com.au, sfr@canb.auug.org.au, linux-next@vger.kernel.org, travis@sgi.com, mingo@elte.hu, rth@twiddle.net, akpm@linux-foundation.org

From: Christoph Lameter <cl@linux-foundation.org>
Date: Thu, 8 Jan 2009 16:21:32 -0600 (CST)

> On Thu, 8 Jan 2009, Andi Kleen wrote:
> 
> > On Thu, Jan 08, 2009 at 03:15:48PM -0600, Christoph Lameter wrote:
> > > This also then means that RELOC_HIDE can simply be pointer arithmetic on
> > > non PPC, right?
> >
> > No, the C standard and the gcc optimizer are the same on all architectures.
> 
> The wrapping is okay on platforms that use straight 2 complement without
> additional tricks in high bits. Some platforms do not wrap.

It's not okay for loop termination conditions and that's where GCC
takes advantage of this invariant.

Otherwise, if overflow is possible, tranforming an array index
comparison into a pointer comparison is no longer legal.
