Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A592C34D3B2;
	Fri,  7 Aug 2026 14:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113443; cv=none; b=l1iRyeYo/4zjBgYzayrJsbGCIidOz1xAAOjAOlGV8dNt9rUO3vbNnvAyvK6S4QQva35DUnUIhWZmcRUDPJVADZ8B7Qq6Qc2OZalFS8er5kLf2hZIbZy8JmVNRhkhGPLYYUavosXqsmN93Sw1gvud297VHD8EOnJ0G3K0hBcfl4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113443; c=relaxed/simple;
	bh=RVNDdV1kDttBRz8IqGwCw2tKTilu4koJQFyVjJM4mG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFp49rFEagJn6ajfKMuKXTl1F68e7qKBzHqjP175wn88bazKBG57lQNEtDshQTXcKBQRVWWM7tFpXFiKvJLfC04yPMTHKcd7XA0lxGdPwNMHh525BFqZhnY64h97jFzQ8aT/+DULPdSAYl2GilE+1KiIjsygTjF9w1iLnF1eL8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfKYUNf/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfKYUNf/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457C91F000E9;
	Fri,  7 Aug 2026 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786113442;
	bh=71Tabe78CPm1mLz1oLOYFl/DQq9Z1zj4LW2hDGm9YPI=;
	h=Date:From:To:Cc:Subject;
	b=PfKYUNf/toW3I6HvKoLxJO3y+M+BuUSgLKEdAu4T8kICKeIJS29JBd1lNhwJhsYal
	 sfh2tR9XUkqdtgXjvrmYzxlgP0uSdlinKZtmAgNpYbkLmZtjjuu3hN6QvO3aRmjKhS
	 8g4M0laJSrFstvbgr0Kkh3xei+NRvyTGi5/N8b7vJ4ujPnXeJeEuZA+lp6oWHE6MQQ
	 LyMnqrXUn0MT9yPp3qxk2uWNU0xA0ooqZL6nmbmDiHADjwphVYacVDOJka7weIp4UX
	 V/Zl5Oe5HPSesqtSdwQ2HUwxccm80v9oI5ytoYZOd+wQC49R8SlMSBIaXkyXOAasSR
	 KbdJ882oWiOFQ==
Date: Fri, 7 Aug 2026 15:37:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the perf tree
Message-ID: <anXtnqxN5PN4ULmF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qjqI66miRpHClBm+"
Content-Disposition: inline


--qjqI66miRpHClBm+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  8782a10c74e85 ("perf trace-event: Fix integer truncation in do_read() and skip()")

Fixes tag

  Fixes: 454c407ec17a ("perf tools: Get rid of read_or_die() in trace-event-read.c")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--qjqI66miRpHClBm+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp17Z0ACgkQJNaLcl1U
h9BomAf6AscYh64Kq6Gzh3SmpSBwP2m5egQuxQzbnXNwHl94Yb8nJ0mz9YX0G7Qb
Yal3BCB76wjCpvybcpMxjJT6Z/wTH5VJZ4GWqyP6rLLtr3Xnb3iHES97eP9JaDfu
9igMvhy9r4Wb9LiUnnn+owT+nbgQp+aJRj40bzdjSty89B1uaVc8q2+npLp/IwjA
yblbGrL6IuRp+fJ8yYdu86TtTJnfYSeqnn6v6TX3eackWNI4D5HJJbeETNu5QV2K
jnoc9yJWXBMCy+3FfGg9LyrvzBsb9EtbnsZlZYLnurTu6AkZre69BH9GiQ+kfeEy
9oCVXpPJ19TUV7DqrYCgqvH4Z8JFvQ==
=8TIt
-----END PGP SIGNATURE-----

--qjqI66miRpHClBm+--
