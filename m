Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C296156661;
	Mon, 23 Feb 2026 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853709; cv=none; b=G87A5m/4WJEWU9WB7wUrvmxQTZvTO7okNJd4VDpIwIsEvz92WKytji6jI1dh8n49/Luch+zp877NOxdXxDFYBWII13EuEU9miTA3Ux49EBJCwraVGmsVmgec2r5moozQNzewjdG7AuXnnxZoiAepnKEphAcS/MQzbhmsmU0rCWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853709; c=relaxed/simple;
	bh=dc4chM5pXaUeNrc25W70o5mL45cO3uPvsoqluPBXjqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NaAx8ekQyXntgMRFUKiy85j7c42Sy8RbjZoODE3dkaZe7QC2k4o2uyMGm21hwW2c5bDYnHWwkXwiWdf9q9SoCmhs5mC28JBmtLU5ShWwBh3V9g8sZPdRVoMRwUwTAJqHo1y9g9M6dR9kGozxFPE+/1usRkq6ILMuXTaZo/Xcj/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0VjTwzY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0VjTwzY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C380C116C6;
	Mon, 23 Feb 2026 13:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771853708;
	bh=dc4chM5pXaUeNrc25W70o5mL45cO3uPvsoqluPBXjqA=;
	h=Date:From:To:Cc:Subject:From;
	b=Q0VjTwzY9PC1rD2dQ4/6IO8iE4+GHoRcYgYWYsA9M2ox1yrusf9wVjzdJjxNmw24w
	 8EZQu1Ixhez4p+PbRaK/PFXNSmSBDP94ltZDhC4sINNXzzhQMmKBqdb4n/ixmbonJr
	 WLpH7RnjjlXS5yAO1joB/z0gTR5xCReHWDRkZxTJthNi0WorU2pcUzDIo4iCCoLvND
	 xEqtS1vnP4pe3IvBGYBb0NO/A88AIevSQBfqDqwwltwZvnxem3GHIrEjxLOzsl3hbW
	 TXDNf2nk3krCPwin3XtJGaP7e/8w+LGhgBknx3EyBpas3QB/+Ew7x8EZREdffoaCPA
	 lK80Qg4EtJfkA==
Date: Mon, 23 Feb 2026 13:35:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Kees Cook <kees@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <aZxXiB3_4AqBNjRV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QwkZ2tSRS3VHvgJT"
Content-Disposition: inline


--QwkZ2tSRS3VHvgJT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_nvm.c

between commits:

  69050f8d6d075 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar=
 types")
  bf4afc53b77ae ("Convert 'alloc_obj' family to use the new default GFP_KER=
NEL argument")

=66rom the origin tree and commits:

  8a44241b0b83a ("drm/xe/nvm: Fix double-free on aux add failure")
  7755ed58a49f4 ("drm/xe/nvm: Defer xe->nvm assignment until init succeeds")
  a3187c0c2bbd9 ("drm/xe/nvm: Fix double-free on aux add failure")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_nvm.c
index 9c4ccd3b39d4d,1fdfb690ea3d3..0000000000000
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@@ -133,12 -133,10 +133,10 @@@ int xe_nvm_init(struct xe_device *xe
  	if (WARN_ON(xe->nvm))
  		return -EFAULT;
 =20
- 	xe->nvm =3D kzalloc_obj(*nvm);
- 	if (!xe->nvm)
 -	nvm =3D kzalloc(sizeof(*nvm), GFP_KERNEL);
++	nvm =3D kzalloc_obj(*nvm);
+ 	if (!nvm)
  		return -ENOMEM;
 =20
- 	nvm =3D xe->nvm;
-=20
  	nvm->writable_override =3D xe_nvm_writable_override(xe);
  	nvm->non_posted_erase =3D xe_nvm_non_posted_erase(xe);
  	nvm->bar.parent =3D &pdev->resource[0];

--QwkZ2tSRS3VHvgJT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcV4cACgkQJNaLcl1U
h9AFnAf9HvCwiWhiCS68k6Sf9IAfXaU9QMGeFxiRRhlc67P3jB8PCTX2nxXrIWTD
8GT3l7VoqgnfDaSXRw7LonLL2KgnIo3K5Hb/tqAWQze6feJ/WUyeiQT18GxZbnxE
wi9n5+ZKw/ylXGo1eh4ZY19SjyQR7Q2tk7vXtIgpmxfJqXay5pQx/iFQQQkHpNHb
KDuuo7QfeHlNCqKMQiwZoRl3X8gdl49/9NnopjeK8Q+B72bTBO3D7Bl7ej3F0dpp
MF6ApmA88eNKwoYggGtMVPLBb8eVRJIPfwg1SnqLCz9r43kDRn9hFHoJZIVAv+k+
KGzgHNRacJ4vgXcQxAgEg8p2LTg4Gw==
=x9+W
-----END PGP SIGNATURE-----

--QwkZ2tSRS3VHvgJT--
