From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] sound: fix trivial build error in mpc5200_dma.c
Date: Mon, 27 Feb 2012 14:59:27 +0000
Message-ID: <20120227145926.GK3191@opensource.wolfsonmicro.com>
References: <1330204350-386-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9aCKuHbn5v2q3RVc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:44494 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751199Ab2B0O73 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Feb 2012 09:59:29 -0500
Content-Disposition: inline
In-Reply-To: <1330204350-386-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: perex@perex.cz, tiwai@suse.de, timur@freescale.com, lrg@ti.com, linux-next@vger.kernel.org


--9aCKuHbn5v2q3RVc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2012 at 04:12:30PM -0500, Paul Gortmaker wrote:
> Add the obvious header to fix this:
>=20
> sound/soc/fsl/mpc5200_dma.c:301: error: implicit declaration of function =
'DMA_BIT_MASK'
> sound/soc/fsl/mpc5200_dma.c:301: error: initializer element is not consta=
nt

Applied, thanks, but this does look like someone updating the headers
needs to be chased as the driver hasn't changed here for years.

Please also try to use changelog headers consistent with the subsystem.

--9aCKuHbn5v2q3RVc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPS5o7AAoJEBus8iNuMP3dKjcP/iU39uS2OwZqfH8ecxM0Bbv+
mbJMczDvnqDkMhssuL3U7AY1LjypD6ekew0qzFWwBCpXo0QzABey+uvFdy3N7ykp
Pr37iGkLl0vw6jIQKHOw1wqydbr1sH0isvYGgKHvwvV1jZmWNoIumTP3V1FjJ05K
zQcyuj15g2bl5pfdEHmwcdHDdJ7csP+5U5gLdmXCFtPbAjRbltsPHHEasKZb6ARe
uLGAOWuRa2F7BmXTfj+4PAOEjGR9Seb51oYUdn5bcRFwUSvPB9CxR7tpMxF9f+P9
7bKRYbx4mBDEQxLJ7m38W5bdgvwKEYDrfSze/FoD4LH20KTvoYT19kgOghgI3a5m
7l0ufKg8QCJwsB8sszD/vM3FWIYO3F0g5A/2jBd8YU6WKqpt1EuLQz0mku3LvTCq
yzmF7s1KLt6KlOJJfVfrlOItyO8h5jzLIemK0u8BFk0PuzkiLBQflYiPmYgc+TU9
aYcfG0OzhdcQK1SdgrihGIBZwirNEL5rKCujpDCutjklTww0cA3sfdS0Sw6xnFlA
x/T5DX5oU/kYT5UGejtFCK6bRY5+kkXFqK1UnljOMC+hecCFu6oSjkASv15yR8zj
ksgiHtpkmskd93p1/YH6+oEh0edD6pNqn2MHJh7ZV7tXfGzThQvtRIGt1Ufp+k9U
xsYLXAA84qqCn0vMLyw/
=8B8c
-----END PGP SIGNATURE-----

--9aCKuHbn5v2q3RVc--
