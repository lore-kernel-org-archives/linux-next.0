From: Felipe Balbi <balbi@ti.com>
Subject: Re: linux-next: manual merge of the usb-gadget tree with the
 usb.current tree
Date: Tue, 30 Jul 2013 08:50:05 +0300
Message-ID: <20130730055005.GC9155@radagast>
References: <20130730140810.a61155d064e33248faef323b@canb.auug.org.au>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130730140810.a61155d064e33248faef323b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Felipe Balbi <balbi@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rong Wang <Rong.Wang@csr.com>, Greg KH <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 30, 2013 at 02:08:10PM +1000, Stephen Rothwell wrote:
> Hi Felipe,
>=20
> Today's linux-next merge of the usb-gadget tree got a conflict in
> drivers/usb/gadget/udc-core.c between commit 1894870eb424 ("usb: gadget:
> udc-core: fix the typo of udc state attribute") from the usb.current tree
> and commit 5702f75375aa ("usb: gadget: udc-core: move sysfs_notify() to a
> workqueue") from the usb-gadget tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc drivers/usb/gadget/udc-core.c
> index 13e25f8,3122ab9..0000000
> --- a/drivers/usb/gadget/udc-core.c
> +++ b/drivers/usb/gadget/udc-core.c
> @@@ -105,6 -106,13 +106,13 @@@ EXPORT_SYMBOL_GPL(usb_gadget_unmap_requ
>  =20
>   /* --------------------------------------------------------------------=
----- */
>  =20
> + static void usb_gadget_state_work(struct work_struct *work)
> + {
> + 	struct usb_gadget	*gadget =3D work_to_gadget(work);
> +=20
>  -	sysfs_notify(&gadget->dev.kobj, NULL, "status");
> ++	sysfs_notify(&gadget->dev.kobj, NULL, "state");
> + }

this is the same fix used in my master branch, looks good. :-)

Thanks

--=20
balbi

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJR91QNAAoJEIaOsuA1yqREROkQAKnC1pyaFkwCtAyDP9quNUR1
dHyR22skd2ArROXm3X2uIjUnLDflKsKOx655T0Xpy5pMBTLccBf8/4GZUUwIdY/Y
QUpSPqFETl8hDV7tbXETBeHTmy/gjuivMD+30QFNLeU1tD59KCYb19+KJDndLCW2
1deIMu/J1eoKwoKrWjpkj94LfeVc6Nv+6dBfB5rU/4aNbOfPHqEk5fXm9DqFueEn
RWmTVQPiaO8PjH02RBvQUtR18RH8JSilVyIP2b8UPlvzcrZ0nmIal+70ynb0g4lW
Y6I9S5+mh/jl4B1xgBRefEDH89T5+yWErJRL+3iSgDMWmqARdQOXmqRSIqerbJHp
qe6VWsj2FwjcU3tveC9AJYs0G7fzPLLuTW45Nar6TGbtnIYOCtG4FCbQ1t3WEB8b
pUkL1CLluNKteWdv/ao4ZxPCI7hir4TlgaARH0QYqe5ttN4sm3O4INe+YZAxCszJ
wbFDeomrb6AXUs9USY18YRzAq8cKh2TZeB2O7Ii/yFnD13bbxXDugcagbzvMWelA
FlbKi9B8i+WIJ2hn+oWRqAaySWW5StsqcECjTfIr046DbnV9/fkZlUOXIUDACNfN
Ecqkqjxt4NAwpLja6RpCi95AfADNPG+MNonJqK6f3RksMVhTgUW+8klzbTc3HMTc
Z+pgaP2tmfZTrFXyXfQJ
=Vx7L
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
