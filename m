From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160927 build: 2 failures 4 warnings (next-20160927)
Date: Tue, 27 Sep 2016 09:00:36 -0700
Message-ID: <20160927160036.y3ti3gzt4ebg2vyz@sirena.org.uk>
References: <E1bop0x-0001YK-4h@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3ekavnowipawxu6r"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34454 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932674AbcI0QBI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2016 12:01:08 -0400
Content-Disposition: inline
In-Reply-To: <E1bop0x-0001YK-4h@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcin Niestroj <m.niestroj@grinn-global.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, arnd@arndb.de, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--3ekavnowipawxu6r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 27, 2016 at 10:49:27AM +0100, Build bot for Mark Brown wrote:

-next is still failing to build an arm and arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

> 	arm-allmodconfig
> ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

due to 262d5cc6ceb293 (mfd: tps65217: Add support for IRQs) since
irq_set_parent() isn't exported.  There was a fix posted adding the
export to the IRQ subsystem but it's still not been applied, the
function is being used in order to enable lazy IRQ disabling for
threaded interrupts:

   https://www.spinics.net/lists/arm-kernel/msg532864.html

--3ekavnowipawxu6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJX6pegAAoJECTWi3JdVIfQYJ4H/AshV4IhK4wZ+OY2QSA0Htke
fbLQiVLODYO+iWOIuLN5qzGHZRK20ZJdMyP1eI1VgbT6NN5jeveDhxTQqA3AvQRv
laiLcCvrkQYvWdS8tBhQywsh+DyM4bos5DclANhG2Dbafaotyn2ghqXtoUoXiuqo
p9N6TYLSKiZLPzuaAB1C0gTxlIx/N9EVYQksAYs87QHugNkx0Jy8nv8KNnYSrBEq
ZWZ5n+Z9ANtOqw9S5J+gLSyNToDTgh8+cZg3z4iVd0Jowlg9/M3+Y+P3KPUNgAYo
fd3t+WnomnlShCTIbTzBcoaIaqD8vylTEnalJIcC6/f+AQHcwMnYTHDyRdQ4+F0=
=phw7
-----END PGP SIGNATURE-----

--3ekavnowipawxu6r--
