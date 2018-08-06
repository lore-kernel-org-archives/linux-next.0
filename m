From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Date: Tue, 7 Aug 2018 07:49:37 +1000
Message-ID: <20180807074937.59b086f0@canb.auug.org.au>
References: <20180806120131.169f70f3@canb.auug.org.au>
        <20180806194142.GK5007@mellanox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IXKzmnp/hrWGHFW2vmOo0AI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180806194142.GK5007@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/IXKzmnp/hrWGHFW2vmOo0AI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Mon, 6 Aug 2018 13:41:42 -0600 Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> The resolution should end up like this:
>=20
>         srcu_key =3D srcu_read_lock(&file->device->disassociate_srcu);
>=20
>         if (!verify_command_mask(file, command, extended)) {
>                 ret =3D -EOPNOTSUPP;
>                 goto out;
>         }
>=20
> (ie take the hunk from for-next, discard the for-rc stuff)
>=20
> As commit 22fa27fbc64d01cbbe1e4da751e64cc22d24a6e4 also removed the
> 'file->ucontext' stuff

Thanks, I have fixed up my resolution today.

--=20
Cheers,
Stephen Rothwell

--Sig_/IXKzmnp/hrWGHFW2vmOo0AI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltownEACgkQAVBC80lX
0GyCowf+IA0A6LZG0Fimeo1Vvy67+yzwuWSEv8JUNG9Jgf9lz1wkly8wy0XGIqYh
sdY/XTMCwsD9hXgC8YaG5T1CNM2CDMykLWrS/N4Q1O/fADvOkDacjLZYswcjSj1X
ubww5ZdYccmPAfCcmNfv1NCMjrf8CQ7A+PAkdbWLesLvHo4NiMPWRhU3/A/tHON8
FBzH6OcKcxdfsKBAe+uxBbGyUybiRv1jDk4u6L0tc+f2YayW2Cp9GcP+91zgBR/r
9M8YLNxXJ5TbDeGUGmt2ligMZ8rgnc38IWfUz8qrbymD8nLd3qkpJxByAEbt3uBo
LV4OtzrK1jwqQ712Lhk1ArYcbYZPDA==
=qVIE
-----END PGP SIGNATURE-----

--Sig_/IXKzmnp/hrWGHFW2vmOo0AI--
