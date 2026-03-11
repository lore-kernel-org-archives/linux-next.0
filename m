Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25730594F;
	Wed, 11 Mar 2026 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234488; cv=none; b=ppHlTve2ugQwEi3pFH+BtnO/Ob52qCGmo9Le2w5x995NUuh6Wu189GZo5sQSB4fna6aNBL758SImKzYU3kJPX3V5kq7HYw32sDcnj3J/Wp9jp5YLIaZIB9IhGHFQ2n4aLomxJwooMS4oXtH/pcU6+feKo0a1XMWH5TXqb/jt7ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234488; c=relaxed/simple;
	bh=7ywf9RD+3P81dPWLDBvGPBHIgKieALGAnaLQrifR8lI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ij8k6wzpecJw2vJTl8F0i8Is7wwPuIyfqINfZcbqmxkX5iY3/4OoS7mHmpsJk+pCWbFYHlkDvSIh0xqEPTGwyo+lcjq/fB0/EE8e2PjXcHZldPPt0H6Lmu1RCyvKJ2zTPeJjOPxbAbaswRgebaP9bOpMIpKTssDdFe4gsJeA80I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZ6RuWfS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZ6RuWfS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E3EC19425;
	Wed, 11 Mar 2026 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234487;
	bh=7ywf9RD+3P81dPWLDBvGPBHIgKieALGAnaLQrifR8lI=;
	h=Date:From:To:Cc:Subject:From;
	b=TZ6RuWfSNomSLTQYszKCWY1N+MALH1Iq9z7rzQ3giHWROKlxnJarysqTWxyJ7Xg6i
	 +Z21zR9IlIYLnXQlmqSbem/3HE15vJ1IxtupqFGlzRJeKi7uxApnyoj/pBmm7J61o3
	 Fdphc7VR44LWlKz1L5Q8EHZ6m8FXsg8roy6RIWtG8Yk9JbT7kp9yU6KXuARMbXWc6L
	 A9lIHKxcTRtJLzZ3QmYtd9BxRVn5P/TUfGsTucP73a6ULvtSfRb0iFaLTiBf5cF0wK
	 xp0qq4nH/UwQPYsWB9a4thpVT7xPChZxYtOZO3L7pNZNBvPWBL5ttvGLKhlVAa+PY9
	 p6rDzmk8rNWHQ==
Date: Wed, 11 Mar 2026 13:08:03 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
	Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-xe tree
Message-ID: <abFpM1FHgzgARB88@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pSWo/HbXfnDl56bd"
Content-Disposition: inline


--pSWo/HbXfnDl56bd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-xe tree, today's linux-next build (KCONFIG_NAME)
failed like this:

/tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c: In function 'xe_lrc_ctx_init':
/tmp/next/build/drivers/gpu/drm/xe/xe_lrc.c:1554:43: error: implicit declaration of function '_MASKED_BIT_ENABLE'; did you mean 'REG_MASKED_FIELD_ENABLE'? [-Wimplicit-function-declaration]
 1554 |                 state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
      |                                           ^~~~~~~~~~~~~~~~~~
      |                                           REG_MASKED_FIELD_ENABLE

Caused by commit

  0e07b16371b6e (drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3 bit13)

I have used the tree from next-20260310 instead.

--pSWo/HbXfnDl56bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxaTMACgkQJNaLcl1U
h9BiWAf/cn3yGEprozafe3EHyMCNoqA8rHv3JOJhAbpky93wk2KEPdC7W89RRfF/
u2Cszrl1zbYPuFsAoDDesJoT0uMgSi+BhG1PsbHzK90sQX7Vdifn652vNRfat+2r
fbtWj58iZKHalerHTGda3XVVspYmB5pSQnmpIF4KZjegNlkAUNrfC5mWhrPVj95J
LhdsKOYGOpUeBy08gYwQrL/HCCOL8duaoe28t4qfDPn8p9uTclt2cKtmWPWMQCOW
1GBSvzY3tyDU5lLhZWA6Gytr5Vtgw/24ksUUpvAQwA5+N0Z2/SK1EnGpLQ/iTIlp
fN7tRIqdDKWrAJUcsH4jKh7Qotna0g==
=xFSt
-----END PGP SIGNATURE-----

--pSWo/HbXfnDl56bd--
