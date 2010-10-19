From: Daniel Walker <dwalker@fifo99.com>
Subject: Re: linux-next: manual merge of the msm tree with the arm tree
Date: Tue, 19 Oct 2010 12:24:23 -0700
Message-ID: <1287516263.10071.54.camel@c-dwalke-linux.qualcomm.com>
References: <20101018103540.7bd9c535.sfr@canb.auug.org.au>
	 <alpine.LFD.2.00.1010181833440.2764@xanadu.home>
	 <1287442418.5376.38.camel@Joe-Laptop> <201010191518.04147.arnd@arndb.de>
	 <1287507806.10071.16.camel@c-dwalke-linux.qualcomm.com>
	 <alpine.LFD.2.00.1010191314020.2764@xanadu.home>
	 <1287513757.10071.45.camel@c-dwalke-linux.qualcomm.com>
	 <20101019185313.GB11088@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fifo99.com ([67.223.236.141]:34457 "EHLO fifo99.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751092Ab0JSTYy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Oct 2010 15:24:54 -0400
In-Reply-To: <20101019185313.GB11088@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Jeremy Kerr <jeremy.kerr@canonical.com>, Jeff Ohlstein <johlstei@codeaurora.org>

On Tue, 2010-10-19 at 19:53 +0100, Russell King wrote:
> On Tue, Oct 19, 2010 at 11:42:37AM -0700, Daniel Walker wrote:
> > 
> > > That's why on occasions we do transgress the established process to 
> > > accommodate such changes.  Imagine just for a moment the patch that 
> > > modified the interrupt callback prototype to remove the useless pt_regs 
> > > argument.  Obviously, it had to be done atomically to the _whole_ tree, 
> > > and it was agreed that this patch was to be applied at the end of the 
> > > merge window.  But no one expected a single minute sending a CC to _all_ 
> > > the driver authors.
> > 
> > I don't actually know which patch your talking about, but it sounds
> > pretty simple.. I'm not really addressing really simple fixes, even tho
> > changing a single parameter on a function could be done broken up
> > depending on what it is.
> 
> As you think that it's a simple matter, I challenge you to break this
> change up in a way that doesn't result in any build breakage:
> 	7d12e780e003f93433d49ce78cfedf4b4c52adc5

I wasn't saying it's simple to break patches up. I was just saying the
patch sounded like something simple, like running sed over the source or
a change replace type patch.

I'll look at the patch you reference tho, maybe I can break it up.

Daniel
