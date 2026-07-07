Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D864315F;
	Tue,  7 Jul 2026 11:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425173; cv=none; b=V9Zu1RXutBcN6teSw/ZF3ruWNi5G4E6UmDxLF1xIQ71K3UVwraKIpuVxJXAcWaf8fsziA9/6zr6HPKbeeBwtKAqZdbwemdWO2kKwpXV6nfoZpSJdmpFa/Y2Rx/juSL96b7DbTB4Ytxk7zPGBarBlBFhPZzLP8SLEttNkk0B8GsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425173; c=relaxed/simple;
	bh=mKLhYxJZwGdlJPW/jXIv828cZLXcQMhygtcjlbCkLAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ay/XAwRGnXjw5GQenIUb/ogJ9Rm5dLzxWp5HnENhxYKISsr5BH99kAsY7UfT09FgClADhF/9mUnHIorCx1SHE18hIOLBYQJ/f4hMlPU/Kcg+3C97BjCdoiHyFAXP9sSxSlM2bb5uRfyXZWdjpAC+PiwxIq+4uUpvGr2EozpIzAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnH5gXOZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnH5gXOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C1E1F000E9;
	Tue,  7 Jul 2026 11:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783425171;
	bh=stP6f/4kuRNi9NzfK+cYLF9hGdhU4QwZi3GgzpKITT4=;
	h=Date:From:To:Cc:Subject;
	b=LnH5gXOZ6YcHO0g0mcFpwGIve2InqcdpwB43WmoOgSurXFZp4agiY9eefM/UGMDf5
	 iPQQZboa1vpIQoK2ZdQy08BO1uDbEdI9PWurerdXzHbaWQRPTZoBUb0blk6MpiyQVT
	 kCPC9w2g9mPR7z1jWwTOnCGZkbZMcqoRCf0VdyJnSyIZQ/OSuuXocry6UGVildsCNg
	 +4RI9FtAPhK1TyqOH2fE7HI9LHBjteGeoJ6QYNe5Q/DMKQUFYAZsdLgnG3g9/CVjnC
	 p5oCX9YIxeYhAx5g9gvt8r3x2R6UHlGgfcRajWrYEPPfJhC6DDj6FPrYBV+C0PIaFC
	 IDKkTu+WNHHiw==
Date: Tue, 7 Jul 2026 12:52:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm tree
Message-ID: <akzokN7rHrYSZ_A7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fMfP6VrfMp13jt4S"
Content-Disposition: inline


--fMfP6VrfMp13jt4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3b1f4d5e47b36 ("drm/amd/display: Fix dangling pointer in connector reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--fMfP6VrfMp13jt4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpM6I8ACgkQJNaLcl1U
h9Ct2Qf+JVp9vWrtUsjH9h9ccl3UbPPOMq/NNFCn0CUnQ9qVGGtRskw6hfRm+xt0
fIwwCgk6fQmDvHMyFzteNHdGBrPyHIIbKv+ZyM84i/4CqvfC49EsHbu64pkp4rkr
u68vnTRqG258yJ8KsxXgKLGt8Y2xv4pmZgbABPiT/eMKfq0Xlt6iO1eUzkWSc9Tt
FEKj3i38Jvx8jctjTBBivlQ5x5tgpJPzAi4N9JNJf7rxvtVjNJlZ/ucogF4nYRk0
xXktZwO6eA63CVZyIn4qKOI0ELe1+wu5VuP3ZyfbseBVLnKpumouSrKgEGW2gOml
7yNrAHJDe16wJfoRCl+ymo3+WCW0+Q==
=xjip
-----END PGP SIGNATURE-----

--fMfP6VrfMp13jt4S--
