From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the btrfs-kdave tree
Date: Mon, 26 Nov 2018 11:06:29 +1100
Message-ID: <20181126110629.45969c51@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NY1.eIclTa7R63+zM52V_6P"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>, Kees Cook <keescook@google.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/NY1.eIclTa7R63+zM52V_6P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

After merging the btrfs-kdave tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from include/linux/string.h:6,
                 from arch/powerpc/include/asm/paca.h:19,
                 from arch/powerpc/include/asm/current.h:16,
                 from include/linux/sched.h:12,
                 from fs/btrfs/volumes.c:6:
fs/btrfs/volumes.h: In function 'btrfs_op':
include/linux/compiler.h:77:22: warning: this statement may fall through [-=
Wimplicit-fallthrough=3D]
 # define unlikely(x) __builtin_expect(!!(x), 0)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:72:2: note: in expansion of macro 'unlikely'
  unlikely(__ret_warn_on);    \
  ^~~~~~~~
fs/btrfs/volumes.h:395:3: note: in expansion of macro 'WARN_ON_ONCE'
   WARN_ON_ONCE(1);
   ^~~~~~~~~~~~
In file included from fs/btrfs/volumes.c:22:
fs/btrfs/volumes.h:396:2: note: here
  case REQ_OP_READ:
  ^~~~

Introduced by commit

  cf8cddd38bab3 ("btrfs: don't abuse REQ_OP_* flags for btrfs_map_block")

exposed by my new use of -Wimplicit-fallthrough

I am not sure why this has only turned up now (as opposed to earlier
today).

--=20
Cheers,
Stephen Rothwell

--Sig_/NY1.eIclTa7R63+zM52V_6P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv7OQUACgkQAVBC80lX
0GxrKQgAnO359KtN/3xmOk8Bo3Qx881zdG8xFgAMpV44xOEF/eOdV6nmgs+Bx6K4
ogWVSzdOM/xLIbeglvpTCUeiiU+H8eB2VJU9xIaXRroxXvgWp6SZp3V6PPoDS0I5
b2H/ZHzkQbIgJLK/WoneqJSZanSW0iChijeoHCn7W+HB2tK1EUowKsZz4D6sBL1l
+mMDZgqXkwLit4OwCtqsiAuRp9NgR5g3Llr9l2l70RoxyBvD/rtSILkt4WKtZQpz
CRNe1RigFsxmSxC1xgv+m6/+z5AenqSCfmOJ0i1u0O72/KAkLUFPhMgzaQv2vUNt
A98AC1wEv4GWROuw+bERZ7MswY6BKw==
=wpGx
-----END PGP SIGNATURE-----

--Sig_/NY1.eIclTa7R63+zM52V_6P--
