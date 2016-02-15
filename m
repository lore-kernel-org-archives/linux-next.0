From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 11:10:14 +0100
Message-ID: <20160215101014.GG12289@pengutronix.de>
References: <20160214165010.GA3189@roeck-us.net>
 <20160214195501.GA12289@pengutronix.de>
 <20160214200755.GB10826@n2100.arm.linux.org.uk>
 <20160215081750.GD12289@pengutronix.de>
 <20160215085818.GC10826@n2100.arm.linux.org.uk>
 <20160215091406.GE12289@pengutronix.de>
 <20160215100415.GD10826@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:55188 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751136AbcBOKKT (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 05:10:19 -0500
Content-Disposition: inline
In-Reply-To: <20160215100415.GD10826@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

Hello Russell,

On Mon, Feb 15, 2016 at 10:04:15AM +0000, Russell King - ARM Linux wrot=
e:
> On Mon, Feb 15, 2016 at 10:14:06AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Mon, Feb 15, 2016 at 08:58:18AM +0000, Russell King - ARM Linux =
wrote:
> > > On Mon, Feb 15, 2016 at 09:17:50AM +0100, Uwe Kleine-K=F6nig wrot=
e:
> > > > On Sun, Feb 14, 2016 at 08:07:55PM +0000, Russell King - ARM Li=
nux wrote:
> > > > > On Sun, Feb 14, 2016 at 08:55:01PM +0100, Uwe Kleine-K=F6nig =
wrote:
> > > > > > So the unexpected abnormality here is that even though this=
 device is
> > > > > > instantiated by dt, the driver doesn't provide any compatib=
les.
> > > > > > Either my expectation is wrong, then 67d02a1bbb33455 should=
 be reverted
> > > > >=20
> > > > > Your expectation is wrong.  AMBA primecell devices have hardw=
are IDs
> > > > > and are matched to their drivers by those IDs.  Just like PCI=
=2E
> > > >=20
> > > > pci devices don't appear in dt, do they? I don't see the connec=
tion
> > > > between amba devices and platform devices, see my other mail in=
 this
> > > > thread for some more details.
> > >=20
> > > They both have hardware IDs, and they are both matched via those =
hardware
> > > IDs.
> >=20
> > I changed platform_match which is about matching by dt compatible, =
acpi
> > and/or device name. I don't see how this can affect an amba device =
given
> > they match to a driver by a hardware id.
> >=20
> > > Your change has introduced a regression and is therefore wrong.
> >=20
> > I'd like to understand though why and how my commit is wrong to be =
able
> > to fix it instead of getting it reverted.
>=20
> I don't have the commit, and I haven't seen the patch so I can't
> comment further, sorry.

It's in -next. For a quick look:

	https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D67d02a1bbb33455

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
