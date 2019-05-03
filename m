From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the btrfs-kdave tree
Date: Fri, 3 May 2019 10:21:05 +1000
Message-ID: <20190503102105.13578cc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K4F6Rk6H_h3u9KOnGG440l4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josef Bacik <josef@toxicpanda.com>
List-Id: linux-next.vger.kernel.org

--Sig_/K4F6Rk6H_h3u9KOnGG440l4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

After merging the btrfs-kdave tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/btrfs/props.c: In function 'inherit_props':
fs/btrfs/props.c:389:4: warning: 'num_bytes' may be used uninitialized in t=
his function [-Wmaybe-uninitialized]
    btrfs_block_rsv_release(fs_info, trans->block_rsv,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      num_bytes);
      ~~~~~~~~~~

Probably introduced by commit

  b835a4a3faec ("btrfs: use the existing reserved items for our first prop =
for inheritance")

Looks like a false positive to me.

--=20
Cheers,
Stephen Rothwell

--Sig_/K4F6Rk6H_h3u9KOnGG440l4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzLiXEACgkQAVBC80lX
0GzPiAgAkCD5vW0p2Wllg6dt5AOJU2az/iQDy4SvSYz2JLvLvpOUnOpHs9YU+A9F
mrWb8vkCUNq8ZJq79dHE3ICdlo9JsqHNfz1SOHTUc4uh4P7Dc5AUeO5kxFq8elm6
GC+5XlfRPpMlMAlGeQbplcAYUdq//cZOfRUHXADQSlS8/cZmjVzFfdXuUwha4qDg
YuVIwEvs55573nvbH1T+a2QzYYatmiNIJlglzbHLoDgdKSiy1hbev1EYOT+CNiJu
zCiHWaiinNyb8QeZwAJ+qBvJmjq56Md7i0CVY2pLLHSU6qkw4plGQCWNL9h+ctjr
/wyP92ilqxutPot/OButB7m0Zzs6mA==
=wCvO
-----END PGP SIGNATURE-----

--Sig_/K4F6Rk6H_h3u9KOnGG440l4--
