Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7453C1F50;
	Tue, 26 May 2026 21:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779830386; cv=none; b=WU+5ytPMo6S7vAcoE06e6uF+dSmI72Jg6JhEJ9v7YVQoqxVqr7F4xonwnIxrlxSWYMaDz/gnrU1CaJbgD2rd7cmnd6I8ee7F5Mj9aRuM5pb8l5GtFYwp/BXz9Ltg7KnSzwu8mGzO4vv4nEYk16RAKx/LSuJiFfHA/wl7ti4U+wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779830386; c=relaxed/simple;
	bh=p5XvHAFa1XxBhAe1rsUITwe6JaGM3ye2u1xC+anueSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NpjHBfyGzABAKSKbql/ZMCTVwE8lqcfEKQaoDnXK4qwTHABETsq7y0xNRgYYrAD/riTG0sH8X1zEx4cSem5bgBcW5F4wA/x/HJrvFd8GDjcTjDHhtwQwdPyNxUN67djfB5OFmlle76qiUYuatQ4W6ZMXNCzii23p0fH/nnSzpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LR26HRzm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LR26HRzm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DAE1F00A3A;
	Tue, 26 May 2026 21:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779830385;
	bh=+7xwub2HnlPvNJ9JpqbpbN8LwCeV4GVOSHnX8I4GRFs=;
	h=Date:From:To:Cc:Subject;
	b=LR26HRzmw2gtAEdF+D9PQBk6X2IslfRIsew8vgItQgNj+zrJDXd6K2UwnxP+Rd87J
	 ldDC+67MrYKxNCRM2pTlpgTL4wP2Up0GtzfgIZzLWxjtdtLoM8LJX4FTdvk6Vj7K0e
	 /J4euKbdWJnlB+uIrYHSBB9GhXPxo4JTuF2dRT7Gym26YHgZiUOJSeoQGQ3JPUa/z3
	 dhhhkSTj8n+hhYsCWkG4rQPsyWNW7ns0AoxuGzciHcsNn6yydSGin2hKSRKCylT4Oj
	 bnQ3iPdhwJVSf3gJfLVb3Si1Pfsxn6Upw4GzbQuTUSVGy/HmZ2aTU4XnPk+3+gju5L
	 AbugybN4rVb5w==
Date: Tue, 26 May 2026 22:19:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rpmsg tree
Message-ID: <ahYObZ9AWrcYwHhP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RcU9u06mi/MEw5du"
Content-Disposition: inline


--RcU9u06mi/MEw5du
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  49abb5d6e1ac8 ("remoteproc: use rsc_table_for_each_entry() in rproc_handle_resources()")
  0590420c2f90d ("remoteproc: Move resource table data structure to its own header")

are missing a Signed-off-by from their committers

--RcU9u06mi/MEw5du
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoWDm0ACgkQJNaLcl1U
h9Dq9gf9FvdOIQb7YC7/FyhfF26e85UywNKqdwCQYwr3+AoImwNBj3+alFviTw7i
16XIc5i/dvVyeyqauuOBHWSj2hqiVb3kIOHMeZqtiSBRuyTlR5eK6xWImWzaY89X
Jl7qTLxQz9xNo8zMrGev6o/7Yv+QHS1CqDRK/yix+Yg3BUyLHQpsHAHqOBXo3uzs
96MOtmM6FfTmAqGRgJXITBM4FTtFXmTKMjvFSrRcbrrkkeK/0BvYwTfSIMLTLp/K
WBL37POEiZsEtH9ouEH6swDKQk3Blv0T9iObug8apWlm1Zp5CiJ1s5i/viOWm9AD
ZzoaqVeCMwM7s3CDMqmyfs4YpvIftg==
=KPeE
-----END PGP SIGNATURE-----

--RcU9u06mi/MEw5du--
