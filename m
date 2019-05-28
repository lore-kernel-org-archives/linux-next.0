From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the scsi tree with Linus' tree
Date: Tue, 28 May 2019 11:43:20 +1000
Message-ID: <20190528114320.30637398@canb.auug.org.au>
References: <20190522100808.66994f6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ibMx_bKOKGX3xtWWDe/Ioda"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522100808.66994f6b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christoph Hellwig <hch@lst.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Hannes Reinecke <hare@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ibMx_bKOKGX3xtWWDe/Ioda
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 22 May 2019 10:08:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the scsi tree got conflicts in:
>=20
>   drivers/scsi/hosts.c
>   drivers/scsi/libsas/sas_task.c
>   drivers/scsi/scsi.c
>   drivers/scsi/scsi_error.c
>   drivers/scsi/scsi_ioctl.c
>   drivers/scsi/scsi_lib.c
>   drivers/scsi/scsi_pm.c
>   drivers/scsi/scsi_sysfs.c
>   drivers/scsi/sd.c
>   drivers/scsi/sr.c
>   drivers/scsi/st.c
>=20
> between commits:
>=20
>   457c89965399 ("treewide: Add SPDX license identifier for missed files")
>   09c434b8a004 ("treewide: Add SPDX license identifier for more missed fi=
les")
>=20
> from Linus' tree and commits:
>=20
>   026104bfa591 ("scsi: core: add SPDX tags to scsi midlayer files missing=
 licensing information")
>   5502239e73e6 ("scsi: libsas: add a SPDX tag to sas_task.c")
>   5897b844b7f9 ("scsi: sd: add a SPDX tag to sd.c")
>   95b04a2ff9c7 ("scsi: sr: add a SPDX tag to sr.c")
>   50a1ea5bebbc ("scsi: st: add a SPDX tag to st.c")

I have now got more of these conflicts in

drivers/scsi/libsas/sas_init.c
drivers/scsi/libsas/sas_internal.h
drivers/scsi/libsas/sas_scsi_host.c
drivers/scsi/sg.c
include/scsi/libsas.h
include/scsi/sas.h

--=20
Cheers,
Stephen Rothwell

--Sig_/ibMx_bKOKGX3xtWWDe/Ioda
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzskjgACgkQAVBC80lX
0GyXSAf+Pf763d98+SPy9OOkwWytZPNe3WTxdCOWUbqZJcYLCjVCy1HcVqHf+h30
G/jnXEmqJpGKNL8+GJ186i55eAq6anTwZm4FgFgNyAU5WSnmq2xNpoqgoY+oFkK/
QKHmcJQzBu8Rtb6uKAGaE17eaY6XP8Fjvrqjo2aECNZ20QCOLZUEkTuJcNYN3f+s
0KVe2+e28rF75cw1Ue46F6BC21vWOu4DdZlLulSpcJW//w7U0UkS5IwvKSCWQJ7R
EeorzmTa32dt4av3iPZMNjYIpS4+R4skxDJPUsdSjox7dtJacS2f4QndFBVth+VQ
mHkJwmW+x+u8AmpyG9x6or6SZGTgiA==
=0fj2
-----END PGP SIGNATURE-----

--Sig_/ibMx_bKOKGX3xtWWDe/Ioda--
