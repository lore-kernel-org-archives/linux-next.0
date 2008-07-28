From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Mon, 28 Jul 2008 13:53:36 +0100
Message-ID: <20080728125336.GL32366@flint.arm.linux.org.uk>
References: <20080630125110.1dc5689a.akpm@linux-foundation.org> <1214901131.29199.31.camel@pc1117.cambridge.arm.com> <20080701014529.272706d8.akpm@linux-foundation.org> <1216829155.23395.19.camel@pc1117.cambridge.arm.com> <20080723130140.ff016944.akpm@linux-foundation.org> <1216847422.6550.8.camel@localhost.localdomain> <20080723151045.bcae107e.akpm@linux-foundation.org> <20080727110804.GE32366@flint.arm.linux.org.uk> <1217245511.20282.121.camel@pc1117.cambridge.arm.com> <1217248855.20282.124.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40643 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750889AbYG1Myp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Jul 2008 08:54:45 -0400
Content-Disposition: inline
In-Reply-To: <1217248855.20282.124.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk

On Mon, Jul 28, 2008 at 01:40:55PM +0100, Catalin Marinas wrote:
> On Mon, 2008-07-28 at 12:45 +0100, Catalin Marinas wrote:
> > On Sun, 2008-07-27 at 12:08 +0100, Russell King - ARM Linux wrote:
> > > On Wed, Jul 23, 2008 at 03:10:45PM -0700, Andrew Morton wrote:
> > > > Well.  Rather than doing things sequentially we could go parallel. 
> > > > Russell could say "I'll look at them before 2.6.28 but please put them
> > > > into linux-next meanwhile".
> > > 
> > > There have been some valid but (iirc) non-vocal objections to the
> > > Thumb-2 support from a few people.  The biggest one is all the
> > > mess associated with supporting this "unified" assembler stuff.
> > 
> > My first implementation of these patches (last year) created a separate
> > arch/ directory and a lot of people objected to this recommending to
> > merge it into the existing arch/arm. Once I posted the re-worked
> > implementation there were no big .
> 
> It looks like I didn't finish the above phrase - I meant no big
> objections to the conditional compilation or someone stating clearly
> that this is unacceptable.

And that's partly what I find rather frustrating.  I _know_ that people
have issues with it, but they haven't raised them.
