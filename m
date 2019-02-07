From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the fixes
 tree
Date: Thu, 7 Feb 2019 16:51:34 +1100
Message-ID: <20190207165134.57c853dd@canb.auug.org.au>
References: <20190207154747.03209c75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zhjP8pP+wY8MDPJD_.E6Trc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207154747.03209c75@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/zhjP8pP+wY8MDPJD_.E6Trc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 7 Feb 2019 15:47:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
>=20
>   drivers/scsi/osd/osd_initiator.c
>=20
> between commit:
>=20
>   24648908acac ("scsi: osd: osd_initiator: mark expected switch fall-thro=
ughs")

I will remove that from my fixes tree for tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/zhjP8pP+wY8MDPJD_.E6Trc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbx2YACgkQAVBC80lX
0GxA1wgAl/Qtbkkm35Dx6RvtTmePkDkFHN7zv6zTN2P2vxsM3K5hxZx+iU5Xs0uc
Jyy8MW9jt+TNrFeT0qasK+wL4toEkk/FrJJJeh0PnysPmETWRB7UUmeR3VuFni7N
zziFNsrbmjJK1okPMQbHAv29wjR66pSPKxsd205CZa06O56RvZtWxd4E9EwVLaMq
Dq8EIsK8QMw3sZcI2Hyc6HXMdl7fF+h2nUWXk7Om0mi5ECNQ2Z5PQ8Hpq5YTjMZH
kIsQQup+GnpfyGsGdk02h0q0UVQYykTeyGAgO/Byg6a1/vbQveYi0HLcDSH+532f
g3Fk3stnhA+bWaUpmXtSELIqnUgVxA==
=AW2Q
-----END PGP SIGNATURE-----

--Sig_/zhjP8pP+wY8MDPJD_.E6Trc--
