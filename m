Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617207;
	b=0CAHSqIVEI9ODKR/6s4g1DdKzH/VFAhG1M0ef5L1Mrw0pnRVMlxX53ZXEQL2MfcYlB7M
	 stnYypV6aq0bqM6F1NmWoJWdAXyl/Yyn2acaNNm0PHDontPLRim+jdHTlDKs8IPhayt4y
	 VNKx78/Y8ttmaHMOdRor7y6fRUU8Tyw7IgpE4ka6O3qXQHJDIzInP8XtUjnmle65j0hM6
	 ZXIBzKhohOQxDsUgfowNBqLpOH/3/DkbvUGEHES2L1kpPquhSs9dRDg5f/9wPczGbUPiZ
	 mrJOY2unLfjxVP9m3rRuqEvpuj/m4BC4e1SL+mH610D/CXYuz15hZ4xCXZZR0rCQ9bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617207;
	h=Received:DKIM-Signature:Date:From:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=rV6CHJchb0qjwJSDsUL1/3U4TbOJfiM0uKlPivAJ1Fc=;
	b=At6kBV9KNi5Yo9+HF+o9wR1iiZ+6WeOq7bc5W8UZ/+eEuZDAzeky6k9Yo0MVVrTCzQqM
	 dBlQn6g49h/jOOodyFe88TQltO0UTslwKohQMQKQ1TkRLIOazF0e5rSqeGVRJ+rntyk5i
	 sz/yOarqskOBiWQUO1inWR1QYreGv2jVQeOEnTY8MUvvTzhIHJ4MGbyJMUMH+1Ir9H2TV
	 Y4Q8w9SNxDVFn+VmOWRp2mntk/VW71w7v2qwpwMWHFSED5q8pzC8KvtDfqAQXlqrZPUjM
	 VpXxntshaVeeCNjREZryzcEg9Wz7CrMAwEKRF5J2gj8oNSHisw7yapNx8iuDzr3FjYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EKWxo8zz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5E3606A326;
	Wed, 25 Nov 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EKWxo8zz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37921F000D0;
	Wed, 25 Nov 2026 14:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795617206;
	bh=rV6CHJchb0qjwJSDsUL1/3U4TbOJfiM0uKlPivAJ1Fc=;
	h=Date:From:Cc:Subject;
	b=EKWxo8zzKFiMR6GxvOmnWBD9IvVDTuzSBku9WRcFcZdUhyQkqCeJ+VNLURmR1Mkik
	 0qEpL//nYOosPRpBHtZIN5ZaaYHjp94+ZfGJTcHF7G5r1jT3aCK5ptdk3CbQEHUawP
	 sNFosuURlm1YzbJIx+4sMHy2fUfqMpYUbwNAYzb64y7ZjUxkpNxGKbZmyXzj9Zioe5
	 0tILJhhuUuS5JHjwQ141ova5qKPPHtPldX9tIOd+ge7Xu9TUhuu/pVO6DV9gGpn8lV
	 3EAXsvNwGO8f+TqFay9wREVBeahvUnx9pQY2FqVnpecTiYcNi8l9FDOQcpIlARQO94
	 SdzXMAHetzwUQ==
Date: Wed, 25 Nov 2026 14:33:23 +0000
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-ID: <awbxs-lc28R6_cWv@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0EYkkj+uSZ6hvLkh"
Content-Disposition: inline


--0EYkkj+uSZ6hvLkh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/proc/internal.h

between commit:

  262ae352515b6 ("proc: don't lock task inodes whose owner has not changed")

=66rom the mm-nonmm-unstable tree and commit:

  6819e45d237d1 ("proc: add helpers for files that outlive an execve()")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/proc/internal.h
index 5782189431d42,6c18496aad93e..0000000000000
--- a/fs/proc/internal.h
+++ b/fs/proc/internal.h
@@@ -8,8 -8,8 +8,9 @@@
  #include <linux/proc_fs.h>
  #include <linux/proc_ns.h>
  #include <linux/refcount.h>
 +#include <linux/seqlock.h>
  #include <linux/spinlock.h>
+ #include <linux/lockdep.h>
  #include <linux/atomic.h>
  #include <linux/binfmts.h>
  #include <linux/sched/coredump.h>
@@@ -292,8 -330,14 +357,16 @@@ int proc_nochmod_setattr(const struct m
  extern void proc_pid_evict_inode(struct proc_inode *);
  extern struct inode *proc_pid_make_inode(struct super_block *, struct tas=
k_struct *, umode_t);
  extern void pid_update_inode(struct task_struct *, struct inode *);
 +bool proc_task_owner_valid(struct task_struct *task, struct inode *inode,
 +			   umode_t dump_mode, umode_t mode);
+ int proc_exec_id_single_open(struct inode *inode, struct file *file,
+ 			     int (*show)(struct seq_file *, void *));
+ int proc_exec_id_single_release(struct inode *inode, struct file *file);
+ int proc_exec_id_dir_open(struct inode *inode, struct file *file);
+ int proc_exec_id_dir_release(struct inode *inode, struct file *file);
+ int proc_exec_id_lock(const struct file *file, struct task_struct *task,
+ 		      u64 *exec_id);
+ void proc_exec_id_unlock(struct task_struct *task);
  extern int pid_delete_dentry(const struct dentry *);
  extern int proc_pid_readdir(struct file *, struct dir_context *);
  struct dentry *proc_pid_lookup(struct dentry *, unsigned int);

--0EYkkj+uSZ6hvLkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG8bIACgkQJNaLcl1U
h9DFNwgAhU3xVwAl2u0op45N8jwe2akDJp6/eu0NvKLaPGZI+GxVno1B5EMd37fR
pLYEto765Glrj8TqZfo62eU+g62xA8S+p52Czn8JDowFvZ7r7N4t5sO9Xo3BHOOd
D0R0yQKgSrICOYnbPOanMtnESoNGpSHa4bl5FV8DPns11LvZ4kcioyeXL65l3GL/
viRxfVSTzE3tMfh+CD/dfvMRFV6CHqNIKnwSAGe6kUufFvmfgTj7L4N+xFVYdRjg
MfH3RCJ0rvWL4CZKkuW9m1hshU+Sg8gXNkobl5W/2IN08hmoXWZtXiyOfWDFwADD
kYWT5oOTR6oWGp1bzyUdbst3+6jcrQ==
=i3HR
-----END PGP SIGNATURE-----

--0EYkkj+uSZ6hvLkh--
