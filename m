From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160914 build: 2 failures 3 warnings (next-20160914)
Date: Wed, 14 Sep 2016 18:11:37 +0100
Message-ID: <20160914171137.GF27974@sirena.org.uk>
References: <E1bk5OS-0000Vu-1C@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uCPdOCrL+PnN2Vxy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59278 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758858AbcINRLz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Sep 2016 13:11:55 -0400
Content-Disposition: inline
In-Reply-To: <E1bk5OS-0000Vu-1C@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcin Niestroj <m.niestroj@grinn-global.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2016 at 09:18:08AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build both arm and arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!
>=20
> 	arm-allmodconfig
> ERROR: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!

due to 262d5cc6ceb293 (mfd: tps65217: Add support for IRQs) since
irq_set_parent() isn't exported.

--uCPdOCrL+PnN2Vxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX2YTIAAoJECTWi3JdVIfQ2iwH/iPcL04x8p6PUMuEcfz3nToV
DcUiIHhE2WjU1utFiT98zb3yuvGtrOiU8PM6INaes7MYduCu4NRuXkqEWFOhOY2g
qxBgn1hay1GUWdjqCYvnBG/XhH/CwJMBCbs8wKSME0qWYYkU3sJ/fJdyxNNTOmCR
p3XdaeOB61/27OSRlZiYwd1et+KNSX9LTFaxtJ178et51Ys8XhEpF4w0pgf1B0K9
xa6qv9miEPRBLaq9rVcNGEGBDRUi0k9F4U3oY0lpb6n0x9ms9o++lkvpu0LgIOzw
L4GHj33ODOimHPdmEVzSedzfBAOfNKf/Kb142e9QKE2mDLqImsdlps4cu/+VCbI=
=Br1J
-----END PGP SIGNATURE-----

--uCPdOCrL+PnN2Vxy--
