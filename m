From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: arm build failure
Date: Sun, 22 Jun 2008 20:00:41 +0100
Message-ID: <20080622190041.GB21340@flint.arm.linux.org.uk>
References: <20080616160747.27909f11.sfr@canb.auug.org.au> <20080616072915.GA17191@flint.arm.linux.org.uk> <20080616173757.4d8ba97a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:56625 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753695AbYFVTBF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 22 Jun 2008 15:01:05 -0400
Content-Disposition: inline
In-Reply-To: <20080616173757.4d8ba97a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Dmitry Baryshkov <dbaryshkov@gmail.com>

On Mon, Jun 16, 2008 at 05:37:57PM +1000, Stephen Rothwell wrote:
> On Mon, 16 Jun 2008 08:29:16 +0100 Russell King <rmk@arm.linux.org.uk> wrote:
> >
> > On Mon, Jun 16, 2008 at 04:07:47PM +1000, Stephen Rothwell wrote:
> > > Hi Russell,
> > > 
> > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > Well, it's going to stay broken for the coming week.  I'm away from
> > today.
> 
> That's OK, I can keep reverting it (or I may try to figure out what
> dependencies it needs).
> 
> Thanks for letting me know.

Okay, this should now be fixed.  Please confirm when you run your next
linux-next build.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
