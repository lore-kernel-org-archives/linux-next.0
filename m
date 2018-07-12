From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Thu, 12 Jul 2018 14:29:22 +1000
Message-ID: <20180712142922.57ac7ca2@canb.auug.org.au>
References: <20180711140457.5c366429@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eFqml6=aE8tyX/oc6ZpjG7Y"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711140457.5c366429@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Thumshirn <jthumshirn@suse.de>, Joel Stanley <joel@jms.id.au>, "David S. Miller" <davem@davemloft.net>
List-Id: linux-next.vger.kernel.org

--Sig_/eFqml6=aE8tyX/oc6ZpjG7Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Jul 2018 14:04:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   54e45716a84a ("scsi: remove NCR_D700 driver")
>=20
> from Linus' tree and commit:
>=20
>   01a21986f8ed ("MAINTAINERS: Add Sam as the maintainer for NCSI")
>=20
> from the scsi-mkp tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc MAINTAINERS
> index e5f8823b5f02,f3de5d37179a..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -9810,17 -9750,6 +9810,11 @@@ F:	drivers/scsi/mac_scsi.
>   F:	drivers/scsi/sun3_scsi.*
>   F:	drivers/scsi/sun3_scsi_vme.c
>  =20
> - NCR DUAL 700 SCSI DRIVER (MICROCHANNEL)
> - M:	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> - L:	linux-scsi@vger.kernel.org
> - S:	Maintained
> - F:	drivers/scsi/NCR_D700.*
> -=20
>  +NCSI LIBRARY:
>  +M:	Samuel Mendoza-Jonas <sam@mendozajonas.com>
>  +S:	Maintained
>  +F:	net/ncsi/
>  +
>   NCT6775 HARDWARE MONITOR DRIVER
>   M:	Guenter Roeck <linux@roeck-us.net>
>   L:	linux-hwmon@vger.kernel.org

This conflict is now between the scsi tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/eFqml6=aE8tyX/oc6ZpjG7Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltG2SIACgkQAVBC80lX
0Gx6Hgf/SMbEvXbJeM3dKb5yk2j2CDfonGoX6bEP0i9cFldePm/rZ+VgATiPLwtV
gowaZ8HgHy0G6s6Em0xCbruvYcKt1dzYSaiKJj2URgjx4ZlwINeJ2B3yaNZVILsC
XDhuGmwENk7rUHG6MLpuRmE2gHzwf8BvSo5UBuI2KjDrELZakRVE78TTEjb5zlee
rxArcpUWtvGN1I2yUn6aCVp4Uzj5dol9+fgFuHztvqaXgHkEfiI98Cxr5gm4TXYL
fohJn0cvESeGSpclYoqcW+TU7FpimUmjT6mTK85LnVLkYt3STvutA3XEQdaS+c0+
ZFX4oggyvwyZIxam1utY+hzCPxLQiw==
=mzFH
-----END PGP SIGNATURE-----

--Sig_/eFqml6=aE8tyX/oc6ZpjG7Y--
