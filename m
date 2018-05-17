From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb-gadget tree with the usb tree
Date: Thu, 17 May 2018 14:03:18 +1000
Message-ID: <20180517140318.5333cfee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GHBthan.XRFrE_er1L8LppO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>
List-Id: linux-next.vger.kernel.org

--Sig_/GHBthan.XRFrE_er1L8LppO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb-gadget tree got a conflict in:

  drivers/usb/mtu3/Kconfig

between commit:

  cd91a0e9d38f ("usb: Remove depends on HAS_DMA in case of platform depende=
ncy")

from the usb tree and commit:

  f39846824cd6 ("usb: mtu3: make USB_MTU3_DUAL_ROLE depend on EXTCON but no=
t USB_MTU3")

from the usb-gadget tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/usb/mtu3/Kconfig
index c0c0eb88e5ea,8daf27768888..000000000000
--- a/drivers/usb/mtu3/Kconfig
+++ b/drivers/usb/mtu3/Kconfig
@@@ -2,7 -2,7 +2,7 @@@
 =20
  config USB_MTU3
  	tristate "MediaTek USB3 Dual Role controller"
- 	depends on EXTCON && (USB || USB_GADGET)
 -	depends on (USB || USB_GADGET) && HAS_DMA
++	depends on (USB || USB_GADGET)
  	depends on ARCH_MEDIATEK || COMPILE_TEST
  	select USB_XHCI_MTK if USB_SUPPORT && USB_XHCI_HCD
  	help

--Sig_/GHBthan.XRFrE_er1L8LppO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlr8/wYACgkQAVBC80lX
0GwX+AgAk5TYGQTl+ddjehL+H1fCjGhOZSZnjhEICH5D6h5t8R9ahMScfterLTqy
c84SAJLY2p8HP9Vh+4w45FQtQvCpp5uZrypRRyC36smwgPuC5qP16JAwPl3cj50c
qwTwlTFj0OCyAFpoYQGJfHaohqT7ejBAxGqztHpmQVc7Gga8cPVQzoNMFJE/YXX0
exMwAt5119n7V+O9uXrgBLzkXuIuyOcBqSe+84YVNOysW5UxpsIwDCiCDNVw4YfB
7QGGk/fXa0q6euKJHBvG+ACe3xmul9z4u9f37KrbR0F8LlUYAROgdLGV74IKI89T
nO8nSBBAVyITfqC5XHH06KZdYJNi2w==
=1QUg
-----END PGP SIGNATURE-----

--Sig_/GHBthan.XRFrE_er1L8LppO--
