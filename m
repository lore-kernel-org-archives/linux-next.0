From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 i2c-embedded tree
Date: Thu, 13 Sep 2012 09:09:48 +0200
Message-ID: <20120913070948.GC19497@pengutronix.de>
References: <20120913164120.cde08ac1517e641386b147d8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120913164120.cde08ac1517e641386b147d8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Wolfram Sang <w.sang@pengutronix.de>, Shubhrajyoti D <shubhrajyoti@ti.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Sep 13, 2012 at 04:41:20PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/i2c/busses/i2c-omap.c between commit d9ebd04d3476 ("i2c: omap=
:
> switch to devm_* API") from the i2c-embedded tree and commit 07baca6f=
8fc2
> ("i2c/i2c-omap: add a const qualifier") from the arm-soc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).
looks correct.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
