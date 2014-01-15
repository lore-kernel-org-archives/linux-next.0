From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Wed, 15 Jan 2014 15:07:43 +1100
Message-ID: <20140115150743.ff3de076048b32e82fa5ba27@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__15_Jan_2014_15_07_43_+1100_vzHtctWUMmX0MDi0"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Brown <neilb@suse.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kent Overstreet <kmo@daterainc.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__15_Jan_2014_15_07_43_+1100_vzHtctWUMmX0MDi0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Today's linux-next merge of the md tree got a conflict in
drivers/md/raid10.c between commit 4f024f3797c4 ("block: Abstract out
bvec iterator") from the block tree and commit b50c259e25d9 ("md/raid10:
fix two bugs in handling of known-bad-blocks") from the md tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/md/raid10.c
index 6d43d88657aa,8d39d63281b9..000000000000
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@@ -1256,8 -1319,8 +1256,8 @@@ read_again
  			/* Could not read all from this device, so we will
  			 * need another r10_bio.
  			 */
- 			sectors_handled =3D (r10_bio->sectors + max_sectors
+ 			sectors_handled =3D (r10_bio->sector + max_sectors
 -					   - bio->bi_sector);
 +					   - bio->bi_iter.bi_sector);
  			r10_bio->sectors =3D max_sectors;
  			spin_lock_irq(&conf->device_lock);
  			if (bio->bi_phys_segments =3D=3D 0)

--Signature=_Wed__15_Jan_2014_15_07_43_+1100_vzHtctWUMmX0MDi0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJS1gmSAAoJEMDTa8Ir7ZwVFOYP/1l77UJFdfzcVCzGq1QWbN04
OLhwA7rOavW5xKLa79IZ/w08cyHHomIQ7RBvyBDslpFwV/k1yMMTBsZE3CuVNAYp
LpJlXB7bJ6IsKU0yfHxSVGLt3ALe39nQCBdq/k637MbWYACVFbC7KWik+XqGt37L
F3DQQnGwqYRtIXQxi51pjPkCL95VJ9cRE65afcDFcRmxvZqfI4lo/2PmAexhqD9Z
CPNNBIftcx3fXy3Ie6uwF5dOx1yaPOeRQ/gaCfe41K00oY+maNE302JhmOUBO1rP
p0vo1Kgp0Up31tkT3b4gec6lGgRFPYeptM9Yjf3YCfL0os0tm8tdtxuhLJAedRKs
UZa2bHFyyrtdtcp93qqMnTAoOTY1IybVu+MsQodr3RKhkTKG/LXiZefTZAhqadp3
eyEuMLIxNazZM4zgsN+L00Kvtuz5Uf6IIXHNS0OAhH2TJ2P8XoPG01gKxpimxx8T
Am/5sfhltSY5Bf9xcQ4L9ZIPxcEOiv9sNfnD/wPuZxoYn6H5Tgey7HXjRhBzQpS4
v6BIgdtMKVVU5ucz7WYMewOtf8ijYZ9gHTibttzwNv4ahKw8w9NZHEePGdpzZCmA
HxE3OYxD+JRHr1HCinuk/B8CqaxCtijCp/yz+v0kxzhVnfsTdh6u72Z4n+RD8jf6
V06kAezldEv9WEcHlgca
=SZfX
-----END PGP SIGNATURE-----

--Signature=_Wed__15_Jan_2014_15_07_43_+1100_vzHtctWUMmX0MDi0--
