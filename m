From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the vfs tree
Date: Thu, 17 May 2018 16:36:00 +1000
Message-ID: <20180517163600.4d3e585d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4aB8OO75BG5.VGCyc0EL1Rq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4aB8OO75BG5.VGCyc0EL1Rq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/vmalloc.c

between commits:

  fddda2b7b521 ("proc: introduce proc_create_seq{,_data}")
  44414d82cfe0 ("proc: introduce proc_create_seq_private")

from the vfs tree and patch:

  "mm: use octal not symbolic permissions"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/vmalloc.c
index 89efac3a020e,abf54a3e71e6..000000000000
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@@ -2738,14 -2738,25 +2738,14 @@@ static const struct seq_operations vmal
  	.show =3D s_show,
  };
 =20
 -static int vmalloc_open(struct inode *inode, struct file *file)
 +static int __init proc_vmalloc_init(void)
  {
  	if (IS_ENABLED(CONFIG_NUMA))
- 		proc_create_seq_private("vmallocinfo", S_IRUSR, NULL,
 -		return seq_open_private(file, &vmalloc_op,
 -					nr_node_ids * sizeof(unsigned int));
++		proc_create_seq_private("vmallocinfo", 0400, NULL,
 +				&vmalloc_op,
 +				nr_node_ids * sizeof(unsigned int), NULL);
  	else
- 		proc_create_seq("vmallocinfo", S_IRUSR, NULL, &vmalloc_op);
 -		return seq_open(file, &vmalloc_op);
 -}
 -
 -static const struct file_operations proc_vmalloc_operations =3D {
 -	.open		=3D vmalloc_open,
 -	.read		=3D seq_read,
 -	.llseek		=3D seq_lseek,
 -	.release	=3D seq_release_private,
 -};
 -
 -static int __init proc_vmalloc_init(void)
 -{
 -	proc_create("vmallocinfo", 0400, NULL, &proc_vmalloc_operations);
++		proc_create_seq("vmallocinfo", 0400, NULL, &vmalloc_op);
  	return 0;
  }
  module_init(proc_vmalloc_init);

--Sig_/4aB8OO75BG5.VGCyc0EL1Rq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlr9ItAACgkQAVBC80lX
0GzHmQf9GAVNklBpqE+zyiWcVymQSr2WnuFVAGUOkz7mZrooJNytFzSaSWGZpJ5H
vTSp2T3oevXpjvRj2PwGVoStzWbIWnZiwPdY3PUON8m6HYbAZlSF0GlcAUijyii8
F2mziyF8f9d23Mz2ZsChFVCHAO+w0CNsQcg8mUG2FrIus28HY1F78zWW+hlPBAyZ
d0bpqFB6z7yViRQIUajlVx9GimrIhbI2+/7Ew1aqMj6C0C7FJGasNNu6e7b0yXgJ
Xg39bU9rgYSlp2NJi2baKyl8iSNvl452nJzFMDBd1MHxR1SpFi5Y2O4z32A00HTb
0rV/YA3CKTZOV57pARfl1XzoRSMrzA==
=U1Uj
-----END PGP SIGNATURE-----

--Sig_/4aB8OO75BG5.VGCyc0EL1Rq--
