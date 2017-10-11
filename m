From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the tpmdd tree with Linus' tree
Date: Wed, 11 Oct 2017 16:01:07 +0100
Message-ID: <20171011150107.vft64nx3kccndjlj@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jzyoo7w5ue4jyyv5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59736 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750705AbdJKPBS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Oct 2017 11:01:18 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Hamza Attak <hamza@hpe.com>, James Morris <james.l.morris@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--jzyoo7w5ue4jyyv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

Today's linux-next merge of the tpmdd tree got a conflict in:

  drivers/char/tpm/tpm2-cmd.c

between commit:

   9f3fc7bcddcb51 ("tpm: replace msleep() with  usleep_range() in TPM 1.2/2=
=2E0 generic drivers")

=66rom Linus' tree and commit:

   217d4dfa87415e ("tpm: Use dynamic delay to wait for TPM 2.0 self test re=
sult")

=66rom the tpmdd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/char/tpm/tpm2-cmd.c
index e1a41b788f08,f40d20671a78..000000000000
--- a/drivers/char/tpm/tpm2-cmd.c
+++ b/drivers/char/tpm/tpm2-cmd.c
@@@ -900,6 -867,10 +867,11 @@@ static int tpm2_do_selftest(struct tpm_
  			break;
 =20
  		tpm_msleep(delay_msec);
++
+ 		duration -=3D delay_msec;
+=20
+ 		/* wait longer the next round */
+ 		delay_msec *=3D 2;
  	}
 =20
  	return rc;

--jzyoo7w5ue4jyyv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlneMjIACgkQJNaLcl1U
h9AREAf/XFv5dr8LCyQXDTP20I0+ooCsEF2tsKYp8mxM0SWC2eMqMItxsJycMpKA
xR2bRcaQrEaY8/S7jLoKyYvvPyJzwThTDoDeLb7IIEWYcMzLE3Xqlr+M22U1C5yw
Whh6rSCncI3GLDamZjNfb0N+VsTjapCW84XoiWSiHGGcQ12CR+uKK4BGVAlvt73F
fqgLzTbzx9XZsoWLLC5BHxX6nrcC0isKDJzI4r/RFw9YrA3HuIEaMzFTK1qWkUD+
ZLeOU9mQR/8ttc7bTpmk2OLqPHa/vuEtchODbJzvekBIcsROI8hBGx86tIgTq2s2
g9UFbBZJpXgcRXYTsTDawJ4SnKeFaw==
=iwM0
-----END PGP SIGNATURE-----

--jzyoo7w5ue4jyyv5--
