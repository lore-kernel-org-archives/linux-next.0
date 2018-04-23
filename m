From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Date: Mon, 23 Apr 2018 13:04:44 +1000
Message-ID: <20180423130444.0672fb80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uZ5j=z4kN.lWQG5GAv0C5jt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/uZ5j=z4kN.lWQG5GAv0C5jt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/core/hcd.c

between commit:

  63cb03f5c11e ("usb: core: split usb_phy_roothub_{init,alloc}")

from the usb.current tree and commit:

  bc40f5341741 ("USB: core: hcd: drop support for legacy phys")

from the usb tree.

I fixed it up (see below - though I am not sure what happens to the
phy_roothub allocation when usb_phy_roothub_init fails) and can carry
the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/usb/core/hcd.c
index 0a42c5df3c0f,ac5bcf449d7d..000000000000
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@@ -2742,35 -2740,11 +2743,15 @@@ int usb_add_hcd(struct usb_hcd *hcd
  	int retval;
  	struct usb_device *rhdev;
 =20
- 	if (IS_ENABLED(CONFIG_USB_PHY) && !hcd->skip_phy_initialization) {
- 		struct usb_phy *phy =3D usb_get_phy_dev(hcd->self.sysdev, 0);
-=20
- 		if (IS_ERR(phy)) {
- 			retval =3D PTR_ERR(phy);
- 			if (retval =3D=3D -EPROBE_DEFER)
- 				return retval;
- 		} else {
- 			retval =3D usb_phy_init(phy);
- 			if (retval) {
- 				usb_put_phy(phy);
- 				return retval;
- 			}
- 			hcd->usb_phy =3D phy;
- 			hcd->remove_phy =3D 1;
- 		}
- 	}
-=20
  	if (!hcd->skip_phy_initialization && usb_hcd_is_primary_hcd(hcd)) {
 -		hcd->phy_roothub =3D usb_phy_roothub_init(hcd->self.sysdev);
 +		hcd->phy_roothub =3D usb_phy_roothub_alloc(hcd->self.sysdev);
- 		if (IS_ERR(hcd->phy_roothub)) {
- 			retval =3D PTR_ERR(hcd->phy_roothub);
- 			goto err_phy_roothub_alloc;
- 		}
+ 		if (IS_ERR(hcd->phy_roothub))
+ 			return PTR_ERR(hcd->phy_roothub);
 =20
 +		retval =3D usb_phy_roothub_init(hcd->phy_roothub);
 +		if (retval)
- 			goto err_phy_roothub_alloc;
++			return retval;
 +
  		retval =3D usb_phy_roothub_power_on(hcd->phy_roothub);
  		if (retval)
  			goto err_usb_phy_roothub_power_on;

--Sig_/uZ5j=z4kN.lWQG5GAv0C5jt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrdTUwACgkQAVBC80lX
0GyJzAf/XsUbMyl+PGcUI17TBq5diJZcAjTPPJTiNKzHhAWLKXLqSZTZ9dla/a0s
jI39LaS18lIn0Jl09AMS63DfEVIAFWMCeW9iscrYPad1GyMhpc4dcw7eWKUZDDNn
kNx7+jfvUbCP/zTe0yLg+jStne8CwLSGVoH2Iglq54NRS6W0vaMkQuC0L+ZoIrXf
JaV/kHVrfztlOlXQ2DM5jVriCBzdjncnUT3KS80blbBYYtBtneGK6BzaWzQqRo2L
DthjGkOc/ozgkWoYvxEq5qfq4hHlpQxk77q8XRS4qtmmlRRDzuRGIRidYiis+lO3
mFEywEQlAKOzx4KRW7nPVZe4mZMnjw==
=LjKn
-----END PGP SIGNATURE-----

--Sig_/uZ5j=z4kN.lWQG5GAv0C5jt--
