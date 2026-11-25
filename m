Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610454;
	b=BstjQtKvJGwjoCYPlL9Oj3wfWRUe5O6mTxyw66pfsiDiHdsKzq4sEmdIqlFeHJbfMdmx
	 rFo6CqGOOqUrzj+fLR/HaAIMNMMqMhBJ72PpUTii2PPfG+xvXBc36Fpz+Voh8qQLUHv12
	 IbzTGQKgK/g7gAltmD9k9Dug3z9NnguCC9wvL8mh7TI9zQ9kY+RlczmrUZ4+w35hxg84G
	 vdjz985wCNA1vyJBdIhZqR9ST/DmPmwmHia7vPx15EqucerprtqUKm/KaiO397t6k7G27
	 sKrrsZnAfnX0N290KBerkNn59g4md7ddJ//nMhNgERsv7acG8UVcqUOQewUofRFd8Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610454;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=gGfYfFlghr0EYsaVgSgs9YOkY8hlabDlJEfwTqOt1zM=;
	b=GarejYgYjrteg/iQl034DGWCgBw9HWAqPRyG+O6a9CM8dvFakeAk0qU3mgoqWyhz13XE
	 NUpYnybxyjTcfpEWEwiahvFNi5tJpzvUxmY4P56Cx9vvPsgneo/wjLsY9Eja5iCGgujmV
	 ynpv4hFToimNVxVn+PlK2aib5/zLYfFHtPazW0dubiSZ4T3hG4YvfyouX3Re0dReaG8mQ
	 VlsD+v2Dnk/iUBZpOmlcVpAPlp0ez73ksITin8EBafSX0+RT1KkUXe1m0rJA3IbyIjJzF
	 kNLqOBCehlB3QqHY1hYJ4RuFh43i1PSEt+mge9uqn3K7DYvaZeDTbKkWQHn/Xxp5Y7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G+/2PmxW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668BE606A323;
	Wed, 25 Nov 2026 12:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+/2PmxW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007781F000C4;
	Wed, 25 Nov 2026 12:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610454;
	bh=gGfYfFlghr0EYsaVgSgs9YOkY8hlabDlJEfwTqOt1zM=;
	h=Date:From:To:Cc:Subject;
	b=G+/2PmxWGO4nZ6jaWwLRRQptSrNjKUxa8Qka9aLwpCjlcQ0aW1g7mho4iqBjzKMyG
	 OkYPWQ/4IKrhVZYfUrw8wGmlZcYKTBqdYSsq96nrJHk42Bc146CXGCYxmG25PJhb1P
	 NnZuH+7IB3y0c89eyW4XvEniHWag6oYxvPobJRjJHsWwj/QKiErlYdDXxNd+KcKTgJ
	 YJMa5zZ9OZmyHzDE33jSJakHOeKDg/n7KGOXFTyeKKH1lNqjFZr0yrehquI1HMhbJ6
	 gRu1LJArxJk+Lp/CMjhSrpTa9jqZMP0uTEpVwwT702yYZyv//eTUReDt3VuPPCpfKN
	 Otz1b3RN74MzQ==
Date: Wed, 25 Nov 2026 12:40:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the perf tree
Message-ID: <awbXUvbdJt6FcjKc@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="NLdbdYZFusFqCqtP"
Content-Disposition: inline


--NLdbdYZFusFqCqtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  0215d3b0181da ("perf stat: Start tool events when enable_on_exec is used")

is missing a Signed-off-by from its author

--NLdbdYZFusFqCqtP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG11EACgkQJNaLcl1U
h9CQQwf+OPLOQt6ygkPQYrZ8dlwngM2qI2/XqIPbAYBcIGz1HByNyqYGUgyflqg8
M2qpUUIFgL68ULijscMq5h4vXULNH3tWFIgg0knXvTEptY6yCv9uUuu02rTBFElu
3E/ZSGlBcHb+tU79ODQzE+9/DW92g4zq9vKqz+/i6wED5SGFjZPGTbYEA6Ddzcnq
bwVJZVNYn/zG/3B5PhugLskLUPvpgufNz+JaLV0Mm9HYKF2aZLSi77Ed1qMF9adZ
P4pwTPVU50/c3WWKmek0oylTSdBylspv0W47Zcr7GY9ap8O2m6rboAuuYJo8uh8V
yfaZyNAKF84oEeOxKEgm+g5ZdQATSQ==
=jwPd
-----END PGP SIGNATURE-----

--NLdbdYZFusFqCqtP--
