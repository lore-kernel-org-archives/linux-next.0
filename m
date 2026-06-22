Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF847371D01;
	Mon, 22 Jun 2026 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125142; cv=none; b=kx/YIIEHfXdtnTUcgu/JV4qK9TAXU/sPqT+DguDXAaXCDb/c9Y+KU0xJlRV8fjQoL+KXETOi416AbBC/iMWl/MpepY53iiiGNVlP9FAl/B2kcOyQTCXCoxh5HjeHsK95CR8V6tX8jv461NPAcUJ9Y1pw+hf7oyn42fmdQIbBhGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125142; c=relaxed/simple;
	bh=c6h5mLE6bWgnkIM5MBtRsbyickNBnWYvwPA3XNMhNB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F44Vwufw0cgjKsdL9guoc/OeSItSe99pfYU0g/arcA3ovZURhyoP/lhklWcGHlYakraOv82vWZKuHwZ+MgXFpFDn3Q4V4y7ecQxv2cBjQ4mFitu8TP5HmUyZNe1yeacaisXy8ZpdF/fGlN3LF+Dk6Z9giB5aRiFCSS2nKMLun+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kG+bUkWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kG+bUkWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64D11F000E9;
	Mon, 22 Jun 2026 10:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782125141;
	bh=IH4pqRFBLm40QN9riWVGElLDUt5uNqnfXbisemthFUY=;
	h=Date:From:To:Cc:Subject;
	b=kG+bUkWudpAWAs6BllUZb/+p82eJlDCV+vwFUBfodxoov0RC8TxKN49D4pJk3ouhq
	 ZSyJTP0GV0KXq0J78iwC2p0TvkBFdrQ3XbGdot/0CfBKSyEqWX1/3t+2dnqy9FYaIH
	 7MBcXt1nmInnlMahcLKiGZ7wUtqjm5xxC9bzNGulNkEW9OKZZw/a/3hVeiDoEAEcVn
	 XTDFKN7vd2XOJQ0amGIyYadgDzETWg8CW8G/7WohyrNOY/F+BD1FmxNRFgiaiRK9PE
	 oaWzxjnb/b5mIqpSf5y7uzkYFMoSseaUH3/zqoFvKOgrP8LywgLmqqL3Q7LdMTq8C7
	 /2AL+Bd9Nr9vg==
Date: Mon, 22 Jun 2026 11:45:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the amdgpu tree
Message-ID: <ajkSUqsPwU2j9QoJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R34ZYtsIR1HkB4hI"
Content-Disposition: inline


--R34ZYtsIR1HkB4hI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in the drm tree as a different commit
(but the same patch):

  7dba3e10ecdee ("drm/amdgpu: initialize irq.lock spinlock earlier")


--R34ZYtsIR1HkB4hI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5ElEACgkQJNaLcl1U
h9CwWAf7BCMMNcQ4UWEZ+jI4BLSibzRZ4be8uQnauQBgTkyMy/LfoeYfYxgaIyEW
T87enerERyt12tMciFByZaAMKb3LTTN6ChykZM0k0PD2SHYREd0inBfQv5W4TGwC
+/R+HRC33/fvK/Y0aouviCJiyY5jJZXSa8aHd6rthuaNTH1M0Z1mA4DrEyYrc+vV
ysyC6tL7QfMwZtPiDRtc80rCRYbZPcs75SpnfBFDhq/+aPmrbIA09hECNIuydOXE
SonJUz4eOqyqDOisb9E48PRw6jO4N/KOcSCdDuVXSgsR1NjPmKpDQUCAoQTzStF1
3Y5zaKOzmr0GAIA2fezazp61qpUJQQ==
=VofN
-----END PGP SIGNATURE-----

--R34ZYtsIR1HkB4hI--
