From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 13:03:08 -0800
Message-ID: <20160215210308.GA12095@kroah.com>
References: <20160214165010.GA3189@roeck-us.net>
 <20160215105909.GH12289@pengutronix.de>
 <56C1CE95.6020206@arm.com>
 <20160215144344.GF10826@n2100.arm.linux.org.uk>
 <20160215162753.GI12289@pengutronix.de>
 <20160215164937.GC25556@kroah.com>
 <20160215171201.GK12289@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160215171201.GK12289@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Robin Murphy <robin.murphy@arm.com>, Guenter Roeck <linux@roeck-us.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Mon, Feb 15, 2016 at 06:12:01PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello Greg,
>=20
> On Mon, Feb 15, 2016 at 08:49:37AM -0800, Greg Kroah-Hartman wrote:
> > On Mon, Feb 15, 2016 at 05:27:53PM +0100, Uwe Kleine-K=F6nig wrote:
> > > Greg, can you drop this patch, or do you need a proper changelog =
for a
> > > revert? On top of that I'd then create a new patch which is more
> > > conservative.
> >=20
> > A hint as to what the git commit id was would be helpful, I can jus=
t
> > revert it based on that.
>=20
> This is 67d02a1bbb33 ("driver-core: platform: probe of-devices only
> using list of compatibles")
>=20
> If you need a log, something like:
>=20
> 	Reallow binding of of-devices by name
>=20
> 	It turned out that there are valid reasons (e.g. step by step
> 	conversion to device tree probing using auxdata) to bind
> 	of-instantiated devices to drivers by name. So revert to the
> 	original logic.

Now reverted, thanks for the text.

greg k-h
