Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2AA3033D8;
	Wed,  8 Jul 2026 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509927; cv=none; b=kjQXE0ibBfNKXZiVViJXlPpvnr0bRNdwnEbIwHRYwkxMGr1KMbzFgBK+SNLdTUzY1402oE+3PntSZPdSGDJrsQahGhqfmrioYiebzoFLKp8gWkg4eASbL5Ir1oaOjoEvVQ9+wBmoPVObT/vk3+hojUS39hY1AoW2iMLEeOslXyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509927; c=relaxed/simple;
	bh=RjXOiov4IvLZmS2GYxXy4ckiqbZHZ+pZAqiK3vLGK1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFAPVbxFR8WjjrAfYV/XZ5HMh/UcPFe++r+zUVdfZnPTT1kFxTwhBxmdDYiSQhn+VFCf+jpvvdw8w27e90StdPDdwQ0K3+qZi7g+4doIGt5pLXpyx6gliySqTBuwNYmtEJuc8xI26dlP2PITGrgzLXxiXsby4PMFkmKv4ZBjkx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBGwOVQ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBGwOVQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD16F1F000E9;
	Wed,  8 Jul 2026 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509925;
	bh=iJctEOs5yANE5iC7vPJlixvXTJ2RlKJNqe5TtMY8KSs=;
	h=Date:From:To:Cc:Subject;
	b=KBGwOVQ2Icpu9C+g/aXdncaBTmlkhIf3ovqkmR+nTN2NA9GDf4uODEctlE5AO4Vtn
	 8AN/Q0aA1WvtuAyfSQX1cj4tbFotsr22eEkk4HZt6uTgXONeyIW0CmEilk5VA5ZZ/X
	 80mTf1D77vjGv5UjOoFxeElQLwwgN5hCHpp3+aazRgvSefeZD5SnoyHbHx8gy1TccA
	 M1sdNVpppcN41190WyIR69yS/HIso127rn5HZo9qhNzgT5rwt+zMNKZEmooZeU2LOw
	 eQrYYKqqeenyfE9jqCA6hEO9uZlpf96AYen7mQefP+pYQqAHNoIz/8iCWf6L/6e6F8
	 7TL1YRpks+lOg==
Date: Wed, 8 Jul 2026 12:25:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the origin tree
Message-ID: <ak4zoqJsFCyOQXyh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i7DHPYCyw2n4yisr"
Content-Disposition: inline


--i7DHPYCyw2n4yisr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/bpf_fs_kfuncs.c

between commit:

  3f8c65b06fafc ("bpf: have bpf_real_data_inode() take a struct file")

