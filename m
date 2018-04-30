From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Mon, 30 Apr 2018 11:34:10 +1000
Message-ID: <20180430113410.6bb4d6ea@canb.auug.org.au>
References: <20180423130444.0672fb80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xSfrB86U=mtcPSt7kZNe/XK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180423130444.0672fb80@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Sebastian Reichel <sre@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/xSfrB86U=mtcPSt7kZNe/XK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 23 Apr 2018 13:04:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the usb tree got a conflict in:
>=20
>   drivers/usb/core/hcd.c
>=20
> between commit:
>=20
>   63cb03f5c11e ("usb: core: split usb_phy_roothub_{init,alloc}")
>=20
> from the usb.current tree and commit:
>=20
>   bc40f5341741 ("USB: core: hcd: drop support for legacy phys")
>=20
> from the usb tree.
>=20
> I fixed it up (see below - though I am not sure what happens to the
> phy_roothub allocation when usb_phy_roothub_init fails) and can carry
> the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/usb/core/hcd.c
> index 0a42c5df3c0f,ac5bcf449d7d..000000000000
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@@ -2742,35 -2740,11 +2743,15 @@@ int usb_add_hcd(struct usb_hcd *hcd
>   	int retval;
>   	struct usb_device *rhdev;
>  =20
> - 	if (IS_ENABLED(CONFIG_USB_PHY) && !hcd->skip_phy_initialization) {
> - 		struct usb_phy *phy =3D usb_get_phy_dev(hcd->self.sysdev, 0);
> -=20
> - 		if (IS_ERR(phy)) {
> - 			retval =3D PTR_ERR(phy);
> - 			if (retval =3D=3D -EPROBE_DEFER)
> - 				return retval;
> - 		} else {
> - 			retval =3D usb_phy_init(phy);
> - 			if (retval) {
> - 				usb_put_phy(phy);
> - 				return retval;
> - 			}
> - 			hcd->usb_phy =3D phy;
> - 			hcd->remove_phy =3D 1;
> - 		}
> - 	}
> -=20
>   	if (!hcd->skip_phy_initialization && usb_hcd_is_primary_hcd(hcd)) {
>  -		hcd->phy_roothub =3D usb_phy_roothub_init(hcd->self.sysdev);
>  +		hcd->phy_roothub =3D usb_phy_roothub_alloc(hcd->self.sysdev);
> - 		if (IS_ERR(hcd->phy_roothub)) {
> - 			retval =3D PTR_ERR(hcd->phy_roothub);
> - 			goto err_phy_roothub_alloc;
> - 		}
> + 		if (IS_ERR(hcd->phy_roothub))
> + 			return PTR_ERR(hcd->phy_roothub);
>  =20
>  +		retval =3D usb_phy_roothub_init(hcd->phy_roothub);
>  +		if (retval)
> - 			goto err_phy_roothub_alloc;
> ++			return retval;
>  +
>   		retval =3D usb_phy_roothub_power_on(hcd->phy_roothub);
>   		if (retval)
>   			goto err_usb_phy_roothub_power_on;

This is now a conflict between the battery tree (since it merged the
usb tree) and Linus' tree (since it merged the usb.current tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/xSfrB86U=mtcPSt7kZNe/XK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrmcpIACgkQAVBC80lX
0GzdDAf/WjXrdToZ4UK8vTGS6o7BHrLkW8xYb2FGEszD6F5eQuoIh8sq4TDgvYoR
617ETKTpdICcS9/8EIpi7yZmoIyqPaIhYorlIq9ZVJUjsUpTrCf1pGmI5uDCi9SF
AI8Pd86A5nqtj7dvsxVl/AexElAF1P41wEGH4RaziC5Qfir7QBaLJRbdnqhbCkQN
r8sL7GrGfhXhjmsny+zUbw1BAdkZNV+iWk0jK3PTezcmCKUMj4gosbrHEDnK3bf8
H3dCr1Ek0NIW+u57P/WlvDkOo7/2kMhRsuk4g3Mm6UmJfB799O4D03tKffvj3/Oi
iguIUEnAG1wPrUc2qzUKCuJnKp7Ctw==
=y6qE
-----END PGP SIGNATURE-----

--Sig_/xSfrB86U=mtcPSt7kZNe/XK--
