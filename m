Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844494071E3;
	Mon,  8 Jun 2026 15:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780933764; cv=none; b=gOWc/grLSpzMK3FdZld56EZw6fmqmaWdebHlphrdHBod2nwBkHowsQHtpiUjmzJQyIpJE1rXrvz6G4oumfPN63NhEU9sJoKEP1gHDw/loPstwEefIVvmTMrGhkDqvcgzPeEVCutJtZs5A5zJAae8LnU6LRTf10n2FU1JrmQt3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780933764; c=relaxed/simple;
	bh=d5rEWxIQF6my6QVhNRL5CHZwfe/I23qFTisHHOw1jAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XRuzbZfRDzzLSOz7+Ka5oV1JRqI/ZMi+gpgtK1hk8xFcwnUrFWMs50SMcnSDzE1bfWQzLdTJhGLNz7vuyc2bBU+fZnUYBPL6ZUbtzyuS+jDeX1NlvLdbQil0V9bq4P4vnPcY/yC6p0+INW+yx1gKBS8CogQgoKernKXxCohnV18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKd0XnGo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKd0XnGo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3EA1F00893;
	Mon,  8 Jun 2026 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780933763;
	bh=BlvYetwwxyKPcD/7rzTyoK91rp5qsu9D4u+7vkvF5Wo=;
	h=Date:From:To:Cc:Subject;
	b=bKd0XnGok2ogd/zEQFV0q/VfrflzFomkUjnJjqZN825WH4UbRToRtdeRNefqG3Vh1
	 zZt8vDddf9bDRg+mvHVwTmGtAw3Zl9Iw2EO40C8HkEjGNh9IAurok3lfFxnvm9swkz
	 0RcvCCKOKPP+UfjYlUHQhXhpgvFC6rsIrP7cNxXhq9as18YTNZxLoqUhhU2enM7DLR
	 yc2DXlzaPyu5em6lmCZmmV3uFGfafEhfD5dO6zFA4ZNEsunRoCFSHBQR+JcWm+KhyX
	 t+lgtSfB1wG9oGnRwJRGZlqQqpXR7dEdWq3Xo8lKqUxNw1e4kBERbfqXl/yf6Bfgkb
	 k4hGTz98LB+fQ==
Date: Mon, 8 Jun 2026 16:49:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: -next status as at v7.1-rc7
Message-ID: <a2fe64f5-bcc8-496a-9ba8-884b6655c6f6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="adqUYOQAnDm7bhNi"
Content-Disposition: inline
X-Cookie: We've upped our standards, so up yours!


--adqUYOQAnDm7bhNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Things seem to be starting to calm down in preparation for the merge
window, the biggest issues over the past few days have been things that
were previously masked by earlier failures that have now been resolved.
We have currently lost rust build coverage during the merge due to
dependency issues, I've posted a fix that should resolve that.

Trees being held at old versions:

  drm-xe        next-20260602 (clang allmodconfig issue, fix posted)

Trees with signoff problems:

  bluetooth	(missing committer)
  edac		(missing committer)
  pm		(missing author)
  risc-v	(missing author)
  rpmsg		(missing committer)

The pm issue is ACPICA things being pulled in, edac is expected to be
sorted on the way upstream.

Non-merge commits relative to Linus' tree: 11020
 11719 files changed, 717081 insertions(+), 225112 deletions(-)

Top trees adding commits to -next:

  1715	drm
  960	net-next
  418	tip
  394	v4l-dvb
  393	arm-soc
  281	mm-stable
  281	bpf-next
  266	iio
  250	sound-asoc
  246	perf

Thanks,
Mark

--adqUYOQAnDm7bhNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmom5H4ACgkQJNaLcl1U
h9CW1Qf+M2ebMf/YdMxu2ds541UdAgzyPjigsn1yixyGiGho4SfjMJM9zvMkd/kX
c9ip3QDUZzLVSqvrqy9GASBOp6m2deOXkuobvrpSKoj88+fBiU1LtuSS3w7r4sng
yfOxpLFImCfGEygX+XNrBa8bBndn5hlw2ZyfHwemUyS9lyg1/EVqzPDPCsw9lqq+
RmjLzjoCIHBF97l+RRDzuGeAWjGyFeezY8DG+vENE1p62nUBsnTCyONPpXOv3nrW
Tk9V4UAz3pnQvswo5kEb8I55iGbWTWey1rZ3bU5r4m3YgIApaVFskx10UeDgt7o8
/3dQTPR1v9VlVTvyr9Z9EtOu2Rm9MA==
=NvIf
-----END PGP SIGNATURE-----

--adqUYOQAnDm7bhNi--
