From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the selinux tree with the vfs tree
Date: Tue, 18 Dec 2018 14:48:58 +1100
Message-ID: <20181218144858.58d8d1f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Jgy3mWL0eVVCNryKRbK_KCM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Moore <paul@paul-moore.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Jgy3mWL0eVVCNryKRbK_KCM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next merge of the selinux tree got a conflict in:

  security/selinux/hooks.c

between commit:

  2b8073b14c19 ("LSM: split ->sb_set_mnt_opts() out of ->sb_kern_mount()")

from the vfs tree and commit:

  2cbdcb882f97 ("selinux: always allow mounting submounts")

from the selinux tree.

I fixed it up (I used the vfs tree version, plus added the following
patch but I am not sure if it is correct as the latter patch only affected
selinux) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 18 Dec 2018 14:44:13 +1100
Subject: [PATCH] update for "selinux: always allow mounting submounts"

The check moved.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/super.c b/fs/super.c
index 135b147c5bd3..a4505144f95e 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1527,7 +1527,7 @@ int vfs_get_tree(struct fs_context *fc)
 	if (ret)
 		goto err_sb;
=20
-	if (!(fc->sb_flags & MS_KERNMOUNT)) {
+	if (!(fc->sb_flags & (MS_KERNMOUNT | MS_SUBMOUNT))) {
 		ret =3D security_sb_kern_mount(sb);
 		if (ret)
 			goto err_sb;
--=20
2.19.1

--=20
Cheers,
Stephen Rothwell

--Sig_/Jgy3mWL0eVVCNryKRbK_KCM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwYbioACgkQAVBC80lX
0GyCVAgAmUBgqI0hz1s+BJF+peClzwuxPitHyVDv7TE2mtky4dREBGQ7uIAyTzNT
cTGsJXYTRGd6YhgR6nJGZpr9thKoc+vkfc/8a6SDBzagzLsAohuUXzHNNwp3iERq
ZOhGTrc3HZvpfqycdYjghEtnq7wI/mRw9TUHymQ38/r/bD6AdXZUS5OwBzjOt/tz
Ob1GpxKX2u4DEWOk889AtHKSxFLc0DJmM4wvfPD/9xQBqml8u2XO82P0yL4gx2p0
EdezQSvjKeNugQduLdbJ3o04Vu0HtkVdwOMzt242TIQb1/jmsksVNiPQvy1NjOii
wImpqFpibmScXLL5ls7w3ZS8Yj+YKQ==
=IR7e
-----END PGP SIGNATURE-----

--Sig_/Jgy3mWL0eVVCNryKRbK_KCM--
