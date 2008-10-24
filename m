From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: Current suspend issues on Lenovo X200 (w/ Intel graphics)
Date: Fri, 24 Oct 2008 20:26:39 +0200
Message-ID: <200810242026.40503.rjw@sisk.pl>
References: <20081023204326.GB4175@denkbrett.schottelius.org> <20081024130130.GA5816@denkbrett.schottelius.org> <200810241630.52740.andres@anarazel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:47372 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751092AbYJXSWT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Oct 2008 14:22:19 -0400
In-Reply-To: <200810241630.52740.andres@anarazel.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andres Freund <andres@anarazel.de>
Cc: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, Nigel Cunningham <ncunningham@crca.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jesse Barnes <jbarnes@virtuousgeek.org>, Mikael Abrahamsson <swmike@swm.pp.se>

On Friday, 24 of October 2008, Andres Freund wrote:
> On Friday 24 October 2008 15:01:31 Nico -telmich- Schottelius wrote:
> > > > Chipset Mobile Intel=AE GM45 Express Chipset found
> > > This is going to be interesting. :-)
> > > Nico, if the system is 64-bit, I'd recommend trying .28-rc1.
> > Yes, I'm on amd64;
> > As seen on my other post: xorg does not run on .28-rc1
> The kernel has a fix for memory management for GM45 cards since 2.6.2=
8-rc1=20
> which require a newer driver, so trying this may be benifical (patch =
in reply=20
> to your first post).

Nico, Mikael, if the Andres' patch doesn't help, please add the output =
of
lspci -vv from Lenovo X200 and a boot log into
http://bugzilla.kernel.org/show_bug.cgi?id=3D11220 .

Also, if you are able to get a debugging info from the box right before=
 the
failure, it may help a lot.

Thanks,
Rafael
