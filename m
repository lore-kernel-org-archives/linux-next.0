From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160914 build: 2 failures 3 warnings (next-20160914)
Date: Mon, 19 Sep 2016 11:21:50 +0100
Message-ID: <20160919102150.GI10189@sirena.org.uk>
References: <E1bk5OS-0000Vu-1C@optimist>
 <20160914171137.GF27974@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZOudaV4lSIjFTlHv"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57392 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755777AbcISKWK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2016 06:22:10 -0400
Content-Disposition: inline
In-Reply-To: <20160914171137.GF27974@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcin Niestroj <m.niestroj@grinn-global.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, arnd@arndb.de
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--ZOudaV4lSIjFTlHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 14, 2016 at 06:11:37PM +0100, Mark Brown wrote:
> On Wed, Sep 14, 2016 at 09:18:08AM +0100, Build bot for Mark Brown wrote:

> Today's -next fails to build both arm and arm64 allmodconfig due to:

> > 	arm64-allmodconfig
> > ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

> > 	arm-allmodconfig
> > ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

> due to 262d5cc6ceb293 (mfd: tps65217: Add support for IRQs) since
> irq_set_parent() isn't exported.

This is still breaking the build, do we have any ETA on getting the
export added?

--ZOudaV4lSIjFTlHv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX37w9AAoJECTWi3JdVIfQDtcH/j/R6m090kU4q/LtEgZKR5GO
oDcics+1vOzrKPf+PO65lqeHynos4Pw6i7aHdExR8kzmHbixFyW8+pq2NLDelM1s
ZMy+6aE493L/UhZ+6l8Qfr5terElyZoipXFbD1Judkle6dAu5qUhG1JpoeSedl8z
UFokKqgc/fYwYWl2h2wymHE9AAUEd6TGe7NYozkL8CbYS0MNEJpKq+ij5tp9is7Z
yeUWyrlPDuCULaKtUxPmiOdW5VAbXtbAUIiPhBbKOr5oamtCkzkDdxPT0Yc7Q96N
ho/JmZ5H8rCYHseWI38FNFQkK+uwR1/RXshj2fOjK9No1Sr+fWo5by5/kYqVh5A=
=O6YC
-----END PGP SIGNATURE-----

--ZOudaV4lSIjFTlHv--
