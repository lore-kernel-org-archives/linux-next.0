From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Wed, 3 Oct 2018 10:32:22 +1000
Message-ID: <20181003103222.6e1655cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7RqvNtTlGblUa5KMJ2piGck"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Daniel Rosenberg <drosen@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/7RqvNtTlGblUa5KMJ2piGck
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/home/sfr/next/next/fs/f2fs/super.c: In function 'f2fs_remount':
/home/sfr/next/next/fs/f2fs/super.c:1589:16: error: 'MS_RDONLY' undeclared =
(first use in this function); did you mean 'IS_RDONLY'?
  if ((*flags & MS_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
                ^~~~~~~~~
                IS_RDONLY

Caused by commit

  dcf8001d292b ("vfs: Suppress MS_* flag defs within the kernel unless expl=
icitly enabled")

interacting with commit

  f80f781514ef ("f2fs: checkpoint disabling")

from the f2fs tree.

I have added the following merge fix patch for today.  If it is correct,
I assume that it could be applied to f2fs tree as the the other uses of
MS_RDONLY have already been changed to SB_RDONLY.  (There is another
use of MS_READONLY in this function that is already cleaned up in the
vfs tree commit.)

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Oct 2018 10:27:04 +1000
Subject: [PATCH] f2fs: update for MS_* flags mostly going away

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6ed77589ff2b..b612a9e4a35e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1586,7 +1586,7 @@ static int f2fs_remount(struct super_block *sb, int *=
flags,
 		goto restore_opts;
 	}
=20
-	if ((*flags & MS_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
+	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err =3D -EINVAL;
 		f2fs_msg(sbi->sb, KERN_WARNING,
 			"disabling checkpoint not compatible with read-only");
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/7RqvNtTlGblUa5KMJ2piGck
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu0DhcACgkQAVBC80lX
0GyWhQf9EIw/aOB1iDx/v9NLBCqbMNUvpyC6UOsetVp1oRAXBdznh9E0klSLMT/c
sKieccmNuqVvj5jCcpDs6A3xfulwGRtEBiIE8VV3HtCrjCG/PRcANaxBwjI9vLdi
/wfdIm7JeoJeXGI2QdSj6D/O5ATsqJrKM/sBeYiR5RQSGr7/T8YfG3u75c6bI3rK
DgJiOSbeXV+CFA1mgyx93QEid1cU9mK2MOi4U2ob3PYyqDZpxSkldd9Vg5x0gISc
vbL+mRDG1wcrc3W9VqGPER/n5CmIIRcD8WQ2I006YFxgHoph50MxHAKXS7zGjiPF
D+QD5eWnfVaa9xzTm+TB3D+PYwMjAw==
=M5no
-----END PGP SIGNATURE-----

--Sig_/7RqvNtTlGblUa5KMJ2piGck--
