Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561CE370D48;
	Mon,  6 Apr 2026 13:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481234; cv=none; b=sNiIsQ6N69duqGZz01RDtvKpEGMleIVBtENOzp7xu40QdFlgnqfrRBs9KRtTWPQoCoj1roFOFwXV5Lkl/WuHVAKQuiVac8KrfPKZ1HKB322lA8grHkrEe4daDqk73iZrOnlCubNw0ZKp6FpRwVZ8iofl7lzdlqF/9EKZ8Drfn3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481234; c=relaxed/simple;
	bh=Ib95lEzrb4lSDQJUtetYHBm4lcai51X1I5BDIk+Uc7A=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=coJ7bADRS+libZdQZXGXt3Z+ig3FpAzsZINt3D9UWObi9TYlYSJKjLHUJJAs5q/8fkgoxe45Na+PYy3CMAT9ghpVwTz+Rmg1Z1CZCiFhVS8s0CipCSMbavBLN6cw5xnjry7MG5qeMG9ycwwwyhn+j4Vw/TAQFjxVfVKzfFGdeqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJNF71ry; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJNF71ry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5BFC4CEF7;
	Mon,  6 Apr 2026 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481233;
	bh=Ib95lEzrb4lSDQJUtetYHBm4lcai51X1I5BDIk+Uc7A=;
	h=Date:From:Cc:Subject:From;
	b=MJNF71ryRqVPmbzOK+qq+/tdy9MqPmCeQuZoXHeLZOK3KpkbbHw93Ek2WYYWyueIA
	 LAvEPWfMdCKz4pzApevwnetE8p8uGckBLKb1pIem7x8m3zqblj8WJ04ihFZV5wsZK4
	 f0jLgHo4sCBrFSdhlh2XXI8jnnmFwz+fm1sJQX8EpW91ymXrfhcBJy7ljwq+1VkHBA
	 5abGh30V0vlWIl6cKsTIJcRy2OLSanHU6fC7wskfOj9oZ7pZGCML3BObo+UdQvqd0S
	 DE4QwR9zxOME0pbL/eQ7c0IIGZAZtpTUi4Kqxl5FhrgoW7In94OiCP2HrcgT+kIzPt
	 6Gq87HesvybXw==
Date: Mon, 6 Apr 2026 14:13:49 +0100
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-ID: <adOxjbi2byrIet3y@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mKUiEgPqunmcio3S"
Content-Disposition: inline


--mKUiEgPqunmcio3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/ocfs2/dir.c

between commits:

  bdff37e327275 ("ocfs2: validate dx_root extent list fields during block r=
ead")
  28c33de101792 ("ocfs2: remove empty extent list check in ocfs2_dx_dir_loo=
kup_rec()")

=66rom the mm-nonmm-unstable tree and commit:

  0b2600f81cefc ("treewide: change inode->i_ino from unsigned long to u64")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/ocfs2/dir.c
index d94595a499231,b82fe4431eb1f..0000000000000
--- a/fs/ocfs2/dir.c
+++ b/fs/ocfs2/dir.c
@@@ -593,7 -593,7 +593,7 @@@ static int ocfs2_validate_dx_root(struc
  		mlog(ML_ERROR,
  		     "Checksum failed for dir index root block %llu\n",
  		     (unsigned long long)bh->b_blocknr);
 -		return ret;
 +		goto bail;
  	}
 =20
  	if (!OCFS2_IS_VALID_DX_ROOT(dx_root)) {
@@@ -601,32 -601,8 +601,32 @@@
  				  "Dir Index Root # %llu has bad signature %.*s\n",
  				  (unsigned long long)le64_to_cpu(dx_root->dr_blkno),
  				  7, dx_root->dr_signature);
 +		goto bail;
  	}
 =20
 +	if (!(dx_root->dr_flags & OCFS2_DX_FLAG_INLINE)) {
 +		struct ocfs2_extent_list *el =3D &dx_root->dr_list;
 +
 +		if (le16_to_cpu(el->l_count) !=3D ocfs2_extent_recs_per_dx_root(sb)) {
 +			ret =3D ocfs2_error(sb,
 +					  "Dir Index Root # %llu has invalid l_count %u (expected %u)\n",
 +					  (unsigned long long)le64_to_cpu(dx_root->dr_blkno),
 +					  le16_to_cpu(el->l_count),
 +					  ocfs2_extent_recs_per_dx_root(sb));
 +			goto bail;
 +		}
 +
 +		if (le16_to_cpu(el->l_next_free_rec) > le16_to_cpu(el->l_count)) {
 +			ret =3D ocfs2_error(sb,
 +					  "Dir Index Root # %llu has invalid l_next_free_rec %u (l_count %u)=
\n",
 +					  (unsigned long long)le64_to_cpu(dx_root->dr_blkno),
 +					  le16_to_cpu(el->l_next_free_rec),
 +					  le16_to_cpu(el->l_count));
 +			goto bail;
 +		}
 +	}
 +
 +bail:
  	return ret;
  }
 =20
