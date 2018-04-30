From: Sebastian Reichel <sre@kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Date: Mon, 30 Apr 2018 13:55:05 +0200
Message-ID: <20180430115505.v6krohceeezbutnm@earth.universe>
References: <20180423130444.0672fb80@canb.auug.org.au>
 <20180430113410.6bb4d6ea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5gsy5quxnybolmdr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180430113410.6bb4d6ea@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>
List-Id: linux-next.vger.kernel.org


--5gsy5quxnybolmdr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 30, 2018 at 11:34:10AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Mon, 23 Apr 2018 13:04:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the usb tree got a conflict in:
> >=20
> >   drivers/usb/core/hcd.c
> >=20
> > between commit:
> >=20
> >   63cb03f5c11e ("usb: core: split usb_phy_roothub_{init,alloc}")
> >=20
> > from the usb.current tree and commit:
> >=20
> >   bc40f5341741 ("USB: core: hcd: drop support for legacy phys")
> >=20
> > from the usb tree.
> >=20
> > I fixed it up (see below - though I am not sure what happens to the
> > phy_roothub allocation when usb_phy_roothub_init fails) and can carry
> > the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts.
> >=20
> > --=20
> > Cheers,
> > Stephen Rothwell
> >=20
> > diff --cc drivers/usb/core/hcd.c
> > index 0a42c5df3c0f,ac5bcf449d7d..000000000000
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@@ -2742,35 -2740,11 +2743,15 @@@ int usb_add_hcd(struct usb_hcd *hcd
> >   	int retval;
> >   	struct usb_device *rhdev;
> >  =20
> > - 	if (IS_ENABLED(CONFIG_USB_PHY) && !hcd->skip_phy_initialization) {
> > - 		struct usb_phy *phy =3D usb_get_phy_dev(hcd->self.sysdev, 0);
> > -=20
> > - 		if (IS_ERR(phy)) {
> > - 			retval =3D PTR_ERR(phy);
> > - 			if (retval =3D=3D -EPROBE_DEFER)
> > - 				return retval;
> > - 		} else {
> > - 			retval =3D usb_phy_init(phy);
> > - 			if (retval) {
> > - 				usb_put_phy(phy);
> > - 				return retval;
> > - 			}
> > - 			hcd->usb_phy =3D phy;
> > - 			hcd->remove_phy =3D 1;
> > - 		}
> > - 	}
> > -=20
> >   	if (!hcd->skip_phy_initialization && usb_hcd_is_primary_hcd(hcd)) {
> >  -		hcd->phy_roothub =3D usb_phy_roothub_init(hcd->self.sysdev);
> >  +		hcd->phy_roothub =3D usb_phy_roothub_alloc(hcd->self.sysdev);
> > - 		if (IS_ERR(hcd->phy_roothub)) {
> > - 			retval =3D PTR_ERR(hcd->phy_roothub);
> > - 			goto err_phy_roothub_alloc;
> > - 		}
> > + 		if (IS_ERR(hcd->phy_roothub))
> > + 			return PTR_ERR(hcd->phy_roothub);
> >  =20
> >  +		retval =3D usb_phy_roothub_init(hcd->phy_roothub);
> >  +		if (retval)
> > - 			goto err_phy_roothub_alloc;
> > ++			return retval;
> >  +
> >   		retval =3D usb_phy_roothub_power_on(hcd->phy_roothub);
> >   		if (retval)
> >   			goto err_usb_phy_roothub_power_on;
>=20
> This is now a conflict between the battery tree (since it merged the
> usb tree) and Linus' tree (since it merged the usb.current tree).

Thanks for the heads up! I guess using a topic branch for the tcpm
changes would have been the better choice :( As far as I can see
there is not much I can do except for mentioning it to Linus when
I send my pull request.

-- Sebastian

--5gsy5quxnybolmdr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlrnBBYACgkQ2O7X88g7
+ppNtg/+I79HzIydv7XIAwubowvmgUrdP9I8BNkc5O4br4RHVYTRD4qqJCPcjNXj
7XQR/H705VWCho26t0ltsjWNLKQBe1nWjRslz6jj4ErVETZiyk/pMIlh5c8VEyeL
ahy7hmc5T83aWMuznOSq4oY+wCWV2FyQOv1RWeMnHGhKjEK6xgDXOqFpo09iTI0f
8VYO8rYzWOhXsVYIC8jm1H+pE0c9kZWzWEoRaPoGJaHsLKElmsmp4pFjHvWU1MpP
aLK+T0n5s1KYBb98K64fL49qJq4BCxCSgdPf/ZHEpZd0QCgqzQ2fvTSxowqmE4/3
N2cQf8rXb0djFqvOZ9IbuVPVcorVJs6hiyCagdMlHSlPfc7AyIIII88lkI1wp4RM
K50G09zhNBx/GJ+KSfBAKzKN9fWxTua4XU08xKbl1fU6aeXTe7bvuARyEetfYktL
HP6ronQ+JYwtanU+MqkX41RBYVmhooR3NxpLcTC7T3YtS3E5oV1LKrSdi2gwH7Nt
8r2qMD0VZx0YAx8C73NJ1GJZ9qSYMM81CopbGfET6zYR1cseo8UHxt2P8nCWgGyt
oJCzxuPzDIZX94qar3kdQpmeQgwwZ41jyqjAG4P3h60OOycX455gGnyuNMRwhL3+
T+Nlij62znxQZsS6B46lbcxqxgqKVtXtK1wUd5AJSoCfkMfynNQ=
=/ef/
-----END PGP SIGNATURE-----

--5gsy5quxnybolmdr--
