Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6A1F4CA9;
	Wed,  8 Apr 2026 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775652235; cv=none; b=tAi9SeGK94rT5oUj9kj0QjEXo2BCUeXc3/DSP3kKRxwaLoUeLc8aKyJVGz4TurDMQMhjtgu9c6aUyK0dERskmrP538HHakBc6vQfqkYKJA1E1yv/u3w+IXzv5Awu5TB382TvAAPVSpyAOkMlz0S78eQSQnHCc0wLnR8WUbrNhsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775652235; c=relaxed/simple;
	bh=w3xf3iPKJAxjMj5nsVmQUtTk8tbOzY9FvYrXxVPDEtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PfgdSajaJzqLNmhu0Du+Qn4nFd+y0ttBNtHmLSTBkc3ng3DA+0Zaf7Xn6nXX8w/UqrLW7VUH4zUS1g7c6W28GVeEQmBxGOpe/C+P3/JIyxN1K8u1CXRGCGFa+hADtXPyi70JXpbdqJEK3IRLiFY11hlzBAj3C1xfd0R9przT8FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XswC1vGS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XswC1vGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4EFDC19421;
	Wed,  8 Apr 2026 12:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775652234;
	bh=w3xf3iPKJAxjMj5nsVmQUtTk8tbOzY9FvYrXxVPDEtk=;
	h=Date:From:To:Cc:Subject:From;
	b=XswC1vGSOuIAHRtWf4+Q4mEayysAM+1Eo1mgRc804o+3qMO8nL/VO2eyPJ5pB4A+b
	 blII7uwiOREKURwjvKfdPx1sQpDl/VJeR2YIh7F4DcsO6LsHZfJhygRM1US4IQ51i0
	 4cxJLFThbEvNvtCJWqHyzK6gx/Tn3PVssv72O2LgkRr2jyKeQHt+HoH7nltK0qP6/K
	 fv7vlfmogCpLIWU4Bvxsqge+HA5SUpsNo7YcJ7sOaQq2bu4jBPvMQf0c3GdCH3nAZr
	 CXI2wtVxmj53jxFuMbCpWgSjAe9c07PohuvXoWuXQca6pGQN3aWnCs1Qan0Qd+APxH
	 dlK1EfoRxs11Q==
Date: Wed, 8 Apr 2026 13:43:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	NeilBrown <neil@brown.name>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <adZNhv68QCxJt00c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Hc1/d+PoIPbkiyg"
Content-Disposition: inline


--+Hc1/d+PoIPbkiyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  Documentation/filesystems/porting.rst

between commits:

  336faf5d9115c ("VFS: make lookup_one_qstr_excl() static.")
  4d94ce88c77e7 ("VFS: unexport lock_rename(), lock_rename_child(), unlock_=
rename()")

=66rom the vfs-brauner tree and commit:

  408d8af01f3a4 ("for_each_alias(): helper macro for iterating through dent=
ries of given inode")

=66rom the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc Documentation/filesystems/porting.rst
index d02aa57e44775,9a9babd9ec486..0000000000000
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@@ -1364,14 -1364,10 +1364,22 @@@ lifetime, consider using inode_set_cach
 =20
  ---
 =20
 +**mandatory**
 +
 +lookup_one_qstr_excl() is no longer exported - use start_creating() or
 +similar.
 +---
 +
 +** mandatory**
 +
 +lock_rename(), lock_rename_child(), unlock_rename() are no
 +longer available.  Use start_renaming() or similar.
++---
 +
+ **recommended**
+=20
+ If you really need to iterate through dentries for given inode, use
+ for_each_alias(dentry, inode) instead of hlist_for_each_entry; better
+ yet, see if any of the exported primitives could be used instead of
+ the entire loop.  You still need to hold ->i_lock of the inode over
+ either form of manual loop.

--+Hc1/d+PoIPbkiyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWTYUACgkQJNaLcl1U
h9D/mwf9GN/MwCWBR9+3dVbP8cHxUXkzuicQXsAgGPjIiMZXSmdH50ZfL+N4Jzqw
hupdcaeG06vvExIA7NIMazDrk1uKGByIevRraLR/5mc+3Myi4iqW5dFPxZYo271s
kWU7Pl9VfxhFpIRTeqNZA3oN7FwKz7fyp/tgzzD70rp6sbDWv5jBchdyFxTR1R7p
84TKTJKA9UqfAnwst1SR1gp/wX5duukQvZUW760qljrvVh5SO38GB0R+r/Sia5+a
D72N4QgGBbpzeKR6TIHC/8u5/zIELXxekgY1sriCMo6fmVR9gkb3zTQBag4Sjvxn
dJck+GsPUM0um2cdCfXKIycgqTODbg==
=IW7G
-----END PGP SIGNATURE-----

--+Hc1/d+PoIPbkiyg--
