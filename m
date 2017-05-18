From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170518 build: 1 failures 4 warnings (next-20170518)
Date: Thu, 18 May 2017 11:36:07 +0100
Message-ID: <20170518103607.u7l7vr2rnv3rsysu@sirena.org.uk>
References: <E1dBFeZ-0004Qr-Jp@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lv5jp3vroksh7xxa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45234 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934420AbdERLNT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 May 2017 07:13:19 -0400
Content-Disposition: inline
In-Reply-To: <E1dBFeZ-0004Qr-Jp@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--lv5jp3vroksh7xxa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 08:15:19AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an ARM allmodconfig due to:

> 	arm-allmodconfig
> Error: ../arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts:69.17-18 syn=
tax error

caused by ff175ef29e9069ac46 (ARM: sun8i: v3s: add support for Lichee Pi
Zero w/ dock board). =20

--lv5jp3vroksh7xxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlkdeRMACgkQJNaLcl1U
h9C5wQf/c0v6EBDbLbtrly6JmDKS5RndShkLzUZIsz0WK8fuGo2XtKZX49+W1AV9
CUEadQFpIGse6bTXD8K3gE/fZnhFD8yw7vEDt3v/G/fCNRWlgrGcBWriOksWGEbX
4xoJmkn013vwIQ4RH/0UTm7s7d/AOL+sEPjuyIaRLSVYbhy3ewAIx5S940KhzYbj
170T2o/Mdj2ZQbREM8UcHGjZh1VJXMK01UxBWrlpMXkxrsNQ252t6mBq1gutIDjV
SFfy8IkfMBq/qfTKtWD7DHRLbdAaBQg6XNlQyM4wP1T78WNmQPBBXVcOlHb/a16X
zjD75HfMQ4nfNSjgPZKESUSJ4e9ffQ==
=LvY0
-----END PGP SIGNATURE-----

--lv5jp3vroksh7xxa--
