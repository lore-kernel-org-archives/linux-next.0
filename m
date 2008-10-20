From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Mon, 20 Oct 2008 11:45:15 -0700
Message-ID: <20081020184515.GA15359@kroah.com>
References: <20081014145917.708bace4.sfr@canb.auug.org.au> <20081016160503.GB27769@kroah.com> <20081016213613.GB11876@doriath.ww600.siemens.net> <20081017112610.83a67160.sfr@canb.auug.org.au> <bc64b4640810161741g5329d8c1od6910f05352370b8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:58351 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753189AbYJTT3T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 15:29:19 -0400
Content-Disposition: inline
In-Reply-To: <bc64b4640810161741g5329d8c1od6910f05352370b8@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry <dbaryshkov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Fri, Oct 17, 2008 at 04:41:50AM +0400, Dmitry wrote:
> 2008/10/17 Stephen Rothwell <sfr@canb.auug.org.au>:
> > Hi Dmitry,
> >
> > On Fri, 17 Oct 2008 01:36:13 +0400 Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> >>
> >> After few tries I can come with pretty simple but pretty strange solution:
> >>
> >> >From 1c6dd41e074c5f526fc29b00a2bf265497d2819d Mon Sep 17 00:00:00 2001
> >> From: Dmitry Baryshkov <dbaryshkov@gmail.com>
> >> Date: Fri, 17 Oct 2008 01:30:15 +0400
> >> Subject: [PATCH] USB: unbreak recursive dependancy
> >>
> >> After addition of TMIO usb driver Kconfig sees the recursive dependency
> >> Break it by rephrasing ARCH_PNX4008 OHCI deps.
> >
> > I will add this to today's linux-next, thanks.
> 
> Thank you. However I suggest to take this as a precaution. As kernel
> grows, various interdeps
> also grow. I fear that soon we will have to rewrite Kconfig
> depencencies to take care
> upon impossible combinations of symbols (the chain that raised this
> topic is impossible,
> as I said before).

I've merged this into the original offending patch now so that there are
no build breakages.

thanks,

greg k-h
