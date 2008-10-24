From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: Current suspend issues on Lenovo X200 (w/ Intel graphics)
Date: Fri, 24 Oct 2008 09:11:04 +0200
Message-ID: <200810240911.05193.rjw@sisk.pl>
References: <20081023204326.GB4175@denkbrett.schottelius.org> <200810240006.19857.rjw@sisk.pl> <1224817394.6623.12.camel@nigel-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:42597 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751876AbYJXHGg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Oct 2008 03:06:36 -0400
In-Reply-To: <1224817394.6623.12.camel@nigel-laptop>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nigel Cunningham <ncunningham@crca.org.au>, Nico Schottelius <nico-linux-next@schottelius.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jesse Barnes <jbarnes@virtuousgeek.org>

On Friday, 24 of October 2008, Nigel Cunningham wrote:
> Hey Rafael :)
>=20
> On Fri, 2008-10-24 at 00:06 +0200, Rafael J. Wysocki wrote:
> > On Thursday, 23 of October 2008, Nico Schottelius wrote:
> > > First of all, this was wrong:
> > >=20
> > > Nico -telmich- Schottelius [Thu, Oct 23, 2008 at 10:43:26PM +0200=
]:
> > > >  - 2.6.27: system freeze instead of wakeup
> > > >    -> shows parts of the X screen, but does not react on ping
> > >=20
> > > System does not freeze, but reboots instead.
> > >=20
> > > Tried next-20081023 and 2.6.27 with acpi_sleep=3Ds3_bios:
> > >=20
> > > - suspend and wakeup on console works fine for both!
> > > - no X running on next
> > > - 2.6.27 + X -> reboot on wakeup
> >=20
> > Let me guess, you have a NVidia graphics?
>=20
> Not this time. Going off the other log he posted, it's...
>=20
> Chipset Mobile Intel=C2=AE GM45 Express Chipset found

This is going to be interesting. :-)

Nico, if the system is 64-bit, I'd recommend trying .28-rc1.

Thanks,
Rafael
