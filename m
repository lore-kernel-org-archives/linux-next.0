Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406C75B21A;
	Mon, 25 May 2026 17:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779729540; cv=none; b=Vnv3IE/Y21DghLgpcr7an1lpNaIGkppQ06J2Jt/kBz/M+eXSmI79OWaaBajjQtAhT1CY0oRtaeSrx21vXAa1lSwOE8OSA48FD7FO0wlSa9FdYqJUVXeQ+CFwduLcGf+hM+pGnQgy/fVoI7vIAwI8fIfAhfx7s7hWf+5hcS+kxps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779729540; c=relaxed/simple;
	bh=MpdQh1436V4ChvzWa5tmf46npFcpAvUSWW1jTGIOcYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CRko6UIs5g43Yn38AdrQxiQwZ4c/5I/SUDp9SOJnPApu+bXv8ZFK5SLketSSBADP5heZyX2EjyFpC+T7iGaV9hIRutJO37FjAWBBvA0AkjQBVyZMxJkAbL0fWDPNboK3g0MvB2eNPVKvJ1o0+tqqFkfDhjPGyMhthY0aaizk1Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjBjdZD9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjBjdZD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206541F00A3A;
	Mon, 25 May 2026 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779729538;
	bh=u2DntOcoyBe9c7MQ8RAtlaf0ZYjmZAWibQvI55wwC6g=;
	h=Date:From:To:Cc:Subject;
	b=OjBjdZD9Acvs5xC/KXddBMAT/h+IyfK42+gRbKHTbkD9ZUG6fOk3WxKDJEXXAjZxD
	 KbiIxQJWdaSwgP74xSzinVeD9VM5DxxqPX4h1H1Mi9YxEThkkC2+dQXl5vpv6JsNpz
	 GgAa2Xi7mnuKT4/sRY/Kiq8QSTp9UnAyiujz13jCGfeKpRvzeCBEGsJm8ZBjpRngV7
	 GM4qGUKmydmlVFyDR5lXlEJuEtoy6e5bpZZaFgK+3jW/l7qNId1D+Vu0jnJcqzaO6J
	 03EFVqtSwxowj5/9FEfwBUfIIraDklJ9I7d/hGIm6OZzZjWhfVL7R3UfD/nUrmLsHj
	 uyau5iJEi+6qw==
Date: Mon, 25 May 2026 18:18:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.1-rc5
Message-ID: <c92cd340-c8ec-411e-b55f-5fe3a2544119@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="odQTAcq/LPhh0xq/"
Content-Disposition: inline
X-Cookie: Prevent forest fires.


--odQTAcq/LPhh0xq/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

After a rough last week everything is relatively smooth at the minute,
though we have a slightly interesting machine authored commit causing a
bunch of signoff warnings.

Trees being held at old versions:

  drm-misc       	next-20260522	(Commit author is on it, patch
					 posted)
  vfs-brauner    	next-20260522	(allnoconfig issue, new today)
  nfsd           	next-20260522	(Based on vfs-brauner)

Trees with signoff problems:

  fs-next		(missing author)
  nfsd			(missing author)
  vfs-brauner		(missing author)

All of which are the same issue, the commit is attributed to sysbot:

   https://syzkaller.appspot.com/ai_job?id=d70208cc-862b-4fe3-bf02-3031e10cd0b3

which can't sign things off.

Non-merge commits relative to Linus' tree: 7258
 8265 files changed, 442632 insertions(+), 167862 deletions(-)

Top trees adding commits to -next:

  1081	drm
  527	net-next
  345	v4l-dvb
  343	mm-unstable
  241	tip
  204	qcom
  199	staging
  193	iio
  171	sound-asoc
  153	nfsd

Thanks,
Mark

--odQTAcq/LPhh0xq/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUhH4ACgkQJNaLcl1U
h9DZ3Qf+IdG+PYkPTrtOGwWrt6YeIIHQqG/fW9tflGNLPhhlbu3TyCvv0tt+Oora
TKtRzcF6CbnoZkZinpJiDwfLZ+IfpMOWjmgwIJjwCfVXdlRtsu+1jTRLxvQkC8Zv
he9yQm2fArhkIgUZWKyN6Biqbnos7cNHeKoV+cO9GVdlAdtOCmO8rcF1zWHyfV/z
bgDt4KkzuKJp3w7kspAWGBt+zNLab9vtEsyx6pbTwNJI59237AorqbswuwLeklty
OLZvhxOpWlKNVO+Cah7J55PVfk///Ze9AF5Qeb+KjLqx6dMyEEXBS+c7dxjZph24
spZ7m+jhh8jk9rJ9A8GDHa5EzAHQpw==
=a1Qx
-----END PGP SIGNATURE-----

--odQTAcq/LPhh0xq/--
