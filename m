From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the vfs tree
Date: Wed, 20 Jun 2018 11:44:41 +1000
Message-ID: <20180620114441.285f5dfa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nqzNhFJcXFpmRS21zpIK=ea"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/nqzNhFJcXFpmRS21zpIK=ea
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the userns tree got a conflict in:

  fs/proc/internal.h

between commit:

  0223e0999be2 ("procfs: Move proc_fill_super() to fs/proc/root.c")

from the vfs tree and commit:

  04035aa33a12 ("proc: Don't change mount options on remount failure.")

from the userns tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/proc/internal.h
index ea8c5468eafc,69fa8d953cde..000000000000
--- a/fs/proc/internal.h
+++ b/fs/proc/internal.h
@@@ -270,10 -252,16 +270,15 @@@ static inline void proc_tty_init(void)=20
  /*
   * root.c
   */
+ struct proc_mount_options {
+ 	kgid_t pid_gid;
+ 	int hide_pid;
+ };
+=20
  extern struct proc_dir_entry proc_root;
 -extern int proc_parse_options(char *options, struct proc_mount_options *o=
pts);
 =20
  extern void proc_self_init(void);
 -extern int proc_remount(struct super_block *, int *, char *);
 +extern int proc_reconfigure(struct super_block *, struct fs_context *);
 =20
  /*
   * task_[no]mmu.c

--Sig_/nqzNhFJcXFpmRS21zpIK=ea
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlspsYkACgkQAVBC80lX
0Gx24wf/YNUJzc1Pll442jxlvQsbnadnfTbmTRBLq9XH1lgdBLL5mmnGKDpXS4V+
0uFSMbvm9y6vNWeOEiAGR2y02CRTDqc9QgMhdaECkq+zN8Z6C+7M9PdhzX5ifAa0
pZf5+0b6B23rM8rMS+hQb3cEkaml2OfGHW70Sn5juTdKWRKoMww9Bd+DzF/LzfG8
OUdSk/wgp988BIhl9+XMdPUS4AKor/pPk9HJxgGrhnZcUyjc2p5HyHInLd407eA+
MLIqIkuDfJYl7fNCH6Q17Tn+X1pUdfT7yyTyWb3t6vFyAaep8GntG5eZLRktxEsT
CNW0KZJXhlvJQpbtFYQjc8xEor2jzw==
=wC3J
-----END PGP SIGNATURE-----

--Sig_/nqzNhFJcXFpmRS21zpIK=ea--
