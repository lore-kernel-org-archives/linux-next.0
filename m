From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the y2038 tree with the ceph tree
Date: Wed, 6 Jun 2018 20:15:01 +1000
Message-ID: <20180606201501.249302c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GWleNEKy4+A5=.ab8Xyf7Ze"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Sage Weil <sage@newdream.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Deepa Dinamani <deepa.kernel@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/GWleNEKy4+A5=.ab8Xyf7Ze
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the y2038 tree got a conflict in:

  fs/ceph/addr.c

between commit:

  c843d13caefa ("libceph: make abort_on_full a per-osdc setting")

from the ceph tree and commit:

  213ae530f442 ("vfs: change inode times to use struct timespec64")

from the y2038 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ceph/addr.c
index ca0d5510ed50,0133ea2b784a..000000000000
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@@ -1934,7 -1936,8 +1936,7 @@@ static int __ceph_pool_perm_get(struct=20
  				     0, false, true);
  	err =3D ceph_osdc_start_request(&fsc->client->osdc, rd_req, false);
 =20
- 	wr_req->r_mtime =3D ci->vfs_inode.i_mtime;
+ 	wr_req->r_mtime =3D timespec64_to_timespec(ci->vfs_inode.i_mtime);
 -	wr_req->r_abort_on_full =3D true;
  	err2 =3D ceph_osdc_start_request(&fsc->client->osdc, wr_req, false);
 =20
  	if (!err)

--Sig_/GWleNEKy4+A5=.ab8Xyf7Ze
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsXtCUACgkQAVBC80lX
0GyCeAf/dGUMXlYf0YkUECbDuJcbj6Ft87iZAypCcAHRljqmAP9pP9hZPMPFRoiS
xPO9ZPxRGp2FB+mwFM6K8zsnFsEkDnACit6QNzzVdkr5ucmcwux1RdmvnebeCMZP
ROsAp1Vx6papuGMFZ9Y/I5t043oTmWjFdyifUxtF0LE9otvKKTBAZmixgkPSnFfg
7gF8KYjrppmYLS4aH7JSxsC0gAk1niG8nVhAY4w3KQqTCaQ5q1S78nHYv7m/aZ/h
5Bn3y92I0Kfk+g3WU4TE0hAhETD8n36qLYF/TCMWa7OXJBgSiiaHHpt+eNnJoTr5
lXtkY1NuTf7rPYabAMeUBtj5fsituA==
=j72G
-----END PGP SIGNATURE-----

--Sig_/GWleNEKy4+A5=.ab8Xyf7Ze--
