From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the devicetree tree with the drm tree
Date: Mon, 30 Oct 2017 20:37:56 +0000
Message-ID: <20171030203756.35brom4ulrbgqesv@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="htarrupxfffskzsm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33230 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751837AbdJ3UiD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Oct 2017 16:38:03 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>, Frank Rowand <frank.rowand@sony.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <stephen.boyd@linaro.org>, Jyri Sarha <jsarha@ti.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--htarrupxfffskzsm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Today's linux-next merge of the devicetree tree got a conflict in:

  drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c

between commit:

  44cd3939c111b7 ("drm/tilcdc: Remove redundant OF_DETACHED flag setting")

=66rom the drm tree and commit:

  f948d6d8b792bb ("of: overlay: avoid race condition between applying multi=
ple overlays")

=66rom the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index 482299a6f3b0,54025af534d4..000000000000
--- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
@@@ -163,12 -162,8 +162,6 @@@ static struct device_node * __init tilc
  		return NULL;
  	}
 =20
- 	ret =3D of_resolve_phandles(overlay);
- 	if (ret) {
- 		pr_err("%s: Failed to resolve phandles: %d\n", __func__, ret);
- 		return NULL;
- 	}
 -	of_node_set_flag(overlay, OF_DETACHED);
--
  	return overlay;
  }
 =20

--htarrupxfffskzsm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln3jaQACgkQJNaLcl1U
h9C9wwf+LBUS1qVW8kDdrFtS8ECLKbcsnXnIfTT+rOPaToQSXtgYj7GGUNxdluXG
jVFTLpY3DuhYas2I2IWty3QO+P7Bkxkc2yBfgqwlCDumBLM0CO/g8IHSNg834Pqa
qM+IliWghawETU9A/DRjDs2RRIKkvej/u1+q3A9v4OTMe+1Md/KQo8+b5DLCrj+Z
zj9eE9uXsip6M/jsRCECscQostv+eKWnQixBMwJJpa8Esne5ATOFnqfpJD9Yqs9K
e6SzMoqXvGzyQxlT0u31kK4j2VGrLqa7pbHzNghNiryEAxOHmngoyl3zD6w0m5vD
Qa1USjWmY+NCnFx6KAEywSFOrDJxRg==
=mXR8
-----END PGP SIGNATURE-----

--htarrupxfffskzsm--
