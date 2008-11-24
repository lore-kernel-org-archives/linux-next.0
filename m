From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: linux-next: net tree build failure
Date: Mon, 24 Nov 2008 13:52:51 -0800
Message-ID: <20081124135251.51196003@extreme>
References: <20081124154938.bac22cd5.sfr@canb.auug.org.au>
	<20081123.210452.160784844.davem@davemloft.net>
	<20081124162044.f3333fcf.sfr@canb.auug.org.au>
	<20081123.212339.131214270.davem@davemloft.net>
	<20081124163844.004469a6.sfr@canb.auug.org.au>
	<20081124210028.GA32585@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.vyatta.com ([76.74.103.46]:55166 "EHLO mail.vyatta.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754074AbYKXVxD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 16:53:03 -0500
In-Reply-To: <20081124210028.GA32585@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org

On Mon, 24 Nov 2008 22:00:28 +0100
Sam Ravnborg <sam@ravnborg.org> wrote:

> On Mon, Nov 24, 2008 at 04:38:44PM +1100, Stephen Rothwell wrote:
> > On Sun, 23 Nov 2008 21:23:39 -0800 (PST) David Miller <davem@davemloft.net> wrote:
> > >
> > > Probably it didn't build for some obscure reason a long time
> > > ago.  I'll try to get it turned back on, but better is to
> > > bring it in via drivers/Kconfig don't you think? :-)
> > 
> > Only if you test build all the other architectures that currently don't
> > include it. :-)
> 
> Stephen, could I ask you to try to do so?
> You have the infrastructure to do it.
> 
> I would love to see any simplification of the nightmare
> of Kconfig files we have.
> 
> 
> I have only: arm, x86, sparc sparc64, alpha here so that
> does not give any decent enough coverage.
> 
> And my current Linux box is a Pentium 850 MHz so it would take
> forever...
> 
> 	Sam

I will try and run 'make all modconfig' on x86, I don't have volunteer
time to do cross build of all architectures. But isn't the purpose
of linux-next to find/fix these things. If linux-net has to be perfect
every minute then there is no purpose in having it.
