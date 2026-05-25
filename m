Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE63230C17D;
	Mon, 25 May 2026 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717358; cv=none; b=GEZW2OIacZFUxGssrUoJGswDxy62p/Zo0aSoA9R5xhrC3sB8KlnnPfcdw1wRZOazFAWvrcPNkAj72fmvSHunFS7wSktLB/6vyvqyM+ZLO2/ZIpxbEJ+dAiWCGtPZkUu69w1Dr4ucaLqvCLK1OA247Dvk20gY47tlGyIhHGBXwwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717358; c=relaxed/simple;
	bh=cj8X2c8uf7UPQkRuy+rUitDgceUEdzQ3aLIVMYVH1a0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jEEwuDH4f/hkLcFy3Awk7xPCOB/MYr9KPmby3CzF/XF09ZsphHTbWDT0rfaQvbalb/iQ3U06ADypd9mQzVHdOv4JaT6NZ8ytQbR+CeIodQHsNJuJbKuA/3lACX8tvdJoVruUjO02EXggMeptFgS8C6BwMV0CE6gWjctzLN4YocU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfTtYL8I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfTtYL8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B23C1F000E9;
	Mon, 25 May 2026 13:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779717357;
	bh=h9VvuRpALuo2tNFgUsNAGC86Bppc8zOBgCCI2WihUlE=;
	h=Date:From:Cc:Subject;
	b=kfTtYL8IOjeOMJLM/eUyCZfx63DKtWD2qKXQPGrywaz4LF8VGrZPp20X+xOf/eZce
	 wPN2Bz7hfe45P+agZTTWDEfqz6+c3/HvY68YuxGPz7OKDcKsnzxMkYlyPNJ7jEw51B
	 XxPa9nq71VwXjSRimtTybX0RZ1LXVuJHNLLPSlm9ZxFSb3WJaa6ukrXV7z3yg2ylo5
	 60FnIBpW0sfEYsRv6aBYnPLNnMrFJUyVsyGXqmXh6iaXsRiUReWNLAOa8zs2D7lVS0
	 CswwEY9kjb+mEB1/jLN/M2BtJA6c6rtH6516rTNVJoKbFnlUU+FqYnHL/rGgv+x2rr
	 0JhmvYLdfBHdQ==
Date: Mon, 25 May 2026 14:55:53 +0100
From: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Sterba <dsterba@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Qu Wenruo <wqu@suse.com>, Zi Yan <ziy@nvidia.com>
Subject: linux-next: manual merge of the fs-next tree with the mm-unstable
 tree
Message-ID: <ahRU4OQiGMaLf2Y-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c0108f4Uq5VmD3dS"
Content-Disposition: inline


--c0108f4Uq5VmD3dS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/btrfs/defrag.c

between commit:

  5573c81882722 ("fs/btrfs: remove a comment referring to READ_ONLY_THP_FOR=
_FS")

=66rom the mm-unstable tree and commit:

  871bf8cef0139 ("btrfs: move large data folios out of experimental feature=
s")

=66rom the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined fs/btrfs/defrag.c
index a8d49d9ca981c,f0c6758b7055d..0000000000000
--- a/fs/btrfs/defrag.c
+++ b/fs/btrfs/defrag.c
@@@ -859,20 -859,6 +859,6 @@@ again
  	if (IS_ERR(folio))
  		return folio;
 =20
- 	/*
- 	 * The IO for such large folios is not fully tested, thus return
- 	 * an error to reject such folios unless it's an experimental build.
- 	 *
- 	 * Filesystem transparent huge pages are typically only used for
- 	 * executables that explicitly enable them, so this isn't very
- 	 * restrictive.
- 	 */
- 	if (!IS_ENABLED(CONFIG_BTRFS_EXPERIMENTAL) && folio_test_large(folio)) {
- 		folio_unlock(folio);
- 		folio_put(folio);
- 		return ERR_PTR(-ETXTBSY);
- 	}
-=20
  	ret =3D set_folio_extent_mapped(folio);
  	if (ret < 0) {
  		folio_unlock(folio);
@@@ -1176,7 -1162,6 +1162,6 @@@ static int defrag_one_locked_target(str
  		if (start >=3D folio_next_pos(folio) ||
  		    start + len <=3D folio_pos(folio))
  			continue;
- 		btrfs_folio_clamp_clear_checked(fs_info, folio, start, len);
  		btrfs_folio_clamp_set_dirty(fs_info, folio, start, len);
  	}
  	btrfs_delalloc_release_extents(inode, len);

--c0108f4Uq5VmD3dS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUVOgACgkQJNaLcl1U
h9C4Gwf+M5JFLmfpa3ottJiqOax5jzRXAk6iFjlo58u9Hm9Tbwu48B41tgL2MyiY
UKtiLogEKGSeMN/TQ/OfkGie66V37NiqIkN3+EPxYYS3/P5GNFKFaOKGoXRo+Oyp
IELW9dKYT6KDnN38CC8zRCKdDYP0ZuawaZDxFak6WULYugE5CooKWJaXBhA3fOVF
OJUHks23XvnLmoqvJpToPbmi+k4bUc6iD4EI39gIjUqb+lAAaA1bA8rq99REPPl4
42yPuDokxElHCL5slQLphsSVpVVwknaJCUIgT+SF+Pab5gmtEHqlHca6lAwiTtZw
adq/wABT4N35iKLnZpd56TpXChp0+g==
=hm4L
-----END PGP SIGNATURE-----

--c0108f4Uq5VmD3dS--
