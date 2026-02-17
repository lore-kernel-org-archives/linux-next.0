Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C658338584;
	Tue, 17 Feb 2026 13:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771335566; cv=none; b=hWe+ZQMDvw+r5RdzMQ6UI1kPQEzSLrMPYNMcPAWVFymV6/QxTDVzTRNpGevgRpsgfL6OVX0UidX2pu/uz8szbJEujIa06ooilnk8g02YGmF6f7VRL7/8yRzX7VojwgqDwbb8U1c5XFGz5JKg0rrcDQt7UP674nw7hXN7774WPvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771335566; c=relaxed/simple;
	bh=XCxaHbWVs8/Uh2TGFeCo/8I+UuoT6li5DyMEQ3PYHSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ntw0oqpeu6biwzli3euNL5fteHJ22yKMupupSm90VjOxExIjFAG7AxL43M6HOWVDs2feLWhpuoLdLAC90YgybwV2f+dAKakncINcZ/9410izTiE0yipiIZKHHOi5dJx6ZUqa+13yLgQuWmLqnJahkViGFspITmY/UBw5Dwh19wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pF2JEWDl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pF2JEWDl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7A6C19423;
	Tue, 17 Feb 2026 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771335566;
	bh=XCxaHbWVs8/Uh2TGFeCo/8I+UuoT6li5DyMEQ3PYHSw=;
	h=Date:From:To:Cc:Subject:From;
	b=pF2JEWDlyo1XzWLisz9a+rJW7JA9l9vhAFwUpmHf0TiThMbnMJdFko7xtfpWfpIGU
	 nLWRj6HeOWbQeiFgPvmp4urGtd4SXhWOKZxPYA6h8p8D0xrv3r7YYz3lS/LRDM0EvT
	 LjVD0h3olm/2IV2ZMSDCysy8zm8MkTyEx4xSK60ONmJcpMfDib9hXYtdc6zZdoZLUS
	 /LHTikn/dLpx/qbguvnxi8Dd+CcLqD4O5D17kEpY+WiKDFnH998vn/JMp4P13UEzQ+
	 IrGD/LEtpNqiWPgvG5klNJRCv4/xnJlbxi0X1/0dR5C1k6HEZlGVyRvH2rERUZrwpL
	 bxZtuOKycH1jg==
Date: Tue, 17 Feb 2026 13:39:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the vfs-fixes
 tree
Message-ID: <aZRvitVF-hq9zwpf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1PTS1j2ykL530IRc"
Content-Disposition: inline


--1PTS1j2ykL530IRc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/namespace.c

between commits:

  2aca1af473d26 ("mount: unmount copied tree")
  85d88a3941593 ("mount: hold namespace_sem across copy in create_new_names=
pace()")

=66rom the vfs-fixes tree and commit:

  f4b0ce91e3795 ("mount: unmount copied tree")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

The below is a diff -c since a standard diff ended up showing empty
changes, it's the fixes version more or less:

diff --combined fs/namespace.c
index 188be116f6e63,cbb18285a6312..0000000000000
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@@ -2791,8 -2791,7 +2791,8 @@@ static inline void unlock_mount(struct=20
  }
 =20
  static void lock_mount_exact(const struct path *path,
 -			     struct pinned_mountpoint *mp);
 +			     struct pinned_mountpoint *mp, bool copy_mount,
 +			     unsigned int copy_flags);
 =20
  #define LOCK_MOUNT_MAYBE_BENEATH(mp, path, beneath) \
  	struct pinned_mountpoint mp __cleanup(unlock_mount) =3D {}; \
