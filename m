Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C26A355042;
	Wed, 21 Jan 2026 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011881; cv=none; b=EzDVzOg6UsbBEmnHxXgFLXVRjUWyhsOf/VyqBnDfAMWYc+e+BH+NnxX2BFfR2qdJ/qZgJOTPlzfE+fVgDeO+bQrU9RuBWlOFxJvezv+C5Dr4O9dDrePRrQTH1aQke12alYOPkVcs57k82k3n8OHvqbILEs53Hmn2sGsCZdYBw7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011881; c=relaxed/simple;
	bh=NoLx22csg/fh2wncBPu+Jix0zRVpVDUbEYr/WLv8pwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZEy24N3XFc9gzhlRxMUlsrmthwmW+JKS06CuO1mJ5fLoTTsrflNKzNzOOUWzMJ5E/FcPNJHewuNM4/2vZrMH5TqmuToxp7/Fi3MNfDNOHqwxB0vKl5oc5oojAt+4MAHuofXi/rzOKnfpGRG6xiCfeiWG1+aJf/+1f90Ms5hO6/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ry4xScR/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ry4xScR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF37C4CEF1;
	Wed, 21 Jan 2026 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011880;
	bh=NoLx22csg/fh2wncBPu+Jix0zRVpVDUbEYr/WLv8pwU=;
	h=Date:From:To:Cc:Subject:From;
	b=Ry4xScR/u7oCaZbrUOZww6nzRL6wQpMSsRvF37mi/YIjWhI5c/2HcsvNgPcj/7HI/
	 20p7MX+v/flvMLjXzOlk1uoRdlbE9iRHvA4ltts2d0NFvJbY/kXAZWofaIUU4vpmeE
	 ssP/lOU5Q+xYuW5EgjbEjD2C2iKv2DUBzIaN9H7SV3lzVksK1o5GWYPx0WcoiJGkFj
	 h85/Mpp/+ZQwIZ4MlPDuPmvm7o/vzhEtZcHKSeUeveIkcIXS0st91DPlegb8dT/HQY
	 Pe3+tD04TpO8e5K7xXMeoLDmXSkISMGFc14Exb+hYHA2W5CZtqmyoSjLyOKb4YwsE6
	 oFfOO2nJzC6nQ==
Date: Wed, 21 Jan 2026 16:11:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: linux-next: manual merge of the slab tree with the slab-fixes tree
Message-ID: <aXD6peMfe2HrLKOd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SEtNCLvNpVhnyEqY"
Content-Disposition: inline


--SEtNCLvNpVhnyEqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  mm/slub.c

between commit:

  99a3e3a1cfc93 ("slab: fix kmalloc_nolock() context check for PREEMPT_RT")

=66rom the slab-fixes tree and commit:

  da6ed0180825d ("slab: simplify kmalloc_nolock()")
  a4ae75d1b6a24 ("slab: fix kmalloc_nolock() context check for PREEMPT_RT")

=66rom the slab tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc mm/slub.c
index c58e664bb312a,331d274ba0a8c..0000000000000
--- a/mm/slub.c
+++ b/mm/slub.c
@@@ -5694,13 -5166,13 +5166,13 @@@ void *kmalloc_nolock_noprof(size_t size
  	if (unlikely(!size))
  		return ZERO_SIZE_PTR;
 =20
+ 	/*
+ 	 * See the comment for the same check in
+ 	 * alloc_frozen_pages_nolock_noprof()
+ 	 */
 -	if (IS_ENABLED(CONFIG_PREEMPT_RT) && (in_nmi() || in_hardirq()))
 +	if (IS_ENABLED(CONFIG_PREEMPT_RT) && !preemptible())
- 		/*
- 		 * kmalloc_nolock() in PREEMPT_RT is not supported from
- 		 * non-preemptible context because local_lock becomes a
- 		 * sleeping lock on RT.
- 		 */
  		return NULL;
  retry:
  	if (unlikely(size > KMALLOC_MAX_CACHE_SIZE))
  		return NULL;

--SEtNCLvNpVhnyEqY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlw+qQACgkQJNaLcl1U
h9C25gf/VY6QgyL+WPcBg0L4spuSFenyQDPQiygUiCIQkAn6mJbg2qNRozDzmI1+
Yvui0jdUO9iWlvXSSreuPJDzzK3WFo6cJGwYc1fUVwN8fntDivPrJM8+Ggr8jO2/
/X2T5nQcj0A+2LL88ue3iVa6J1IM+fYUGxNQ/FBF3CkOd3//+C+w1OsUa/vyb9iU
noWQR87xZC64+W/dpvSHXpd5XC4+0SQJAhMuI5MWAd72F4WZbUxeA2oBggv+LY+J
8wQlbj+gv4f/qcKwk3BIapCYZIY6Pw++6MKsYXjeyt/LZFz75mkzkTizkors1gc0
BdsrIIKhUIt9U7wD2QhTls5OdemA7Q==
=Ls+A
-----END PGP SIGNATURE-----

--SEtNCLvNpVhnyEqY--