=66rom the origin tree and commit:

  b4e124d168552 ("fs: Add bpf_sock_read_xattr() kfunc to read socket xattrs=
")

=66rom the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/bpf_fs_kfuncs.c
index f1863a891db64,9a4ea5c9b0c94..0000000000000
--- a/fs/bpf_fs_kfuncs.c
+++ b/fs/bpf_fs_kfuncs.c
@@@ -359,24 -360,52 +360,57 @@@ __bpf_kfunc int bpf_cgroup_read_xattr(s
  }
  #endif /* CONFIG_CGROUPS */
 =20
+ #ifdef CONFIG_NET
+ /**
+  * bpf_sock_read_xattr - read xattr of a socket's inode in sockfs
+  * @sock: socket to get xattr from
+  * @name__str: name of the xattr
+  * @value_p: output buffer of the xattr value
+  *
+  * Get xattr *name__str* of *sock* and store the output in *value_p*.
+  *
+  * For security reasons, only *name__str* with prefix "user." is allowed.
+  *
+  * Return: length of the xattr value on success, a negative value on erro=
r.
+  */
+ __bpf_kfunc int bpf_sock_read_xattr(struct socket *sock, const char *name=
__str,
+ 				    struct bpf_dynptr *value_p)
+ {
+ 	struct bpf_dynptr_kern *value_ptr =3D (struct bpf_dynptr_kern *)value_p;
+ 	u32 value_len;
+ 	void *value;
+=20
+ 	/* Only allow reading "user.*" xattrs */
+ 	if (strncmp(name__str, XATTR_USER_PREFIX, XATTR_USER_PREFIX_LEN))
+ 		return -EPERM;
+=20
+ 	value_len =3D __bpf_dynptr_size(value_ptr);
+ 	value =3D __bpf_dynptr_data_rw(value_ptr, value_len);
+ 	if (!value)
+ 		return -EINVAL;
+=20
+ 	return sock_read_xattr(sock, name__str, value, value_len);
+ }
+ #endif /* CONFIG_NET */
+=20
  /**
 - * bpf_real_inode - get the real inode backing a dentry
 - * @dentry: dentry to resolve
 + * bpf_real_data_inode - get the real inode hosting a file's data
 + * @file: file to resolve
   *
 - * If the dentry is on a union/overlay filesystem, return the underlying,=
 real
 - * inode that hosts the data.  Otherwise return the inode attached to the
 - * dentry itself.
 + * Resolve @file to the inode that hosts its data. For a regular file on a
 + * union/overlay filesystem this is the underlying (upper or lower) inode=
 that
 + * stores the data, not the overlay inode.
   *
 - * Return: The real inode backing the dentry, or NULL for a negative dent=
ry.
 + * Data resolution only applies to regular files. For a non-regular file =
(e.g.
 + * a device node, fifo or socket) on a union/overlay filesystem the overl=
ay
 + * inode itself is returned; for any file on a non-union filesystem the i=
node
 + * attached to @file is returned.
 + *
 + * Return: The inode hosting @file's data, or NULL.
   */
 -__bpf_kfunc struct inode *bpf_real_inode(struct dentry *dentry)
 +__bpf_kfunc struct inode *bpf_real_data_inode(struct file *file)
  {
 -	return d_real_inode(dentry);
 +	return d_real_inode(file_dentry(file));
  }
 =20
  __bpf_kfunc_end_defs();
@@@ -389,7 -418,10 +423,10 @@@ BTF_ID_FLAGS(func, bpf_get_dentry_xattr
  BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE)
  BTF_ID_FLAGS(func, bpf_set_dentry_xattr, KF_SLEEPABLE)
  BTF_ID_FLAGS(func, bpf_remove_dentry_xattr, KF_SLEEPABLE)
 -BTF_ID_FLAGS(func, bpf_real_inode, KF_SLEEPABLE | KF_RET_NULL)
 +BTF_ID_FLAGS(func, bpf_real_data_inode, KF_SLEEPABLE | KF_RET_NULL)
+ #ifdef CONFIG_NET
+ BTF_ID_FLAGS(func, bpf_sock_read_xattr, KF_RCU)
+ #endif
  BTF_KFUNCS_END(bpf_fs_kfunc_set_ids)
 =20
  static int bpf_fs_kfuncs_filter(const struct bpf_prog *prog, u32 kfunc_id)

--i7DHPYCyw2n4yisr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOM6EACgkQJNaLcl1U
h9AEuwf8CS8tv99gkCw5ZFTxpPhH4WXByG4WYCAUC7bOd6jiNkTy1dvI2fywi3B4
UrA05wvjjdWhCbYC4ocT09FAF1XcxGU7gwwQLMAF8UkhOG0u83tHnnr9L+7i/oHW
SebEt4/kMz/ZpnsKIZL1M1W+m/R2J+kgTNpphRPNJQ1VF6ThrQTNI9oB8uL0keMf
0ru0LRP78fa5st5M4XJQFuCp+TJrP9HejG9YzpE3xrz4jyGjLgilCvJUjD6D46B4
jyoyYSsxm98eMbeSigIVvZs2Txl8z/SobdCnsni9JnALXttvU6pFGjJdjJGdTfxn
wxcPtr/t+S4hndR2ihBUqHBT7zZhPg==
=Mrjo
-----END PGP SIGNATURE-----

--i7DHPYCyw2n4yisr--
