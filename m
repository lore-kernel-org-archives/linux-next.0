From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the net-next
 tree
Date: Mon, 23 Jul 2018 15:12:24 +1000
Message-ID: <20180723151224.69a73892@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IOndqov/G_gyZt2cVw+4vKf"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rajat Jain <rajatja@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/IOndqov/G_gyZt2cVw+4vKf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in:

  fs/sysfs/group.c

between commit:

  5f81880d5204 ("sysfs, kobject: allow creating kobject belonging to arbitr=
ary users")

from the net-next tree and commit:

  c855cf2759d2 ("sysfs: Fix internal_create_group() for named group updates=
")

from the driver-core tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/sysfs/group.c
index c7a716c4acc9,38240410f831..000000000000
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@@ -122,15 -118,23 +122,24 @@@ static int internal_create_group(struc
  			kobj->name, grp->name ?: "");
  		return -EINVAL;
  	}
 +	kobject_get_ownership(kobj, &uid, &gid);
  	if (grp->name) {
- 		kn =3D kernfs_create_dir_ns(kobj->sd, grp->name,
- 					  S_IRWXU | S_IRUGO | S_IXUGO,
- 					  uid, gid, kobj, NULL);
- 		if (IS_ERR(kn)) {
- 			if (PTR_ERR(kn) =3D=3D -EEXIST)
- 				sysfs_warn_dup(kobj->sd, grp->name);
- 			return PTR_ERR(kn);
+ 		if (update) {
+ 			kn =3D kernfs_find_and_get(kobj->sd, grp->name);
+ 			if (!kn) {
+ 				pr_warn("Can't update unknown attr grp name: %s/%s\n",
+ 					kobj->name, grp->name);
+ 				return -EINVAL;
+ 			}
+ 		} else {
 -			kn =3D kernfs_create_dir(kobj->sd, grp->name,
 -					       S_IRWXU | S_IRUGO | S_IXUGO,
 -					       kobj);
++			kn =3D kernfs_create_dir_ns(kobj->sd, grp->name,
++						  S_IRWXU | S_IRUGO | S_IXUGO,
++						  uid, gid, kobj, NULL);
+ 			if (IS_ERR(kn)) {
+ 				if (PTR_ERR(kn) =3D=3D -EEXIST)
+ 					sysfs_warn_dup(kobj->sd, grp->name);
+ 				return PTR_ERR(kn);
+ 			}
  		}
  	} else
  		kn =3D kobj->sd;

--Sig_/IOndqov/G_gyZt2cVw+4vKf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltVY7gACgkQAVBC80lX
0GzHPQf+J0/auWMhpVVK4yFCEdUYpMxE7Rdox/lf6dwyOLQOM2TK1d1mWywV5eLy
qhIRwzOfSP7IJsAS5Oed/zZjdaNt6YYSFaKkzqiIq9yNasCqvr0fmvgfUucr/gE4
irv5YMDWKsBbJ1oOsTVsbc1MeB7RfPE5vekea3RWG1QqEeh09lyJcwtysCwUdM62
Nlw44p+oGPi+L+x/poGCOoPuUKBAtJsi5dqbCfeegdx0OyAA5kNnr1FadkCuL4sY
5Cwr7yj3ArhGrMMBuFwKnNCIO0efptr+kRaYp9O8jOA3X0o5zn8r3vRsRGadxu3e
N6Zd1ieT0ARvdJtAnZVUGRBqdkpcig==
=ImcX
-----END PGP SIGNATURE-----

--Sig_/IOndqov/G_gyZt2cVw+4vKf--
