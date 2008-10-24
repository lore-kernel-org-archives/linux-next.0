From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: Current suspend issues on Lenovo X200 (w/ Intel graphics)
Date: Fri, 24 Oct 2008 20:02:48 +0200
Message-ID: <20081024180248.GH22217@kernel.dk>
References: <20081023204326.GB4175@denkbrett.schottelius.org> <200810240911.05193.rjw@sisk.pl> <20081024130130.GA5816@denkbrett.schottelius.org> <200810241630.52740.andres@anarazel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:34670 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751198AbYJXSDu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Oct 2008 14:03:50 -0400
Content-Disposition: inline
In-Reply-To: <200810241630.52740.andres@anarazel.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andres Freund <andres@anarazel.de>
Cc: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Nigel Cunningham <ncunningham@crca.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jesse Barnes <jbarnes@virtuousgeek.org>

On Fri, Oct 24 2008, Andres Freund wrote:
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

No go, same for me on x60 on ubuntu 8.10-rc1.

--=20
Jens Axboe
