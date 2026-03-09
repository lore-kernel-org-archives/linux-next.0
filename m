Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6031F86323;
	Mon,  9 Mar 2026 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066927; cv=none; b=esM61aQZIt9eCop4FuSSK+bfhkLyJbAkdlc9tb6TTSnjhaBLQ2wvgJUuTvVYPMLhI+FBHgdjn2R/Z01pTVMcJ60cDjIVM72cVg2stIbvTSMAeG5qjVPDT2erW91CpN4nrVqaLdb56id6JkRgJYBW1C+6T0fy179ZYfO/KlOdM1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066927; c=relaxed/simple;
	bh=td5ftknNehC8j6Vob4umQYrFzWP3iJsSCjVvZSxTsZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F/Ngg/2RZU3jthkV9ehr2Weu4pMRjDTLojdApdYfmsxANYedum4UIYUeTshn6GDhlbiLHBGozGqTzZ2AHZDwal2L3MEhtY1+lXDbJDr0UHkJyh+ymJcjVpNb6q44jSReHl9M1qmsUzEB4ApGlnvhjrj5ai2hptM2AYBY7F39U5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+O0sxZc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+O0sxZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99840C2BC86;
	Mon,  9 Mar 2026 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773066926;
	bh=td5ftknNehC8j6Vob4umQYrFzWP3iJsSCjVvZSxTsZc=;
	h=Date:From:To:Cc:Subject:From;
	b=C+O0sxZclusK7ol28XglcMMs6Zlf1ZjKYkiyFTVc9GtCvxRXPzQ8b5QOOxp5IPJLL
	 Y7dkSmt6uPAG5wtrF0IyOmiwue9YcGhAik4J8Z8J1bj+f5FdSjjGkWprrn48WIJL2Z
	 NzEDsx6pEz9DyY+R/44bqjwoSfafL7IKKvdB8JpOa/cHzJ/5kvjGis4wb0fATamiO/
	 chl1a8511Npk4YsnOX/t9Briv/cZP5VXxE6M683XT9akULxxZugU1U53ksDkh46J9p
	 5wa4tXa3U20g2585WfWdbjH5H0YEV8dR3yoKMKZ4qujH72BO3Tb50ox1g8Fd98Q1is
	 irR+4z/k7blCQ==
Date: Mon, 9 Mar 2026 14:35:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sunil Khatri <sunil.khatri@amd.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aa7aqG5INDTFsZbq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a75ee9lmBRa91F/0"
Content-Disposition: inline


--a75ee9lmBRa91F/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

between commit:

  65b5c326ce410 ("drm/amdgpu/userq: refcount userqueues to avoid any race c=
onditions")

=66rom the drm-fixes tree and commit:

  4952189b284d4 ("drm/amdgpu/userq: refcount userqueues to avoid any race c=
onditions")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 5239b06b9ab03,d8ce7b3733e75..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

--a75ee9lmBRa91F/0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmu2qgACgkQJNaLcl1U
h9DRLwf8DNl2ISYZ4N2Zu0YS8w4vpBP9fOJVLyFDVMPE0oMrJ2X2iQDfxlK/isPK
MbRRlYI3pbfTD1utxzBgHK2GqyvgzdG1rf0G5zZYGwutSExpB10n1sc4uUad56mI
65SHVT11UeQtawRJ7n3Gj+76CB+wzRArfuojYj5U/i/J0WhuKyh9FNRS9t65jxBn
6Sl6OE5dca49igPuBaZBbRclGhcYHGZBMVjvGM6cOimAQLgg0q2E8W43uUfdYkrz
Xlryw/nyJA0A+i9A41DqB3lE4yqn6d221NsLHml+bt82y5KFLdX2CclROUokpTWa
9SY4CqjmSdUIvZBT2q7kbUyko+g3bQ==
=/yvF
-----END PGP SIGNATURE-----

--a75ee9lmBRa91F/0--
