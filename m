From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the f2fs tree with the fscrypt tree
Date: Tue, 11 Dec 2018 10:13:22 +1100
Message-ID: <20181211101322.438946fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mzvSQGkDD/xe951vhGipX7/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chandan Rajendra <chandan@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/mzvSQGkDD/xe951vhGipX7/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the f2fs tree got a conflict in:

  fs/f2fs/dir.c

between commit:

  848a010287e6 ("f2fs: use IS_ENCRYPTED() to check encryption status")

from the fscrypt tree and commit:

  4e240d1bab1e ("f2fs: check memory boundary by insane namelen")

from the f2fs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/dir.c
index cf9e2564388d,c0c845da12fa..000000000000
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@@ -808,7 -808,18 +808,18 @@@ int f2fs_fill_dentries(struct dir_conte
  		de_name.name =3D d->filename[bit_pos];
  		de_name.len =3D le16_to_cpu(de->name_len);
 =20
+ 		/* check memory boundary before moving forward */
+ 		bit_pos +=3D GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
+ 		if (unlikely(bit_pos > d->max)) {
+ 			f2fs_msg(sbi->sb, KERN_WARNING,
+ 				"%s: corrupted namelen=3D%d, run fsck to fix.",
+ 				__func__, le16_to_cpu(de->name_len));
+ 			set_sbi_flag(sbi, SBI_NEED_FSCK);
+ 			err =3D -EINVAL;
+ 			goto out;
+ 		}
+=20
 -		if (f2fs_encrypted_inode(d->inode)) {
 +		if (IS_ENCRYPTED(d->inode)) {
  			int save_len =3D fstr->len;
 =20
  			err =3D fscrypt_fname_disk_to_usr(d->inode,

--Sig_/mzvSQGkDD/xe951vhGipX7/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwO8xIACgkQAVBC80lX
0Gy9JggAm9oZZAeRq13RI5i6WlpVoydGB0NRXvHe+d/ThDkZhonr0FoQBKgYM20U
LXdp6oryxnL5XxREFtEaJR3HwBNLnDZtaGLFmmaQrnbwz3vh0CCqgh6F1xWRW3lP
FaDUMUUK7MKlyzKDXvjPmIzT8euCbRtDvvOZpGw7nWCBFBhLQZaFKezehGTifBAk
Vr0vJpRflY1WIKHzBAp4zybC2oHx6jf4t02kYBSSMXkZ9iOLye8xrVOgShcKf1uq
X3iCRiNGdpLx/xri9dw/GvShfyP4UdTm9cvQ8Fb8PSNXeQO6hvQKZi7vsiHRj3/U
OZu0lid6qy4UfKLIfDyiAIbjp48ItA==
=s6Vc
-----END PGP SIGNATURE-----

--Sig_/mzvSQGkDD/xe951vhGipX7/--
