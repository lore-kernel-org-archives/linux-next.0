Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BDA30F95A;
	Mon, 26 Jan 2026 23:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470382; cv=none; b=Fe6kAtV3kRGir2y/FjVlAGjia+SHuNdYvE/gqbax4eBYzh+udf8nAR5o1JIaEfyv/5t0G7IPWfnTE62MZB1WeE0BJh3SY6dZ6OaiiWHePtcTI8J/KEs+c/gmTkkeMzhs9EGsJsuf76INKslKb6JdALUYg6de5Z5Q3hMjv549fXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470382; c=relaxed/simple;
	bh=rfItKMVfYHgb9CbR/E97MV956/Ra87AWzQCvzcMuvnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uuGug0QZa3cKSAtE0JWBpGLRtJQnQmk35wFwU2S2N5YEzV66g3yZ4zqCHpjdZW/htljUKPMxThWBlQ22OI6v9/GZH7WKCxyOQPi/SSoK5rE66HfqyWnnaFg6gn9Xwrj1R7p93HaHpZd/ubse8JgrqIuPs20+GQSymqbBzOR6tzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oq2hBd1r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oq2hBd1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40FDC116C6;
	Mon, 26 Jan 2026 23:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769470381;
	bh=rfItKMVfYHgb9CbR/E97MV956/Ra87AWzQCvzcMuvnA=;
	h=Date:From:To:Cc:Subject:From;
	b=Oq2hBd1rwq+G8fI0eFDeGbqKuHYJqln37FEnyzrAU13SbwukVde2B0swB4i2BfKGg
	 K6eKD6APrMaMDQcldB0sTGDFdLf98TTcmJjoFwMobmlnxZLyXhQQWer9vd6uN6PAEe
	 u19vAcrryIsfszQSeH4t/1PZ04e+WqXIaS82XzpGi1StiEBeTfnHXOz0DkSmN5XgE/
	 avy0kbfQfcQMtHP4tfhtWBjvd/GYONWD1Y//Pu7R52FrxE4ZbwUO3BCg/5W4hVh6yK
	 3SbLlGYqCE9LIoGnx/tY45zUeMJ1LxQn9hNJNKnYxFWfoV6Cif2OASOzSnd0kF2VTt
	 ygWFpubxxAtPw==
Date: Mon, 26 Jan 2026 23:32:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Pnina Feder <pnina.feder@mobileye.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the final tree
Message-ID: <aXf5qe9Up3BErSp8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0TU1knPBwbCTi1zq"
Content-Disposition: inline


--0TU1knPBwbCTi1zq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After the final merge, today's linux-next build many allnoconfigs
failed like this:

/tmp/next/build/kernel/panic.c:79:14: error: 'panic_force_buf' defined but not used [-Werror=unused-variable]
   79 | static char *panic_force_buf;
      |              ^~~~~~~~~~~~~~~


including the i386 one which has -Werror set.

Caused by commit

   090adee62cb6a (panic: add panic_force_cpu= parameter to redirect panic to a specific CPU)

I have reverted that commit.

--0TU1knPBwbCTi1zq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3+akACgkQJNaLcl1U
h9BIFwf9GLpeV77UikULnm+9TJ8xbnACREtumlb5x5sL79knYiMVszNRKo0SYh+g
abIXv3zXFcUvjd5NPYV8WZvnCZcksRcyPGReO2bCW0Dv1773vB0aQwDsHrSwLYCt
4w5wUuRCkvnEZVTqWXeIkLK+cwH0HHBU0+2YK21wJnyI69EylK6cm26fDUkmc8qc
em11CmW4AfYCS4Dc7+A07ankwuAZZdz7OJoI9JsKB3Z+PFgvnNAckpHOqyQj+KF/
APId1s3wnuVesIwUf1QaANcKjnR0d6sHa8ziByBYLGOaAJM6G8FgAt3UJQUO8ZcS
VG+5Mk+x5pRkjmLvQDIsOuwbDsY40Q==
=HiGe
-----END PGP SIGNATURE-----

--0TU1knPBwbCTi1zq--
