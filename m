From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: arm qemu test failures due to 'driver-core: platform: probe
 of-devices only using list of compatibles'
Date: Mon, 15 Feb 2016 11:59:09 +0100
Message-ID: <20160215105909.GH12289@pengutronix.de>
References: <20160214165010.GA3189@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160214165010.GA3189@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

Hello Guenter,

On Sun, Feb 14, 2016 at 08:50:10AM -0800, Guenter Roeck wrote:
> Uwe,
>=20
> Your patch 'driver-core: platform: probe of-devices only using list o=
f
> compatibles' causes the following qemu tests to crash in -next.
>=20
> arm:vexpress-a9:vexpress_defconfig:vexpress-v2p-ca9
> arm:vexpress-a15:vexpress_defconfig:vexpress-v2p-ca15-tc1
> arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
> arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
>=20
> Crash log:
>=20
> VFS: Cannot open root device "mmcblk0" or unknown-block(0,0): error -=
6
> Please append a correct "root=3D" boot option; here are the available=
 partitions:
> 1f00          131072 mtdblock0  (driver?)
> 1f01           32768 mtdblock1  (driver?)
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-b=
lock(0,0)

Can you provide a complete boot log? This might already reveal which
device is failing. It might not be the mmci device but something it
depends on (clock, bus parent, irq).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
