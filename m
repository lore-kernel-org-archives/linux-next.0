From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 08:58:18 +0000
Message-ID: <20160215085818.GC10826@n2100.arm.linux.org.uk>
References: <20160214165010.GA3189@roeck-us.net>
 <20160214195501.GA12289@pengutronix.de>
 <20160214200755.GB10826@n2100.arm.linux.org.uk>
 <20160215081750.GD12289@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160215081750.GD12289@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 15, 2016 at 09:17:50AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Russell,
>=20
> On Sun, Feb 14, 2016 at 08:07:55PM +0000, Russell King - ARM Linux wr=
ote:
> > On Sun, Feb 14, 2016 at 08:55:01PM +0100, Uwe Kleine-K=F6nig wrote:
> > > So the unexpected abnormality here is that even though this devic=
e is
> > > instantiated by dt, the driver doesn't provide any compatibles.
> > > Either my expectation is wrong, then 67d02a1bbb33455 should be re=
verted
> >=20
> > Your expectation is wrong.  AMBA primecell devices have hardware ID=
s
> > and are matched to their drivers by those IDs.  Just like PCI.
>=20
> pci devices don't appear in dt, do they? I don't see the connection
> between amba devices and platform devices, see my other mail in this
> thread for some more details.

They both have hardware IDs, and they are both matched via those hardwa=
re
IDs.

Your change has introduced a regression and is therefore wrong.

--=20
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
=46TTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
