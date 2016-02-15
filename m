From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 08:48:12 +0100
Message-ID: <20160215074812.GC12289@pengutronix.de>
References: <56C0ECDA.1000203@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:35891 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751809AbcBOHsT (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 02:48:19 -0500
Content-Disposition: inline
In-Reply-To: <56C0ECDA.1000203@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>

Hello Guenter,

On Sun, Feb 14, 2016 at 01:08:42PM -0800, Guenter Roeck wrote:
> On 02/14/2016 11:55 AM, Uwe Kleine-K=F6nig wrote:
> >[adding lakml and rmk to Cc]
[adding some more people to Cc]

> >On Sun, Feb 14, 2016 at 08:50:10AM -0800, Guenter Roeck wrote:
> >>Your patch 'driver-core: platform: probe of-devices only using list=
 of
> >>compatibles' causes the following qemu tests to crash in -next.

=46or the new readers, that is 67d02a1bbb334558e9380409a3cd426b36d4578b=
=2E

The original idea of this commit was to not bind a device created from
device tree when its name matches the driver name but none of the
driver's compatibles which might yield some surprises.

> >>arm:vexpress-a9:vexpress_defconfig:vexpress-v2p-ca9
> >>arm:vexpress-a15:vexpress_defconfig:vexpress-v2p-ca15-tc1
> >>arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
> >>arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
> >>
> >>Crash log:
> >>
> >>VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error=
 -6
> >>Please append a correct "root=3D" boot option; here are the availab=
le partitions:
> >>1f00          131072 mtdblock0  (driver?)
> >>1f01           32768 mtdblock1  (driver?)
> >>Kernel panic - not syncing: VFS: Unable to mount root fs on unknown=
-block(0,0)
> >>
> >>ie the mmc driver no longer instantiates. Reverting the patch fixes=
 the problem.
> >
> >The driver is drivers/mmc/host/mmci.c, right? and the relevant devic=
e
> >tree snippet is:
> >
> >	mmci@05000 {
> >		compatible =3D "arm,pl180", "arm,primecell";
> >		...
> >	};
> >
>=20
> Yes, I think so, or one of the many other similar mmc entries.

So the driver in question is an amba_driver and it fails to bind becaus=
e

	static int platform_match(struct device *dev, struct device_driver *dr=
v)
=09
was changed. This is the platform bus type's match function. Why is thi=
s
called for amba devices (that I would expect to use amba_bustype and so
amba_match)?

The driver isn't matched by of_driver_match_device, so the
following code must yield 1 for the mmci device:

        /* Then try ACPI style match */
        if (acpi_driver_match_device(dev, drv))
                return 1;

        /* Then try to match against the id table */
        if (pdrv->id_table)
                return platform_match_id(pdrv->id_table, pdev) !=3D NUL=
L;

        /* fall-back to driver name match */
        return (strcmp(pdev->name, drv->name) =3D=3D 0);

acpi seems unlikely, and the other two match by the device's name which
feels wrong. And I also wonder, what drv is here, because platform_matc=
h
assumes it is a platform_driver, not an amba_driver.

> >? So the unexpected abnormality here is that even though this device=
 is
> >instantiated by dt, the driver doesn't provide any compatibles.
> >Either my expectation is wrong, then 67d02a1bbb33455 should be rever=
ted
> >(or handle this case in a different way), or the mmci driver should
> >declare compatibles (but then it needs to be a platform driver and n=
ot
> >an amba driver?).
>=20
> No idea what the correct solution would be. I do see
>=20
>         if (of_device_is_compatible(bus, "arm,primecell")) {
>                 /*
>                  * Don't return an error here to keep compatibility w=
ith older
>                  * device tree files.
>                  */
>                 of_amba_device_create(bus, bus_id, platform_data, par=
ent);
>                 return 0;
>         }

So there is a new (and better?) way to instantiate amba devices?

> in drivers/of/platform.c, which suggests some special handling for am=
ba
> devices. No idea if and how that is related, but I do have some conce=
rn
> that fixing the problem for mmc alone might not fix it for all the ot=
her
> devices instantiated with "arm,primecell". After all, my boot tests a=
re
> really rudimentary (it boots, therefore it works).

I don't see the right thing to do either. Maybe someone else can shed
some light on this issue?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
