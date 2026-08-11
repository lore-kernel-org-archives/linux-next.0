Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7443800B;
	Tue, 11 Aug 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450954; cv=none; b=hjL8OlAi5lx6KD8rSb1gB5miKgUKJM9wduFGBQIJ4XTQHR7R11K+mJ9nMCOd/e4cwp8vxCQnAN6JVkujRLben+/tDrXcOCN7mVqoiZijgD4A0gzRYFLXqku8ZmWL06eCIUR5r3DcSnDJrUG8chvijekJ1qQi3y4FY4ThPchzAdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450954; c=relaxed/simple;
	bh=9VOKFCQAQP6XFezbWMcfoHOzsPIt5aEBcr4/nrKtk2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uu1gFtGqAky5WfygXCqkcgbS5FmfSkFAFWrrMxlNQahiqllfy9cqvGuSafk/DEBJnd3aQ1ZqgG5mFAn2UyymU9Um8nJm1eq3vtjK1Uo3vh5pY4QFr4TO5FoFibIzpyi2Aa/Xxz0yZm04Qb+ifSQE7Rrh2jKBeHWzpVToRyEdRVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4Z8hvDg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4Z8hvDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12351F000E9;
	Tue, 11 Aug 2026 12:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786450953;
	bh=xsbt4WQpH2WToIx0jNZj3DXw6mBKr0uEJYR77BBg2TE=;
	h=Date:From:To:Cc:Subject;
	b=e4Z8hvDgXsjXN3MjNZ3Taf5evK7+jyT2ty7o2ZvmV1Xp/FpxGF8Xu30oThXGAE8Bi
	 JliEEiCq+qkb+6eYwsRBOOujhwTJvxydkaute7S/hpOW30dUsjIdm9krKO3cmrQv7u
	 V5qX3v9eeRFAn4hHaOsIRQiEd3+GFYBOcXNDvlMLmC5xU64ovJalsXWUGR2ue2hmvw
	 6KuzqHP+CcJ5MuJny8JpJeOoDYP8JgVyqzrHZuRlI+0T9iXS7eBoQ/SAEpAh210Plv
	 nPyDgefVSiDuLNw1+vNOTw1FwXaLA6f1KMQw3Zu8n2lEJGz7CXrbD3fJMqaD9DP5A3
	 I0rvNd6mMd9Ig==
Date: Tue, 11 Aug 2026 13:22:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the thermal tree
Message-ID: <ansUBivh8gFamlpB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1SD1agwIE2PjNNxu"
Content-Disposition: inline


--1SD1agwIE2PjNNxu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  6e2fbcb6f9c60 ("thermal/drivers/qcom: Fix missing spmi adc tm5 gen3 file")

Fixes tag

  Fixes: 948ee3a74f35 ("add support for PMIC5 Gen3 ADC thermal monitoring")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--1SD1agwIE2PjNNxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp7FAUACgkQJNaLcl1U
h9B0Kwf/aV96WW5V8jWKOqqWNnK85hft+Bn9SBK/H/E3VceKa4wLaNqNsYstaz/C
1sdiM4Dgtd5RrjHjgVCbWD1fUAMrDrgcZQbl8MzzhYqSdlDlwwTctkDTvma7J1JD
mcHitWcajFC4yDBwBQbcg83rGWuBrGdhlv72ptSpFlwmlO8q2/QKclR9jMI1x40I
KmlQfBRJPBvBQdSHSIzY3uOh1/1kfu8/iYiTdR8XZ6ResI9Ats8G4VZYOPkp14gI
3ae46fgt30UFMQsMEqfQu25L5iaejpjLJp2emVuFu+HRCEkVJf1PAIYPmSJYJZy0
B9aO5EIihj9OzN163GPitttt4+DIOg==
=NyF3
-----END PGP SIGNATURE-----

--1SD1agwIE2PjNNxu--