@@@ -815,6 -791,14 +815,6 @@@ static int ocfs2_dx_dir_lookup_rec(stru
  	struct ocfs2_extent_block *eb;
  	struct ocfs2_extent_rec *rec =3D NULL;
 =20
 -	if (le16_to_cpu(el->l_count) !=3D
 -	    ocfs2_extent_recs_per_dx_root(inode->i_sb)) {
 -		ret =3D ocfs2_error(inode->i_sb,
 -				  "Inode %llu has invalid extent list length %u\n",
 -				  inode->i_ino, le16_to_cpu(el->l_count));
 -		goto out;
 -	}
 -
  	if (el->l_tree_depth) {
  		ret =3D ocfs2_find_leaf(INODE_CACHE(inode), el, major_hash,
  				      &eb_bh);
@@@ -828,13 -812,21 +828,13 @@@
 =20
  		if (el->l_tree_depth) {
  			ret =3D ocfs2_error(inode->i_sb,
- 					  "Inode %lu has non zero tree depth in btree tree block %llu\n",
+ 					  "Inode %llu has non zero tree depth in btree tree block %llu\n",
  					  inode->i_ino,
  					  (unsigned long long)eb_bh->b_blocknr);
  			goto out;
  		}
  	}
 =20
 -	if (le16_to_cpu(el->l_next_free_rec) =3D=3D 0) {
 -		ret =3D ocfs2_error(inode->i_sb,
 -				  "Inode %llu has empty extent list at depth %u\n",
 -				  inode->i_ino,
 -				  le16_to_cpu(el->l_tree_depth));
 -		goto out;
 -	}
 -
  	found =3D 0;
  	for (i =3D le16_to_cpu(el->l_next_free_rec) - 1; i >=3D 0; i--) {
  		rec =3D &el->l_recs[i];
@@@ -847,9 -839,10 +847,9 @@@
 =20
  	if (!found) {
  		ret =3D ocfs2_error(inode->i_sb,
- 				  "Inode %lu has no extent record for hash %u in btree (next_free_rec=
 %u)\n",
 -				  "Inode %llu has bad extent record (%u, %u, 0) in btree\n",
 -				  inode->i_ino,
 -				  le32_to_cpu(rec->e_cpos),
 -				  ocfs2_rec_clusters(el, rec));
++				  "Inode %llu has no extent record for hash %u in btree (next_free_re=
c %u)\n",
 +				  inode->i_ino, major_hash,
 +				  le16_to_cpu(el->l_next_free_rec));
  		goto out;
  	}
 =20

--mKUiEgPqunmcio3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTsY0ACgkQJNaLcl1U
h9A4QAf/fWDp5RXWs4Cub3xKrgWlOW7Ef9FRbW5WO3jd2rhJlXIoB9396QMl3kGF
aHb+PHEDv7OZyx9g1XeZeWDnaFItWbbopFOr5nNUdWSqUyi3v/6JWifRIEjK/aOh
Z283diO/F+BhzmMn3qnfIBXBJNb35FLLvX60sVbCweoPf1qxjIXFO6UvbsjK8rxd
wd8icqLRs9YnSZek6b1ohiGMSlg9b1mUgOibRaRBTIdS5Q8/j5qVtqHSCb4N/zdm
GgSXefBug33ibuVjadbZBmSHPt8Rzb3QPAcfIHS0qnpXmWfoN+tRZnkpYrsWpVXs
A6OjD3Q+K5x96iGOqm3uO0ydCOa7PQ==
=CSfK
-----END PGP SIGNATURE-----

--mKUiEgPqunmcio3S--
