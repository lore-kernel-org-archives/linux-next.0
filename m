Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160EF36492C;
	Tue,  7 Jul 2026 11:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425196; cv=none; b=IGuaG+6LNyk7Fyin2IpIC9NgDi2OHXtLowLpLv9TevuXqfs/RQhNBUdyOPK6Q7ktIlPBvTR8X93Dj5MNXmwl1DjVg2Byqu6jfrIio02S7asP2ATOemey2S3oMqYIf6A1m1iKfdOYvYY+rZNVCayKP3SN+e9nax+jAXz0qPpXTRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425196; c=relaxed/simple;
	bh=zravjI5TNTrhm5rIiFDV3Hh/IuQOYOJiUUXB0KF8MeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WB2/tbRL/t0+9ilPAOi/3D23s6o8sxE6/LN2lycVYPGwP6JYZjrKBo5nNh0O89PrDwV2tlJc9tx4uqrm4UlbhIBsFpceZfSCqWIlzBRMccFfvaJgH/RklNTCmL/rebhD8jq+SciMMkL/pH1M8WXtSJHgDhDDYEUjCndTPyqW2ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edf/xvcN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edf/xvcN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BE71F000E9;
	Tue,  7 Jul 2026 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783425194;
	bh=yLcmIYemCf1cRnUBNk4D8OZmmCanpB2R86aKBoTFfVc=;
	h=Date:From:To:Cc:Subject;
	b=edf/xvcNnTHb3/588lLCmKDUNmaz69s8rR8MswY/ZbH4zrMT4p76t+XKe3oIMfkVt
	 i0EVXnxf4o6cnIzjU/qKRboXCwP9Rr6YYYyoPY3N1epzxT2QMP80258lPIRwkGB4PJ
	 TqbSqxHCQ6cakjf3Ol5dxUG5Zvtw2D0hCM+1hFbrXCrUKMiJY6mYw/+cVDXZ3+9Lqj
	 r6nK0GpyBVvcglB/BDNPLX/m1OSrQwK4gpzm3Sg1wldNKTcFMiF74Zmfy7cHmXsKia
	 060boH46dLb2q/ZMSZLs7Ht2V4jP7zDm6DU/8ACbtom2CChisSvZ2J5/vhsNkXPmEb
	 9voMoTGrsPH5w==
Date: Tue, 7 Jul 2026 12:53:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm tree
Message-ID: <akzopmDBFY9Epm0V@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L5m3sJ6SNK/ieKlv"
Content-Disposition: inline


--L5m3sJ6SNK/ieKlv
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

--L5m3sJ6SNK/ieKlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpM6KYACgkQJNaLcl1U
h9DhxQf/S9yn4pNhWSzSiGlV4R4L+5muw88eeqdSCVppC9tPpdeLq+b7T8oqhvc+
q9etySMgOAqStNrieQ1l+5yxydgExvv0+CqePT7i4zUm3QZwCTy6fj7fe3V4ruTX
9QXmZsgINPRQkOSj8HXB0n2/d+SOup8wFjsq/NSQ6BDbHptYJjcwVzQHbabbChEH
KFue+GEWzOOxj7gbF/EKOQtPH6x27L9wuyEZym5mPluC1yn8sZJcvPnp1Fc19tVi
5zDDhnTVSs3IP85iriu3qqWNiLjxTgiVzkd7h1UqJv8EEr9Vv0zT9BwToh4FRQSF
vE2BJJD6UCLZGKs8BY9UFtFZvSRYTg==
=KiEM
-----END PGP SIGNATURE-----

--L5m3sJ6SNK/ieKlv--
