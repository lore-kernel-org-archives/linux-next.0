From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the btrfs-kdave tree
Date: Thu, 2 Aug 2018 10:31:35 +1000
Message-ID: <20180802103135.2e620406@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vh.0A_YFaE02YjdQCvIbXix"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/vh.0A_YFaE02YjdQCvIbXix
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got conflicts in:

  fs/btrfs/inode.c
  fs/btrfs/tree-log.c

Commits

  8e5d411c91c1 ("btrfs: simplify btrfs_iget()")
  cfac83868124 ("btrfs: lift make_bad_inode() into btrfs_iget()")
  efa119590db3 ("btrfs: IS_ERR(p) && PTR_ERR(p) =3D=3D n is a weird way to =
spell p =3D=3D ERR_PTR(n)")
  353dd669cc08 ("btrfs: btrfs_iget() never returns an is_bad_inode() inode.=
")

from the vfs tree are duplicated as commits

  5ee149473042 ("btrfs: simplify btrfs_iget")
  083a7dddaecc ("btrfs: lift make_bad_inode into btrfs_iget")
  8bca6b1de61e ("btrfs: simplify IS_ERR/PTR_ERR checks")
  7ffab8b69edc ("btrfs: btrfs_iget never returns an is_bad_inode inode")

in the btrfs-kdave tree :-( (except 5ee149473042 has an extra comment
and efa119590db3 has na extra space)

I fixed it up (the obvious way) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/vh.0A_YFaE02YjdQCvIbXix
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltiUOcACgkQAVBC80lX
0GwyFQf+P0LMf4GYJpGP0tDHwZW5k1HeDEsRzRr2umwyMHXCWytrGRVtd+6T1cvC
Mkj8BlxD26P59GErSZzLNEbumEoEbjko0r2Ev672suIA2lMWH4M96w1dTi0zYdr4
GEwcLQl73RaGhpjIpxQ5yaR0y2Y7i+53oTXISObM2W5AcSp1J2JlyM4OjfkYX+aP
9xzmiYyDfC4ag3MDl3Xj3xtLdDTsG0n5y0Mh5thLQlGXaoslxESh+FO7q75qijS3
lZKPMw6UDpSkxUYNQhRG9VTbhyRjbWUyRsUN7c4XehBurL+mj1g1Kl4abrIw9Oe7
Ncnnelgc5j3hyTgQrdkNzA5QjXz1EA==
=PnE8
-----END PGP SIGNATURE-----

--Sig_/vh.0A_YFaE02YjdQCvIbXix--
