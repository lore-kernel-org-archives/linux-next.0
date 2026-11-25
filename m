Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615869;
	b=3ye6ly4LQgdgD3I3aza2kt6q07MHkB1z+7HzjSZBs9kXJy1/t9SyA220na+ikICeBwTX
	 NqDAilY0KDbvSalOGcDF2e3un3KfWzjMUZu+z25FqeB+cru+FgTTTEYqn0qj54IKFGg4U
	 fvDbnVuhLkBNbKoOiv+5UaIcb9Qb6IglWsTivLWee9E5TaXEty/FbKqYC3KMq8IbvOybq
	 172Xz5MR0PO8RkFiifl6i2nvKIVxtIwI8jaZ0LJzEIQguNAUbs88Dly4mXiHT/heNxFHc
	 7k8v0oY4fuD3foUOXhXwWKVv724L4a8h8hxPmTyfTm+zky9JwxOvPhCaOHV9NSmXPsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615869;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=68kwm2P7mVkXGott3G04Q0AGWPkRM2pynkH+PcU932g=;
	b=XgpSO+o2URcCwNG17rlRgQJwVmrUjCoJd3uPEjwJNdgd9ESq8/0bXw1kRIv2k3xmElxf
	 6Qnwdz2ZlBHUX3rWLmcHhFE7WQ5gtMrFd63R4eFvsUlsQ7MyX/8JhGTW7s7KyTcxllY0B
	 GoHukPA4KWZxwfKv5n+MlbKfvxpBodCTAcLl89LCr6DFROy/NB0yYp/hgJEheOKWw5TOF
	 0M+mBXFj+3EcdQF0KmRWpuiY3Qt3mXOxJVliQcowlcb2CuSqZqs03ct0nI3vjDT26PSSg
	 g4qHiptrg+TRC7fxwcWTyY2NpPJrNt2TMMZIlXh4/DjgEQkT8esJdnVsvwAgr9uuUvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6trwgvL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0EC606A321;
	Wed, 25 Nov 2026 14:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6trwgvL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47251F000C0;
	Wed, 25 Nov 2026 14:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615868;
	bh=68kwm2P7mVkXGott3G04Q0AGWPkRM2pynkH+PcU932g=;
	h=Date:From:To:Cc:Subject;
	b=F6trwgvLQb2Qa7mUPX/GpmrCOwnFUDV2MmA2wP6URbAHRugpb/m5X0W6TapLvFZD/
	 9SxyEGmWBqrFmEw3MMOXfwoOibe+XaDP0zOXDDE5nV4EWyNQ8dvdC8fisYvdesA1mr
	 LzcIDrBNInNxAwko6LuAs3NNiWwVWWg+D6lB4dwnMVIJrDQkVXV3pA+2G3px+iuHBX
	 mOuQPRMGpfHpqy5NFciXO+JU7k94TE5tOW5QRWp77vbJlqFtTqDOG8tII7PULIFz73
	 IK4CSbAr2sRwoCcjDPA7Yu1oD84vT/0Qm1k/5I5pMNHvBufQGKf8pYHM4BMtB8YbTl
	 vZrBAZbqlpEYA==
Date: Wed, 25 Nov 2026 14:11:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbseeAnRCxzl-kK@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KMT/Qgm6hWw/i1Nz"
Content-Disposition: inline


--KMT/Qgm6hWw/i1Nz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  e8aa0ab57ffdc ("arm64: dts: lx2160a-nbxv3: fix the TCA9539 and 1588 line names")

Fixes tag

  Fixes: 565b6713a460 ("arm64: dts: add Nodebox v3 CPU Module")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--KMT/Qgm6hWw/i1Nz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7HgACgkQJNaLcl1U
h9DHUQf9F4dxXf1KGPmbIMCpQi0resbFNL2AU0xPApO0lZbGtvl6kvFCP+fOovYR
ziaJm6n3BvLrlFFix+b/owlz+fpe/wpcTpZf0CdTj1EYQOzeOfXl+ZCmLPP6iLyC
oP+Wit9+k+xM3CFkuqhMmLnN8NScv58FS7h8e3zlH7KClxOq5X+VmKz9MYLw2wP/
3Gou1GkjmszOMu1rUQ6KyKoxMegLWliMqct8crCPHzDfONJ7jFfqMQOEM4PwfCYS
a6TK3d/WWqHUX0l0d4EHs9zPH4q34QSWGJ7m4VH5xKTjgpivKhLcGq+9T1WNnqwY
kwE9sPQr8mGmY/tN/tmAZSoFwNDWcg==
=mWx7
-----END PGP SIGNATURE-----

--KMT/Qgm6hWw/i1Nz--