@@@ -2800,10 -2799,7 +2800,10 @@@
  #define LOCK_MOUNT(mp, path) LOCK_MOUNT_MAYBE_BENEATH(mp, (path), false)
  #define LOCK_MOUNT_EXACT(mp, path) \
  	struct pinned_mountpoint mp __cleanup(unlock_mount) =3D {}; \
 -	lock_mount_exact((path), &mp)
 +	lock_mount_exact((path), &mp, false, 0)
 +#define LOCK_MOUNT_EXACT_COPY(mp, path, copy_flags) \
 +	struct pinned_mountpoint mp __cleanup(unlock_mount) =3D {}; \
 +	lock_mount_exact((path), &mp, true, (copy_flags))
 =20
  static int graft_tree(struct mount *mnt, const struct pinned_mountpoint *=
mp)
  {
@@@ -3082,7 -3078,7 +3082,7 @@@ static struct mnt_namespace *create_new
  	struct mnt_namespace *ns =3D current->nsproxy->mnt_ns;
  	struct user_namespace *user_ns =3D current_user_ns();
  	struct mnt_namespace *new_ns;
 -	struct mount *new_ns_root;
 +	struct mount *new_ns_root, *old_ns_root;
  	struct path to_path;
  	struct mount *mnt;
  	unsigned int copy_flags =3D 0;
@@@ -3095,36 -3091,52 +3095,36 @@@
  	if (IS_ERR(new_ns))
  		return ERR_CAST(new_ns);
 =20
 -	scoped_guard(namespace_excl) {
 -		new_ns_root =3D clone_mnt(ns->root, ns->root->mnt.mnt_root, copy_flags);
 -		if (IS_ERR(new_ns_root)) {
 -			emptied_ns =3D new_ns;
 -			return ERR_CAST(new_ns_root);
 -		}
 +	old_ns_root =3D ns->root;
 +	to_path.mnt =3D &old_ns_root->mnt;
 +	to_path.dentry =3D old_ns_root->mnt.mnt_root;
 =20
 -		/*
 -		 * If the real rootfs had a locked mount on top of it somewhere
 -		 * in the stack, lock the new mount tree as well so it can't be
 -		 * exposed.
 -		 */
 -		mnt =3D ns->root;
 -		while (mnt->overmount) {
 -			mnt =3D mnt->overmount;
 -			if (mnt->mnt.mnt_flags & MNT_LOCKED)
 -				locked =3D true;
 -		}
 -	}
 +	VFS_WARN_ON_ONCE(old_ns_root->mnt_id_unique !=3D 1);
 +	VFS_WARN_ON_ONCE(old_ns_root->mnt.mnt_sb->s_type !=3D &nullfs_fs_type);
 =20
 -	/*
 -	 * We dropped the namespace semaphore so we can actually lock
 -	 * the copy for mounting. The copied mount isn't attached to any
 -	 * mount namespace and it is thus excluded from any propagation.
 -	 * So realistically we're isolated and the mount can't be
 -	 * overmounted.
 -	 */
 -
 -	/* Borrow the reference from clone_mnt(). */
 -	to_path.mnt =3D &new_ns_root->mnt;
 -	to_path.dentry =3D new_ns_root->mnt.mnt_root;
 -
 -	/* Now lock for actual mounting. */
 -	LOCK_MOUNT_EXACT(mp, &to_path);
 -	if (unlikely(IS_ERR(mp.parent))) {
 -		guard(namespace_excl)();
 -		emptied_ns =3D new_ns;
 -		guard(mount_writer)();
 -		umount_tree(new_ns_root, 0);
 +	LOCK_MOUNT_EXACT_COPY(mp, &to_path, copy_flags);
 +	if (IS_ERR(mp.parent)) {
 +		free_mnt_ns(new_ns);
  		return ERR_CAST(mp.parent);
  	}
 +	new_ns_root =3D mp.parent;
 =20
  	/*
 -	 * We don't emulate unshare()ing a mount namespace. We stick to the
 -	 * restrictions of creating detached bind-mounts. It has a lot
 -	 * saner and simpler semantics.
 +	 * If the real rootfs had a locked mount on top of it somewhere
 +	 * in the stack, lock the new mount tree as well so it can't be
 +	 * exposed.
 +	 */
 +	mnt =3D old_ns_root;
 +	while (mnt->overmount) {
 +		mnt =3D mnt->overmount;
 +		if (mnt->mnt.mnt_flags & MNT_LOCKED)
 +			locked =3D true;
 +	}
 +
 +	/*
 +	 * We don't emulate unshare()ing a mount namespace. We stick
 +	 * to the restrictions of creating detached bind-mounts. It
 +	 * has a lot saner and simpler semantics.
  	 */
  	mnt =3D __do_loopback(path, flags, copy_flags);
  	scoped_guard(mount_writer) {
@@@ -3137,20 -3149,21 +3137,20 @@@
  		if (locked)
  			mnt->mnt.mnt_flags |=3D MNT_LOCKED;
  		/*
 -		 * Now mount the detached tree on top of the copy of the
 -		 * real rootfs we created.
 +		 * now mount the detached tree on top of the copy
 +		 * of the real rootfs we created.
  		 */
  		attach_mnt(mnt, new_ns_root, mp.mp);
  		if (user_ns !=3D ns->user_ns)
  			lock_mnt_tree(new_ns_root);
  	}
 =20
 -	/* Add all mounts to the new namespace. */
  	for (mnt =3D new_ns_root; mnt; mnt =3D next_mnt(mnt, new_ns_root)) {
  		mnt_add_to_ns(new_ns, mnt);
  		new_ns->nr_mounts++;
  	}
 =20
 -	new_ns->root =3D real_mount(to_path.mnt);
 +	new_ns->root =3D new_ns_root;
  	ns_tree_add_raw(new_ns);
  	return new_ns;
  }
@@@ -3834,20 -3847,16 +3834,20 @@@ static int do_new_mount(const struct pa
  }
 =20
  static void lock_mount_exact(const struct path *path,
 -			     struct pinned_mountpoint *mp)
 +			     struct pinned_mountpoint *mp, bool copy_mount,
 +			     unsigned int copy_flags)
  {
  	struct dentry *dentry =3D path->dentry;
  	int err;
 =20
 +	/* Assert that inode_lock() locked the correct inode. */
 +	VFS_WARN_ON_ONCE(copy_mount && !path_mounted(path));
 +
  	inode_lock(dentry->d_inode);
  	namespace_lock();
  	if (unlikely(cant_mount(dentry)))
  		err =3D -ENOENT;
 -	else if (path_overmounted(path))
 +	else if (!copy_mount && path_overmounted(path))
  		err =3D -EBUSY;
  	else
  		err =3D get_mountpoint(dentry, mp);
@@@ -3855,15 -3864,9 +3855,15 @@@
  		namespace_unlock();
  		inode_unlock(dentry->d_inode);
  		mp->parent =3D ERR_PTR(err);
 -	} else {
 -		mp->parent =3D real_mount(path->mnt);
 +		return;
  	}
 +
 +	if (copy_mount)
 +		mp->parent =3D clone_mnt(real_mount(path->mnt), dentry, copy_flags);
 +	else
 +		mp->parent =3D real_mount(path->mnt);
 +	if (unlikely(IS_ERR(mp->parent)))
 +		__unlock_mount(mp);
  }
 =20
  int finish_automount(struct vfsmount *__m, const struct path *path)
