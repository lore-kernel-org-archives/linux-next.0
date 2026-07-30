Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C729539B4A3;
	Thu, 30 Jul 2026 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411531; cv=none; b=UGk0vAdGIBKNWzFbsM34XKg8qPhAvXsPSTQnew8SL0zgVtPDkgJfF/Q/wmDUCi4XAFZc2xGL+GocEzqehyp2cph/WlBF0tulvYyEqBQPG4MAcg3sTg0q+LQ9MC+ZsjD4ojQLLzxDNtrXkoRueRdOuTkxrSTIzMxwn2tfUt5ONuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411531; c=relaxed/simple;
	bh=DjtnV6E9OlGuqIjB9lmeBIYLzL9PgdUg9HbWvGaYhXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EPBByMclXAN3hbOeFQgSQAyjP6R65LBtPE2hZHDPsERQ/07ezTDEM8sDyO7IUvmWDt5I8k3vIvS7H3Mzp/n5sttLhOucPMeGXXBCKtN2DbqCZbOkUkiphM9Fytzl/b7ZW1M91brKY64FM3OlK33WBIPRGQiBQBEVtuna1THqLsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPV07a6L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPV07a6L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773A41F000E9;
	Thu, 30 Jul 2026 11:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785411530;
	bh=aCmfQf7ogvw/c8edl4ZYUNtgO1Ie6RpHi2ilAm3Nm6w=;
	h=Date:From:To:Cc:Subject;
	b=OPV07a6LWxerc3exSQhZj1YtuGDMpJMCUBOlFNhlQe8epn6EIFu86F9b2gdpxjVbW
	 hswVSYBYJHbIoLdT7bxMu1wGCNk472b/iFvDt8IDWAoOMIjv0joABdw7AxyGZWd2KQ
	 PYEXws2gPLqrSwTtkyl8pK0zmDyCduVtVB3crxXeHC/M/gySZ384wGnY39/+Ll0CEo
	 /BwnR04Fb7srWZY2zsj7h40Akb8huehO6OI9v/vR9k/AaEm+NOJVS8lVr+FeSznS7N
	 4L40E3sVPgzmpE2Rwl43T/nZB+dOcJqIv92YKiJ8grRY8fQp3wAnMjQX03uocS5sLz
	 dVQunCH1od0FQ==
Date: Thu, 30 Jul 2026 12:38:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the risc-v tree
Message-ID: <ams3xgPlOmaXdNO8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LaRZ6glR+PmEqVnG"
Content-Disposition: inline


--LaRZ6glR+PmEqVnG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  f3ca380030c89 ("riscv: Mark default_power_off() as __noreturn")

is missing a Signed-off-by from its committer

--LaRZ6glR+PmEqVnG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprN8YACgkQJNaLcl1U
h9Ceuwf+Iq+SXWKCrGqgLo7FIpwlxYm4eSFayHN76AfO2qIIidBNQoJ7t7JYxAy5
nMZJE80T5515i60cCaytQ9b+kEhgvZS9c1C/It3/WGWApXYomoTNu6E+tZrRbyYo
Oh8gZftsg5tV2ovPqcLzScHtbDp347OY/f8rtxxPmHRxeMdXlkDilSPM4JSZ1o7k
sg8Tv0jU9KP/4Ui1D7PpDB2m3eDBQh/WQ7RxWd53FupBDNyJ0z31SgzUVOulbEEh
Sp/FhmIHOOhF3tlaxrntmaLH/8ytp+EmviytFEBhbvawq8KvNBSIAcdHNgpgb3n/
yTnE5BEkoyrDiTH1X4WCpTuJUsRsdQ==
=KhaI
-----END PGP SIGNATURE-----

--LaRZ6glR+PmEqVnG--
