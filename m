From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the fuse tree
Date: Tue, 7 May 2019 09:53:23 +1000
Message-ID: <20190507095323.4ec2d3f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/I4aUjkWfSAsJYqYUG=XoBhP"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, zhangliguang <zhangliguang@linux.alibaba.com>
List-Id: linux-next.vger.kernel.org

--Sig_/I4aUjkWfSAsJYqYUG=XoBhP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/fuse/inode.c

between commit:

  829f949b6e06 ("fuse: clean up fuse_alloc_inode")

from the fuse tree and commit:

  9baf28bbfea1 ("fuse: switch to ->free_inode()")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/fuse/inode.c
index bc02bad1be7c,f485d09d14df..000000000000
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@@ -102,25 -104,16 +102,16 @@@ static struct inode *fuse_alloc_inode(s
  		return NULL;
  	}
 =20
 -	return inode;
 +	return &fi->inode;
  }
 =20
- static void fuse_i_callback(struct rcu_head *head)
- {
- 	struct inode *inode =3D container_of(head, struct inode, i_rcu);
- 	kmem_cache_free(fuse_inode_cachep, get_fuse_inode(inode));
- }
-=20
- static void fuse_destroy_inode(struct inode *inode)
+ static void fuse_free_inode(struct inode *inode)
  {
  	struct fuse_inode *fi =3D get_fuse_inode(inode);
- 	if (S_ISREG(inode->i_mode) && !is_bad_inode(inode)) {
- 		WARN_ON(!list_empty(&fi->write_files));
- 		WARN_ON(!list_empty(&fi->queued_writes));
- 	}
+=20
  	mutex_destroy(&fi->mutex);
  	kfree(fi->forget);
- 	call_rcu(&inode->i_rcu, fuse_i_callback);
+ 	kmem_cache_free(fuse_inode_cachep, fi);
  }
 =20
  static void fuse_evict_inode(struct inode *inode)

--Sig_/I4aUjkWfSAsJYqYUG=XoBhP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzQyPMACgkQAVBC80lX
0Gz67wf/T/vGJqlHvEO8LO6cCYEIVD/kUhvd4CgokwwnlFfi1xl49mT1TJmFF8yp
qYVlD4u2+voT2x+6QxRpl6FmKj9UFpP6961xfgkYavGlwLvE/FhLfpkiVdXJdTAD
ICcFlz94g8+g2g0rfJxwcBMPSN16T2IqOGaxEZjmjgKyPNL6FOUmLQdUekAUPP6p
MqOz+lagWGvceW78ywEXGdABwo6Yi8FaCk+uYMBx8JRn4vTKmH0K42kLVGXHugz6
ObE/UWoUvojKlrwT4ycuOgfqzvQmqTRf8FiJizUCPw3OU8Y/HTFIQEUKyE6rLxfO
ho3C5GOHDPDlm/k8EAmIofkV/GwnkQ==
=R/hD
-----END PGP SIGNATURE-----

--Sig_/I4aUjkWfSAsJYqYUG=XoBhP--
