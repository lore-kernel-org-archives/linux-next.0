From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ext3 tree
Date: Wed, 28 Dec 2011 11:22:54 +1100
Message-ID: <20111228112254.551c2ee5a1ac8509962d6611@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__28_Dec_2011_11_22_54_+1100_9FCCECjo.VvnRCEy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kara <jack@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__28_Dec_2011_11_22_54_+1100_9FCCECjo.VvnRCEy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jan,

After merging the ext3 tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/reiserfs/super.c: In function 'reiserfs_show_options':
fs/reiserfs/super.c:652:20: error: 'struct reiserfs_sb_info' has no member =
named 's_qf_names'
fs/reiserfs/super.c:653:50: error: 'struct reiserfs_sb_info' has no member =
named 's_qf_names'
fs/reiserfs/super.c:656:20: error: 'struct reiserfs_sb_info' has no member =
named 's_qf_names'
fs/reiserfs/super.c:657:50: error: 'struct reiserfs_sb_info' has no member =
named 's_qf_names'
fs/reiserfs/super.c:660:20: error: 'struct reiserfs_sb_info' has no member =
named 's_jquota_fmt'
fs/reiserfs/super.c:661:21: error: 'struct reiserfs_sb_info' has no member =
named 's_jquota_fmt'
fs/reiserfs/super.c:663:26: error: 'struct reiserfs_sb_info' has no member =
named 's_jquota_fmt'

Caused by commit 5fa84b871b97 ("reiserfs: Properly display mount options
in /proc/mounts").  Hint: CONFIG_QUOTA is not set in this build.

I have used the ext3 tree from next-20111222 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__28_Dec_2011_11_22_54_+1100_9FCCECjo.VvnRCEy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO+mFeAAoJEECxmPOUX5FEauUP+wc4egpHdwTB7XSCDmIQ3mTr
H9gfvHyFyW7MufrhaRdI7YZp+vEI4DRx/0GXHhrIHFr9muy8ZC4PPchA/XAK2T3/
GsfPXu//UjLJhl0K1o0gnIsFz6jYUKCv6JKFe6PSyUZQJ6ERqwTj5zucKyRo4CiF
pZ4Nu0TSgtf5Uc+/eSyJpcsuUlSjLehYhMsf64kCZER4st4Inr2rVo3SdkAysQME
pliLUxoQp/fswYPxfoHN77T+wqWRHQxClRPqkvjIVY8NxmiIn1a/iASK76nzNKLb
UW0YcGPB4h9XaDNOi0cshwzNNSYvd4ALeTInomwSv/IERg8lPW+sDJqv/OUWWsle
TSxzPr9S+X2x7qvEFDnx/em+QVCUYpIy0E8cbKnKV/YfbQbms6jSxcoKaKMR2MTV
U39JmJWVAfjmRS7JJ+ug8jE39dWwx2DnUgL2Kka3xw9vMYdwiVssLrf2ROPIU4Xo
nQFAUI9+Bn8K5Em7dpONJyDQtPtq4Bvlk9hy8aT7z9z5KkNMOQL80xydoWTpNJvO
e5N42q2SKC5IK+woSm42xq1bblIwwTJ/cU8LPo7jLmEd8G4Vj0zYqkHAE3ntfZy9
9Gkckv19vx58dSbqgPcziL5qiTrxmNtdwWvk94V7EgiyixzFWA7j3zqzE6RXIW95
WDIV9jJhyWw0u94J4jLb
=FKsd
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Dec_2011_11_22_54_+1100_9FCCECjo.VvnRCEy--
