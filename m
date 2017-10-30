From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the spi-nor tree with the imx-mxs tree
Date: Mon, 30 Oct 2017 18:15:51 +0000
Message-ID: <20171030181551.skcvt4mr4br7rtn2@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aj6klbbkhnnep5f4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:48956 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932716AbdJ3SQB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Oct 2017 14:16:01 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Yuan Yao <yao.yuan@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Philipp Puschmann <pp@emlix.com>
Cc: linux-arm-kernel@lists.infradead.org, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--aj6klbbkhnnep5f4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Cyrille,

Today's linux-next merge of the spi-nor tree got a conflict in:

  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt

between commit:

  b07815d4eaf65 ("dt-bindings: mtd: add sst25wf040b and en25s64 to sip-nor =
list")

=66rom the imx-mxs tree and commit:

   282e45dc64d1 ("mtd: spi-nor: Add support for mr25h128")

=66rom the spi-nor tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 4cab5d85cf6f,956bb046e599..000000000000
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@@ -13,7 -13,7 +13,8 @@@ Required properties
                   at25df321a
                   at25df641
                   at26df081a
 +                 en25s64
+                  mr25h128
                   mr25h256
                   mr25h10
                   mr25h40

--aj6klbbkhnnep5f4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln3bFYACgkQJNaLcl1U
h9AS4wf/RAALzdnB2L6IIbUAk54sTxPKh8eDCRGd1fGUb0MalKAshyE6LrFITlL6
rYUIiNRLWMBESM6dretJcZa2U+Dg9c5z272kydo8vRAp9z2bm9XC4wwy4/6nWoWm
0VxLJcML4JHKoOpMMQnCu6iovx8E9+i5+/u/zoAO75WBpIfBjgrb+NI2QdttKpTP
DX/0zL1gjtlyVxrryrIiNqHNOT2NBI6nIzLWzVPUOnFwhQ4Qgdf4xj+VhegTggSy
JuCF/iHKEDkRd2v8yfBWAyNo3Nc1wNmc41qMBMk8AoD7WOVRHqWc4+AGQac+ZJCB
dJSdbG2DncXwMpk5FcFl/4wHuO5m4Q==
=6uCT
-----END PGP SIGNATURE-----

--aj6klbbkhnnep5f4--
