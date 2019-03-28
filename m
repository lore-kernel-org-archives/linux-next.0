From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the phy-next tree
Date: Thu, 28 Mar 2019 11:29:25 +1100
Message-ID: <20190328112925.0fbe34e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A75oY2WFi94l+5SHUQy+Dbz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: linux-next.vger.kernel.org

--Sig_/A75oY2WFi94l+5SHUQy+Dbz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kishon,

After merging the phy-next tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/phy/phy.h:19,
                 from drivers/phy/broadcom/phy-bcm-sr-usb.c:10:
drivers/phy/broadcom/phy-bcm-sr-usb.c: In function 'bcm_usb_phy_probe':
include/linux/device.h:1138:19: warning: 'phy_cfg' may be used uninitialize=
d in this function [-Wmaybe-uninitialized]
  dev->driver_data =3D data;
  ~~~~~~~~~~~~~~~~~^~~~~~
drivers/phy/broadcom/phy-bcm-sr-usb.c:289:26: note: 'phy_cfg' was declared =
here
  struct bcm_usb_phy_cfg *phy_cfg;
                          ^~~~~~~

Introduced by commit

  a3b96057577c ("phy: sr-usb: Add Stingray USB PHY driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/A75oY2WFi94l+5SHUQy+Dbz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlycFWUACgkQAVBC80lX
0GyCkAf8CwUajFzg0df2VEAQ2KqWX9pxxk3XEx1Gegym0hh9Q9OOOwf089BZvHdk
OqVLeWCWxjYbpXHy9qILwrFMEBtHY8XSFglD2M6A/XEhxjb47gjf+nb7csGpKZ2s
y8amVjDBDhc+adXHOw9e90L4qRR5npCrjJYTodbzlDtfwTvi8VWpsLmKAiAyU3fd
vctKk5d0+Nod166EaqY879SOzGdAdgMzmfrzZ0S3S6sz1sSh7RutojhIAUCyUIf3
/AD3MuZkKw/g1YvdtHuEa8rq/tP3ISgfANW4oMefdYJLdsyOCBZb4p9rXpfxt3n0
El2QQ1lKfhQZ+XQR1XL1zd4zurtoPg==
=Lzh8
-----END PGP SIGNATURE-----

--Sig_/A75oY2WFi94l+5SHUQy+Dbz--
