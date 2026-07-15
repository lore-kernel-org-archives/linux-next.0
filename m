Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A8D44160D;
	Wed, 15 Jul 2026 11:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113882; cv=none; b=jBXT400/TBKWSX5gce68r/Hyb2EncvoFyiZOy4wG+rsMoL4nOldzmByN5b5B0rrAaqLTGX0GuSq1Gb3nR8PFDfDXu7I611o1SiBInXKqz9ewD6kIuhnfyhNpUDcowsjB0805GyEwJxGFc/FEQ1FoAa0NjASSvdSqhWnx5CEuJL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113882; c=relaxed/simple;
	bh=A5ZsPxGla39bRvcAOdu0ohNYxn8OSpkBXgbu9Bubs6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pgcgwjRXdfdgsavEkB/3/ZWhAu/680cupw//Q9B4LJe3cfHjm9xfla+FaA1k5kdjQJEW8cTgtlNIVUv9wfIitoDocFEo7cIFVkJ3zfv7zT+dQuP1SIwtdGU/31sXyhmcfthouigToftz3Nb/X3g8rkzTI8375m+X2anNWHUwI8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5XGlB/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5XGlB/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197F51F000E9;
	Wed, 15 Jul 2026 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784113881;
	bh=xGDf2JzSdnPyIx0dIe/FJobZnBwEWo1eSayca2itrxw=;
	h=Date:From:To:Cc:Subject;
	b=C5XGlB/8ZG2nMJ02+MVFoPpsvilgQ9pWOGqLNGHNJvL4xgQdrE7xzSYjjbsqGBxlz
	 A5C+Cr5GgpSiusCbQzwVWygX1gQ8Jp/ukxocQQYlPLhym33usrxwJm+Py81xpsaZyC
	 o6/0K1QYLsDKSAiedQe1TEHZ58uCeM3D5bxS/+awwkk+ecO84e9Wzi3Gxr5R5Fhdpy
	 uZWNXo1GtY1RaogSf24UBaYXpwXM1aY/p7IAZOLhqD0nNgFqxP+/JFicYw4n/zYGmk
	 HmHU5gRYoqHlgOYM0wA8b9Yzq8JK8ayE357ziZDhrDym/M8WzrZYVEzlkDKdO1SmQy
	 qvutMzwQbhiig==
Date: Wed, 15 Jul 2026 12:11:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-xe tree
Message-ID: <aldq1bH-I9hhdc7q@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="okL4/NK2qmDPvsRA"
Content-Disposition: inline


--okL4/NK2qmDPvsRA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--okL4/NK2qmDPvsRA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXatQACgkQJNaLcl1U
h9Dr8wf/UptrswXu+tzqvZFjGQrVDgbycA8LdPdinnFYGtpVqmDSBPV1lx+P+AJE
uVaV3+UquqY4CiYz5Yu8H3LVSqpdr+2lszJrSCSJc43TjEs8UNFEGAy2pAYrYIMs
rSZLGfVnxOTozgUzvSq/lNbKg7rG3WwFqckWMEyche/KOILV6z0b+OK2CDiEzprc
mtF3/SE908462swkOMayH6t8aBgnppChBJkMJFbzQ39NHptN/m6yue8kiuAFT/Qz
cq/9mFY15o47zUf4yNM1f3NvEaX1WT/5JLzxWhl7Vb/JULFAVQIFr1umgl1FTWVt
jbh1Jbwqgmf9Ux0j2pZ0jgUjRUaNtA==
=aryh
-----END PGP SIGNATURE-----

--okL4/NK2qmDPvsRA--
