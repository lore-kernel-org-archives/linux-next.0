Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032AC366047;
	Fri,  6 Mar 2026 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798243; cv=none; b=Q8dSDLyJSZTgAbFT4d8kuO5NgHR9TCPWuGEOEpksWB8nRf/yfmgMgjmjpWCKRNfcHCoYB4aBnVZgyQ2yjhuHcqTvrJRIsL3viCcnIlt9hKDb/BCq85yszBFNn4tb8lomi9IqF5nZs4lHG/j8CTReOI8NEXCYHnYPL9FMOeqbu9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798243; c=relaxed/simple;
	bh=TwLocD6U/4Wb+WJsoqTOVucwtwUKjLGXhKTHryQ4fhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oqv/YR2A3Oz3sSo/7zvtc/IL+YdDDwyYaHROhQnpej7k6pSitXyFzSZIXS/b2cLpuWfMLAr7Bf8NKkdunQHH2CR6NufQoDYdSXLYwMuBBmHWgit+XZLiJXou7YoWEC9mag1srgH4coxb0PjObvvzupYRPPUIiTE92Xeg9BsmX8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLpTiHlT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLpTiHlT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C742AC4CEF7;
	Fri,  6 Mar 2026 11:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772798242;
	bh=TwLocD6U/4Wb+WJsoqTOVucwtwUKjLGXhKTHryQ4fhw=;
	h=Date:From:To:Cc:Subject:From;
	b=tLpTiHlT2GLs/PqXDkrTEAuxB9X+qyjL3gElNWnklIOiC5cbSBV770HDaeO30QsYh
	 xYCJpciolbYQYkVd8PWkFY6CxtuYpLSTgIKR0iAULPBMWbEJT6HlhOGCg7014ufzuW
	 T096efzt0HjswDkqMe/Nm18kAw1qYNwz3ZcfmR7Sng9MbIMVpZ3WsYDOd3QJeGYnFJ
	 3CxriuCZcE8n0TKQkGWsvyWJW41FZSKSgANEHo15+w32R6JhHSykArXLxIsLj/Vdvf
	 khj/L7HifGXu7WhBqhKpK07t+pUgXf+Kw3Uth8ZfOc1UIIXozF8TOQhjOyRAgq1fBM
	 X7KPOXrg3cbzw==
Date: Fri, 6 Mar 2026 11:57:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the block tree
Message-ID: <aarBHz0xyVv9UT1G@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ce7VmlxwLlLKWQaW"
Content-Disposition: inline


--ce7VmlxwLlLKWQaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  4f2ea80dc6c44 ("fixup! treewide: fix remaining read/write iterator conversion issues")

is missing a Signed-off-by from its author

--ce7VmlxwLlLKWQaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmqwR4ACgkQJNaLcl1U
h9AN8Qf/WK6Gu0XkVWuf8scmAqHGclgPu30HJjgabKGv/hyLYV75d8Cxe3WZhG4c
6Li0gpARCPh416Tic1kldwhkjUmXkU2tDLjPVteJof4vW6p9PjUJc3b6uU8I+Eop
9nr9pJTmCidp33HYCeEe2XA3i6lwpO+mW4qq52m81T3Z5+jIjzCrShcxVdhFO63H
NKglqtDzga7fxBMFNnQBC8qQUcR2LQplPI6mOP6QrcKXslN8flQE0oEAbSYue4Ri
c+lULKT8KsjiAuQqc8M3gLjRymKy7BratPzTvaIMgYwfxANravou0YuYnXQg6d9Q
K6AKFp3Pe8DdMSM+8tPgUmC1c3Mwyw==
=RJvg
-----END PGP SIGNATURE-----

--ce7VmlxwLlLKWQaW--
