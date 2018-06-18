From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the nfc-next tree
Date: Mon, 18 Jun 2018 13:46:43 +1000
Message-ID: <20180618134643.27e47330@canb.auug.org.au>
References: <20180612101954.63eb9e60@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/B00vV8p5HaA88v/ucws0TlM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612101954.63eb9e60@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amit Pundir <amit.pundir@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/B00vV8p5HaA88v/ucws0TlM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 12 Jun 2018 10:19:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the nfc-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> drivers/nfc/fdp/fdp.c: In function 'fdp_nci_open':
> drivers/nfc/fdp/fdp.c:250:17: warning: unused variable 'dev' [-Wunused-va=
riable]
>   struct device *dev =3D &info->phy->i2c_dev->dev;
>                  ^~~
> drivers/nfc/fdp/fdp.c: In function 'fdp_nci_close':
> drivers/nfc/fdp/fdp.c:260:17: warning: unused variable 'dev' [-Wunused-va=
riable]
>   struct device *dev =3D &info->phy->i2c_dev->dev;
>                  ^~~
> drivers/nfc/fdp/fdp.c: In function 'fdp_nci_send':
> drivers/nfc/fdp/fdp.c:268:17: warning: unused variable 'dev' [-Wunused-va=
riable]
>   struct device *dev =3D &info->phy->i2c_dev->dev;
>                  ^~~
> drivers/nfc/fdp/fdp.c: In function 'fdp_nci_recv_frame':
> drivers/nfc/fdp/fdp.c:279:17: warning: unused variable 'dev' [-Wunused-va=
riable]
>   struct device *dev =3D &info->phy->i2c_dev->dev;
>                  ^~~
> drivers/nfc/fdp/fdp.c: In function 'fdp_nci_core_reset_ntf_packet':
> drivers/nfc/fdp/fdp.c:602:17: warning: unused variable 'dev' [-Wunused-va=
riable]
>   struct device *dev =3D &info->phy->i2c_dev->dev;
>                  ^~~
> drivers/nfc/fdp/fdp.c: In function 'fdp_nci_prop_patch_ntf_packet':
> drivers/nfc/fdp/fdp.c:614:17: warning: unused variable 'dev' [-Wunused-va=
riable]
>   struct device *dev =3D &info->phy->i2c_dev->dev;
>                  ^~~
> drivers/nfc/fdp/fdp.c: In function 'fdp_nci_remove':
> drivers/nfc/fdp/fdp.c:789:17: warning: unused variable 'dev' [-Wunused-va=
riable]
>   struct device *dev =3D &info->phy->i2c_dev->dev;
>                  ^~~
>=20
> Introduced by commit
>=20
>   7579d009c4a1 ("NFC: fdp: Remove __func__ from dev_dbg()")

I am still getting these ...
--=20
Cheers,
Stephen Rothwell

--Sig_/B00vV8p5HaA88v/ucws0TlM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsnKyMACgkQAVBC80lX
0GxhiQgAnmYKkMeQI+5m4nHRXIoy6KPTzRjEPt4sppt50b7f3borRcgkbul5H/Ac
90KbtduoaUAqNuKsCq2s7ZHrL/Nh1LPFebU6mQH1M6utuaT8BIbnBDhYsWZzJkSv
L24MMhsqXwl85QRwMh+6P8ZgV0t9KCDka47TvS679/Rf+/0wPFR8Esyljv5xJJKo
BYQyax0OjlABsXVBDF/OUaVcpvW27yQXVtCS3y9jilVnRIrerVxy55hfUvEZ+DOg
cDyXtiQaaShggG9tvtzP4+6DARjUm9sUMOrZVWxIGg+JtqcTxC5J12bLimPDBsJr
1uUhKv6FMvAszBL2TRW4WyKNU1Xm/g==
=/l+W
-----END PGP SIGNATURE-----

--Sig_/B00vV8p5HaA88v/ucws0TlM--
