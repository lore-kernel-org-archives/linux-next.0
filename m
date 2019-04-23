From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the pidfd
 tree
Date: Tue, 23 Apr 2019 18:46:57 +1000
Message-ID: <20190423184657.3d16ba97@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eydUOPajQGaNyvHcxj254qE"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <christian@brauner.io>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrea Arcangeli <aarcange@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/eydUOPajQGaNyvHcxj254qE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/fork.c

between commit:

  2897d468ea48 ("clone: add CLONE_PIDFD")

from the pidfd tree and commit:

  83e1afab81ac ("userfaultfd: use RCU to free the task struct when fork fai=
ls")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/fork.c
index ad2896dd8df2,1c10a912b9b6..000000000000
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@@ -1667,58 -1673,24 +1678,76 @@@ static inline void rcu_copy_process(str
  #endif /* #ifdef CONFIG_TASKS_RCU */
  }
 =20
 +static int pidfd_release(struct inode *inode, struct file *file)
 +{
 +	struct pid *pid =3D file->private_data;
 +
 +	file->private_data =3D NULL;
 +	put_pid(pid);
 +	return 0;
 +}
 +
 +#ifdef CONFIG_PROC_FS
 +static void pidfd_show_fdinfo(struct seq_file *m, struct file *f)
 +{
 +	struct pid_namespace *ns =3D proc_pid_ns(file_inode(m->file));
 +	struct pid *pid =3D f->private_data;
 +
 +	seq_put_decimal_ull(m, "Pid:\t", pid_nr_ns(pid, ns));
 +	seq_putc(m, '\n');
 +}
 +#endif
 +
 +const struct file_operations pidfd_fops =3D {
 +	.release =3D pidfd_release,
 +#ifdef CONFIG_PROC_FS
 +	.show_fdinfo =3D pidfd_show_fdinfo,
 +#endif
 +};
 +
 +/**
 + * pidfd_create() - Create a new pid file descriptor.
 + *
 + * @pid:  struct pid that the pidfd will reference
 + *
 + * This creates a new pid file descriptor with the O_CLOEXEC flag set.
 + *
 + * Note, that this function can only be called after the fd table has
 + * been unshared to avoid leaking the pidfd to the new process.
 + *
 + * Return: On success, a cloexec pidfd is returned.
 + *         On error, a negative errno number will be returned.
 + */
 +static int pidfd_create(struct pid *pid)
 +{
 +	int fd;
 +
 +	fd =3D anon_inode_getfd("[pidfd]", &pidfd_fops, get_pid(pid),
 +			      O_RDWR | O_CLOEXEC);
 +	if (fd < 0)
 +		put_pid(pid);
 +
 +	return fd;
 +}
 +
+ #ifdef CONFIG_MEMCG
+ static void __delayed_free_task(struct rcu_head *rhp)
+ {
+ 	struct task_struct *tsk =3D container_of(rhp, struct task_struct, rcu);
+=20
+ 	free_task(tsk);
+ }
+ #endif /* CONFIG_MEMCG */
+=20
+ static __always_inline void delayed_free_task(struct task_struct *tsk)
+ {
+ #ifdef CONFIG_MEMCG
+ 	call_rcu(&tsk->rcu, __delayed_free_task);
+ #else /* CONFIG_MEMCG */
+ 	free_task(tsk);
+ #endif /* CONFIG_MEMCG */
+ }
+=20
  /*
   * This creates a new process as a copy of the old one,
   * but does not actually start it yet.

--Sig_/eydUOPajQGaNyvHcxj254qE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+0QEACgkQAVBC80lX
0GyOjwgAigfdLOFajEgYYvXzKoBod23eQnMS7CkMSx6WmEqn3bHjYt8CMPhYzFlX
kVHgPLdL+jVDWbo9ZiWgbU78L+52178E74NM8jWvScjM2iWTagjZ75nWsbr6jF8n
qJsMRAKxC+wBCV09USySGGd4mau6Bj4OQdf+2OxZeWBOZufigd/JGjL/Mbb6ioUh
9/M99UH9Dp+Ile0aARYGOy1YL9jUwv8PyKlGjifS6p6/QGP3uKpaoOofpYSkNHYv
btRp3Y8Lx9AHNXacIrx25rpYDFpediO7Earyet1iF3tCL8g3x3gHqx1Ci6fxnDsI
M1YAOsAgvcglBl66SC0kq4THIUmCvA==
=/Tue
-----END PGP SIGNATURE-----

--Sig_/eydUOPajQGaNyvHcxj254qE--
