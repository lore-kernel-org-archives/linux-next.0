Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAA229BDB4;
	Wed,  8 Apr 2026 17:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668530; cv=none; b=Yr/7macrfOoDd25UZbPwDg2HF5eAWh8D6ho2DLHd/l3eB6mQsVOOM+10/efm40DW6tIxi5cIsGylXXa2fDg/zZSn6Fl+OlqlBRdokXZVQYrVMCdNX/kOA2v+AomTNo7Elqrl94A8MMtx+QxcANjb4ixmVy1CMdVeD3s9bbOcuOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668530; c=relaxed/simple;
	bh=Ea8kuzJDBy+2PpeYJETg1n/P0QgRtuMEkZSbPxG9h7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+z8bOK3WxHu9GlPrZdN/0dIJ0/pgmdg39yEnFuPW1Ot9EzEyKU5b1BSfU+0moo2ahKvCNu/+aVfC56PQgR5ysUZFaTWAy5G33RLEVWBzZX7/Qa2Ah9QoYmnaSdde3UrdfWogIgQJE3VcG/xBKSaBAyBgeVh5YYl6tw0IXQDp88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1K5KfvY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1K5KfvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD486C19421;
	Wed,  8 Apr 2026 17:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775668530;
	bh=Ea8kuzJDBy+2PpeYJETg1n/P0QgRtuMEkZSbPxG9h7I=;
	h=Date:From:To:Cc:Subject:From;
	b=r1K5KfvYTEFH0URBfsswpv3hc9T5utpFzHN6WNi2VeSIld92hH5X9tN5LihfuXEeK
	 +NO6wJytMZDmXqD/MQlsV++h4lN66hK3kv0dot6XDt/ohtOVIZjL2ErLx2yPlhNLNE
	 Dj5k2OXqJcM16jV2seku1FQatO+gxNyh7tYg0G5QdeG0EvRn34BH/OBaOEPASUrhcN
	 /sk58Gu7Jt7R3u7bKOpbLQ1P1Av8WdpaIrEaUAqIZwhAgH1+PjTyodvaGfD4oiJkpe
	 93XJumrAUoajWOgbnnv+NY5ytXPLaSmSB2CeObnKYISTVFcG2UnPmFrf9tsGRnsSR1
	 yU2PyuQ6b2HHA==
Date: Wed, 8 Apr 2026 18:15:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: htmldocs failure in the drm-xe tree
Message-ID: <adaNL_cT7wtfn7FK@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CIsY5O2H6CB3aCUS"
Content-Disposition: inline


--CIsY5O2H6CB3aCUS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In today's linux-next I'm seeing a htmldocs error in the drm-xe tree:

/tmp/next/build/Documentation/gpu/xe/xe_mm:22: ./drivers/gpu/drm/xe/xe_ggtt.c:124: ERROR: Unexpected indentation. [docutils]

--CIsY5O2H6CB3aCUS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWjS4ACgkQJNaLcl1U
h9AK3Af+I+eQPIbd4tGR7zxI44sxa1o7YknQfdDrYglBGDE2UGhl54+876S0TAoT
3PpbjP5lngZ7MF0+Qz5AEQ2fYg0ahcfIRV2sbJashkytYa8NzxhkeVuTISNbw99c
3uD/+RwJY+y7FoRZnlop759PxAuIEnrXO3YsDRCEAxxwsp0s3vyImje2conpX/t+
t6T9UEYrFWY3bj407+Hm8OIFwOlNekdqVrF4zreLrKYp7frdD+b6O0ahLlXX216k
riENzBjVyPWne08X+mLMiI32v4KcO6A83p1S+KRR1vz/rq/66Em5PDKgK5lanfKQ
yAg86cZavR7PLXHPqiIG5bAZfTsGuQ==
=UlYs
-----END PGP SIGNATURE-----

--CIsY5O2H6CB3aCUS--
