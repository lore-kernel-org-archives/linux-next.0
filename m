Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F1625A353;
	Thu, 18 Sep 2025 12:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196933; cv=none; b=ZxBwMixR2DTP8tsRlYKKEg7hSLkPoB3jhPLglCyZbcoLqiJXRQr+idmiDefZn0TeNBckPudMKZQq20cnfqr7GU2rOpzDmD0i9bAw/0IRacoaYlfflynI5B3FBFBB9EoaSnNhLJ+k94GkNMx5zq5tWMHNuGz8/43ydhPS87Z1gL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196933; c=relaxed/simple;
	bh=WUP2CSIe/DTTCGdb9sMgBgHdLX5/ucssxx5lQ3U6Q6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qRu1k2uiodrMSvEQtfjzoonBX2Me/S8o4Rd2BdZRbfj++Gj3IKM5/h1Y/hqnoFTFvNxABq7qijjKyyo70MzlCrBE0uVOKA1x5Rqq+DtHJFV4+Sw1j01iyguBUiPBORqjwoWTTBJbSMFDOJgX1aHoq4stynHxIqcsLo5gYJCLO5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQ4QnmeR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQ4QnmeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F10C4CEE7;
	Thu, 18 Sep 2025 12:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196932;
	bh=WUP2CSIe/DTTCGdb9sMgBgHdLX5/ucssxx5lQ3U6Q6k=;
	h=Date:From:To:Cc:Subject:From;
	b=RQ4QnmeRTUjd8DecR0JYC2j/TMIHo+qUxywllIDbSPg4WUa1TFWChQu7fNjD7hAsB
	 Ir9uofb1ITSzM4ubsqiNugBmeqzPxxJj3DH80BKv2zI/Z/kDifunb7HlLeUCkccE6Y
	 Lgn2/92/IQ03HMKJqKZ/yIUSDW4Dolq1a2we1quryUxJgFWvXGF+CZABMw5O8G/y4h
	 aPnLnhJnk29od7hHuEW9TnVeD45641Rg1COVekCZmcpPOsgNfD237D/o1rw7URpuFs
	 4HqVb4h2Ab7wZqTMVcs73fY9w6VJDA9DPobIooLXI4bPDYgmbxvPMPA0uX/cVZmFmm
	 WOLkJaHB+oyCw==
Date: Thu, 18 Sep 2025 13:02:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the vfs-bruaner tree
Message-ID: <aMv0wbOcpRnXYU7F@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xqVK6GFTEBchIfmc"
Content-Disposition: inline


--xqVK6GFTEBchIfmc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/namespace.c

between commit:

  96ff702edaec8 ("mnt: support ns lookup")

=66rom the vfs-bruaner tree and commit:

  144acef3334eb ("fs: add mount namespace to rbtree late")

=66rom the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/namespace.c
index e3ac6e06be70d,b9430a5cc987f..0000000000000
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@@ -90,7 -80,16 +90,15 @@@ static DECLARE_RWSEM(namespace_sem)
  static HLIST_HEAD(unmounted);	/* protected by namespace_sem */
  static LIST_HEAD(ex_mountpoints); /* protected by namespace_sem */
  static struct mnt_namespace *emptied_ns; /* protected by namespace_sem */
 -static DEFINE_SEQLOCK(mnt_ns_tree_lock);
 =20
+ static inline void namespace_lock(void);
+ static void namespace_unlock(void);
+ DEFINE_LOCK_GUARD_0(namespace_excl, namespace_lock(), namespace_unlock())
+ DEFINE_LOCK_GUARD_0(namespace_shared, down_read(&namespace_sem),
+ 				      up_read(&namespace_sem))
+=20
+ DEFINE_FREE(mntput, struct vfsmount *, if (!IS_ERR(_T)) mntput(_T))
+=20
  #ifdef CONFIG_FSNOTIFY
  LIST_HEAD(notify_list); /* protected by namespace_sem */
  #endif
@@@ -3229,7 -3304,7 +3244,7 @@@ static int do_reconfigure_mnt(const str
   * If you've mounted a non-root directory somewhere and want to do remount
   * on it - tough luck.
   */
- static int do_remount(struct path *path, int sb_flags,
 -static int do_remount(const struct path *path, int ms_flags, int sb_flags,
++static int do_remount(const struct path *path, int sb_flags,
  		      int mnt_flags, void *data)
  {
  	int err;

--xqVK6GFTEBchIfmc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjL9MAACgkQJNaLcl1U
h9AEcAf/VXsIeITVjg1sR5zXtS4K4Rqx//cMg6Zkx/0/GWodt7mXx0Q3Y/ywh7Rg
zpd/2RxCBRMYlF/+jKMKY4UWkJqTvBJQqwYFsfe0+U1sZ+yKD0Uz5P3LrIr2aLuh
ZVaYmBXZ/L5V86qZCQNXz4l6W07e8Um4AN1hn60LEoRLDK6TW8rabhB1nP2VAyHd
PC74b7TVCxmXBMz9LWXyZDC7j54uCUxOOTfPDc1IwFmrKltDyc7nZIV9Z6B2sTIS
KXc5MR/D29cl9Ws9+jntYw4rJInd8DyrvjVkCiOCi14vFJ6/g/z3xRWtNT4QluD2
ssX2LgH6rt+1JufDjWtvFIvWMZ4Ckw==
=GHqN
-----END PGP SIGNATURE-----

--xqVK6GFTEBchIfmc--