@@@ -5640,14 -5643,14 +5640,14 @@@ static int grab_requested_root(struct m
  	if (mnt_ns_empty(ns))
  		return -ENOENT;
 =20
- 	first =3D child =3D ns->root;
- 	for (;;) {
- 		child =3D listmnt_next(child, false);
- 		if (!child)
- 			return -ENOENT;
- 		if (child->mnt_parent =3D=3D first)
+ 	first =3D ns->root;
+ 	for (child =3D node_to_mount(ns->mnt_first_node); child;
+ 	     child =3D listmnt_next(child, false)) {
+ 		if (child !=3D first && child->mnt_parent =3D=3D first)
  			break;
  	}
+ 	if (!child)
+ 		return -ENOENT;
 =20
  	root->mnt =3D mntget(&child->mnt);
  	root->dentry =3D dget(root->mnt->mnt_root);

--1PTS1j2ykL530IRc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUb4kACgkQJNaLcl1U
h9D/3wf/YnjbGNXDhitXEfYwLZQNe+84axaH4UwK4nc9CtLyH5H9fbONG4Qwxvmx
c8MLvdAByxI/AEzJLywDLRrBA4EwVaUi4i7jMOaGP+Cx+bemxDS6XaQsTcBRooFc
cBv/zd/1Pfcl/E931hOcFdQ9zJX4DVsG6Oc5fAN2iHONRqTy8o3LgjUkwkKNDabf
USVr4hqoqvUuLIEM4+ZYtZ15Nm4bVONx+J7OvSiZYBTiOs2aQ1ZB/xM3buX8jaki
/bSL80EG3UVqO9boatCYibLNtXGuBTrKjUVE7ctnm4tCW+kSalIY3xofl4EddpLo
SJgLALdq+vriuUtEci6dWIKLhQFx1Q==
=GOxh
-----END PGP SIGNATURE-----

--1PTS1j2ykL530IRc--
