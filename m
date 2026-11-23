Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459146;
	b=X9ziZChf21RhnapEpYTvID447eh0+wXB+RZlzVtNf2WvwqKNRGgGW9ZeX98ey1x1Krqc
	 6wcPcZSAwyRF5sWLwKNpyro1AnVhw3CPXdlNskWINEZqohkgyuiQq/ZdubN9Sa3Ge0B14
	 hZAZwHsa27q7cMYLZWkpymlwtQ6U/hptLoRmsc/oT1ssfqpGNiYC6ka2fHro1sXZai4T3
	 N05lxztEtw8N8dHT37KBAu2lZxRwFgo3ud3IF5J1yi1ahYwRp1k0cwtlRqIbB9klgPbHa
	 xLv4bT0Vkt//rCUXigtv44Yam2mU7MzYbmBIwabtq7FWOs7EQI+Fvz3lrfLsKWvGttw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459146;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:X-Cookie;
	bh=l/coXYN92zNNYhXdaeU823Es/cADMbebwIixDeYrc8A=;
	b=AYSf/HE16jeMlXcdJthVPHjs49/XXLjjnrJlwnXFPbhpgHbblIURPTEb3xm/skFZbWte
	 qtrDE9n67izEzRHnLGSUHDowC8A+ovGReHk6ob680xj5YSQ/kzanjA/AWIT3BExZskL1S
	 J8gFQS9JAwx+ZgYSzm2I1Gi667fpvMU80OCNdW+Ahpjo4epWkc4tW6bY68HQdtWgIHWea
	 guXgztwB158YHCap0YX/AuXuG2Q6rl+ICZNkxP8HhUKrxavt2jkFDMd0w8A+j9FnY0/vY
	 kW7EaBW9gb9ZkfSqZfSno0mR5KDsvVKvxObT4FKWBhh8Esep0IwNFAGJ6Kj9m3TUtrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DxmcYWYH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2147F606A31A;
	Mon, 23 Nov 2026 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DxmcYWYH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5831F000C0;
	Mon, 23 Nov 2026 18:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459145;
	bh=l/coXYN92zNNYhXdaeU823Es/cADMbebwIixDeYrc8A=;
	h=Date:From:To:Cc:Subject;
	b=DxmcYWYHHJgIwSfF+2SPN3AybAwx6cGMwgedzHn4rRQ//suII8jExsarE+JrI/kTv
	 7fxkX8tESGdL6GShjiyComSy7qCPreqAykycSubyCKrRIiSBoUNJU58zOqs3DfQ4T2
	 rzX0JGeAaqrKVxX8DX2HOuReD8hLtTO5zhV8w1KfwsXLm9Dwel0xlLkNMDwCshm96I
	 opmV6xzBQh+I//OGPEzlGpXMxsnJUDYZeiEY+F/KU4CMQwC5I9CmoZlN8vcave4/bB
	 //QVYwTSU2egi59zjHQZqIolFyNoUlSm33kiU/NIXHAXh40dJgrvOkxapbrMCaobJL
	 pjXj0XmonpWGA==
Date: Mon, 23 Nov 2026 18:39:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.4-rc4
Message-ID: <ab61988b-1cfb-4563-8e77-9e997c1f33a6@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="aZ9w3iVnmuJELrHc"
Content-Disposition: inline
X-Cookie: Truth is free, but information costs.


--aZ9w3iVnmuJELrHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

There was a bit of entertainment earlier with the filesystems following
the trend of introducing API changes after -rc1 which I don't think will
end up reaching you, but otherwise things have been relatively routine.
There's been quite a few conflicts coming, plus a few build failures,
but where there's been something at all complicated people have been
syncing up sensibly.

No trees are held at old versions

Trees with signoff problems:

  ext4		(missing committer)
  mediatek	(missing committer)
  mtd-fixes	(missing committer, new today)
  thermal	(missing committer)
  workqueues	(missing author, new today)

Non-merge commits relative to Linus' tree: 9557
 9652 files changed, 488596 insertions(+), 194526 deletions(-)

Top trees adding commits to -next:

  1151	drm
  639	net-next
  421	mm
  390	bpf-next
  388	vfs-brauner
  349	sound-asoc
  349	qcom
  309	iio
  227	hwmon-staging
  194	v4l-dvb

Trees adding duplicate commits to -next:

   73 drm
   35 amdgpu
   13 btrfs
   12 btrfs-fixes
   11 drm-intel
    3 perf
    2 leds-lj
    2 drm-intel

Thanks,
Mark

--aZ9w3iVnmuJELrHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEiEUACgkQJNaLcl1U
h9Cn3Af8DiS8Z2+2nlDnFl0gReduHCUptwIMhpVddaKNYgxwkq9GIQGExWSUpQvm
2XUVcM9wqDgsEvu76cZ7if7shUCVZXftfnhefmGbOka5QzSjCPgo0iKTSx0xntMB
iG7ywy+Ltb3vf5ayKTXkegm5ZRt7eeutU+zKCPlXburXNiotpm9EUJp5WnpcCB4I
TvjIKJxW1PKo7nevGzIQ2ixI8ZhqLet19jC1NhhmwLtjoZezqY1U2Hvi4Hn4wSkp
afGFbNPALU5JYh/BEa9cZV8sbFCivmiYtjX78MWvW+V9mVCwG2Ljgshck/hLlTRg
lmpouDbGUmJICvRoPUD0Qjd/qksHzg==
=3ymm
-----END PGP SIGNATURE-----

--aZ9w3iVnmuJELrHc--
