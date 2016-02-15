From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 08:49:37 -0800
Message-ID: <20160215164937.GC25556@kroah.com>
References: <20160214165010.GA3189@roeck-us.net>
 <20160215105909.GH12289@pengutronix.de>
 <56C1CE95.6020206@arm.com>
 <20160215144344.GF10826@n2100.arm.linux.org.uk>
 <20160215162753.GI12289@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:37048 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752085AbcBOQti (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2016 11:49:38 -0500
Content-Disposition: inline
In-Reply-To: <20160215162753.GI12289@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Robin Murphy <robin.murphy@arm.com>, Guenter Roeck <linux@roeck-us.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Mon, Feb 15, 2016 at 05:27:53PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Russell,
>=20
> On Mon, Feb 15, 2016 at 02:43:44PM +0000, Russell King - ARM Linux wr=
ote:
> > On Mon, Feb 15, 2016 at 01:11:49PM +0000, Robin Murphy wrote:
> > > FWIW the PL180 on my Juno still works fine with this patch picked=
 on top of
> > > -rc3, so the issue would seem to be something else - From a quick=
 comparison
> > > between the DTs I see a slight difference in compatible strings f=
or the
> > > clocks, but the more likely-looking suspect is that the VExpress =
DT
> > > references some GPIOs where the Juno DT doesn't.
> >=20
> > Maybe it would be a good idea that Uwe creates a patch which initia=
lly
> > warns when a DT platform device falls back to matching via the plat=
form
> > strings?
> >=20
> > It's likely that the "basic subsystem" platform drivers are silent =
when
> > they probe, so having notification of a fallback would at least put
> > something into the kernel log when that happens - and then later ch=
ange
> > that to be a hard failure (as Uwe is trying to do with his patch.)
> >=20
> > However, I have to bring up another point: is what Uwe is trying to=
 do
> > actually the right thing?  The DT platform device code has the abil=
ity
> > to create standard platform devices from DT, with an of_node, but w=
ith
> > standard names, and platform data.  It's there for compatibility wi=
th
> > older systems, and is there to allow systems to be transitioned ove=
r.
> >=20
> > This patch breaks all that: despite the DT code changing the platfo=
rm
> > device bus_id from the address.nodename format to the standard form=
at
> > (thus allowing unconverted platform drivers to match), this patch
> > means that because the platform device has a of_node attached, this
> > will now fail.
> >=20
> > Therefore, I think Uwe's patch is just wrong - or, if it's somethin=
g we
> > want, the auxdata table support code needs to _also_ be ripped out =
of
> > the drivers/of/platform.c code, but that then means anyone who want=
s to
> > go through the conversion has a big flag-day change to go through.
>=20
> That's a valid concern I wasn't aware of when I created the patch.
>=20
> So maybe just emitting a warning as you suggested is a good idea. And
> additionally only emit it when the driver is dt aware, too.
>=20
> Greg, can you drop this patch, or do you need a proper changelog for =
a
> revert? On top of that I'd then create a new patch which is more
> conservative.

A hint as to what the git commit id was would be helpful, I can just
revert it based on that.

thanks,

greg k-h
