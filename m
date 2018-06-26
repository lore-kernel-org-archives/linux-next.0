From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the btrfs-kdave tree
Date: Wed, 27 Jun 2018 08:59:36 +1000
Message-ID: <20180627085936.4f9cc4f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Gc5.ysKSf/P6u8XUl=a85nT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Borisov <nborisov@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Gc5.ysKSf/P6u8XUl=a85nT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs-kdave tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/btrfs/print-tree.c: In function 'print_extent_item':
fs/btrfs/print-tree.c:56:3: error: implicit declaration of function 'btrfs_=
print_v0_err'; did you mean 'btrfs_print_tree'? [-Werror=3Dimplicit-functio=
n-declaration]
   btrfs_print_v0_err(eb->fs_info);
   ^~~~~~~~~~~~~~~~~~
   btrfs_print_tree
fs/btrfs/relocation.c: In function 'find_inline_backref':
fs/btrfs/relocation.c:602:3: error: implicit declaration of function 'btrfs=
_print_v0_err'; did you mean 'btrfs_print_tree'? [-Werror=3Dimplicit-functi=
on-declaration]
   btrfs_print_v0_err(leaf->fs_info);
   ^~~~~~~~~~~~~~~~~~
   btrfs_print_tree
fs/btrfs/extent-tree.c: In function 'btrfs_lookup_extent_info':
fs/btrfs/extent-tree.c:871:4: error: implicit declaration of function 'btrf=
s_print_v0_err'; did you mean 'btrfs_print_tree'? [-Werror=3Dimplicit-funct=
ion-declaration]
    btrfs_print_v0_err(fs_info);
    ^~~~~~~~~~~~~~~~~~
    btrfs_print_tree

Caused by commit

  2a191bb344ee ("btrfs: Add graceful handling of V0 extents")

# CONFIG_BTRFS_ASSERT is not set

I have used the btrfs-kdave tree from next-20180626 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Gc5.ysKSf/P6u8XUl=a85nT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsyxVgACgkQAVBC80lX
0GxHFAf5ARcfTS0B66ZbZdRC5Xdk/V4G9EDZe9WsajXozGh0sVX+hJNHezVL5e2D
9jpbqYcSVzpgNChtqLGyIggB3cTjHTTzUK2p7JgDGa5xqUeSqXCdXwlUGX+YmDT5
76OU5f4KRoppYjV7JfcXWvlu3ElWnvSSkvaINUlPYC4rE2UPgBLS+o2h7AIrsvGU
hY2ICY4TBbuG1Xyh8B7q9yN6Mk6Nj6VI+IMGDxKDixRFLPXwkMXMYjDNOtcFqtCV
TiKwxWMz4GNQSuDXmGB0bnalctI3Uqhthgr9nSzV7CBRLisccQaYPo0xGSVGMDz7
h4ATPV0Am4Ywoj/Niy3Lwb1pvf9hfg==
=7KNM
-----END PGP SIGNATURE-----

--Sig_/Gc5.ysKSf/P6u8XUl=a85nT--
