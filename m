From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Date: Fri, 29 Jun 2018 14:57:19 +1000
Message-ID: <20180629145719.0d7b8fe7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/L40r_4KLPcaV2A3wfd+01p="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Li Jun <jun.li@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/L40r_4KLPcaV2A3wfd+01p=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/staging/typec/Kconfig

between commit:

  e16711c32bca ("staging/typec: fix tcpci_rt1711h build errors")

from the usb.current tree and commit:

  990da41530b3 ("staging: typec: tcpci: move tcpci drivers out of staging")

from the usb tree.

I fixed it up (I removed the file and allpied the patch below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 29 Jun 2018 14:54:04 +1000
Subject: [PATCH] usb: update for tcpci drivers moving out of staging

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/typec/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 972fd1911045..ee808903983f 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -65,6 +65,7 @@ config TYPEC_TCPCI
=20
 config TYPEC_RT1711H
 	tristate "Richtek RT1711H Type-C chip driver"
+	depends on I2C
 	select TYPEC_TCPCI
 	help
 	  Richtek RT1711H Type-C chip driver that works with
--=20
2.17.1


--=20
Cheers,
Stephen Rothwell

--Sig_/L40r_4KLPcaV2A3wfd+01p=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls1vC8ACgkQAVBC80lX
0GzydggAov5EbQ+wOVAxirdqIjoX9a99U9dblvLIduzdGc0O2ufxgxLe5R48QNVL
nc78eta7q+wzrx4DtYgYVXoxqvy1c+ZCDeJBCV7JwD2bxtcP0vgcVfx0aY7grQ2Q
cqntGtjzPSaJM84VA4vFT+Z3G/KsGZiSOav3ajxfiWGq3NlMFPGWXUxT2WYrp9FN
KyIc79GaWXws1Eyge23F15UKVQnIEjV2yrMDzK8K5VOkO6AA7S063epBYLMKQXgm
Rqoit2fbYpEUjammqXMSdmUWdx6ne2UT5DcZRj9a0gALwHNPwnTvDFrwHz0WUzw0
TKe9ADgr8donOu47vOD9qP8P+dRzyQ==
=lkU6
-----END PGP SIGNATURE-----

--Sig_/L40r_4KLPcaV2A3wfd+01p=--
