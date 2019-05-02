From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the vfs tree
Date: Thu, 2 May 2019 20:31:23 +1000
Message-ID: <20190502203123.15af8e1e@canb.auug.org.au>
References: <20190502202515.22f72e48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uqFtcdIHMF7hK9QC3FSlJXR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502202515.22f72e48@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/uqFtcdIHMF7hK9QC3FSlJXR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 2 May 2019 20:25:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> In commit
>=20
>   4e9036042fed ("ufs: fix braino in ufs_get_inode_gid() for solaris UFS f=
lavour")
>=20
> Fixes tag
>=20
>   Fixes: 252e211e90ce
>=20
> has these problem(s):
>=20
>   - missing subject
>=20
> Did you mean
>=20
> Fixes: 252e211e90ce ("Add in SunOS 4.1.x compatible mode for UFS")

Actually this is in the vfs-fixes tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/uqFtcdIHMF7hK9QC3FSlJXR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzKxvsACgkQAVBC80lX
0Gw4pQf/S1rYC9JOWuKL1xsllPvJDeMBdrqlfcYbAua4/SLRocIsy8p6jG5Qe/y9
ZCdK2Fvi1oKK8cAm+X0sA0GcRVa+ykNIiWu2sOlM5dBAC0S06YJzo5FEcMBYrFgr
overjwpNuH8r+lJQ9xSHUYLxYI2YrQqC87UnT5ShE3naaG9tWh/1fKtIO940NqKR
NZqBUXj/ycJLcCZU+XTyDPgI4XSAkrs0hiMYh14h+0dVwaMPWaErxT+H1/FMuxK3
u3I/AgbMm3UqBtBawNmrtJST5IQfWepW0ZpkS8JwRukXgF9Dw9v0+EVAaJeOdPWy
V9KKGHZG93MaQ2wex+bm+n7W6mOmHQ==
=aGHT
-----END PGP SIGNATURE-----

--Sig_/uqFtcdIHMF7hK9QC3FSlJXR--
