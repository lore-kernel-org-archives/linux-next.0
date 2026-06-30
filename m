Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9FB383983;
	Tue, 30 Jun 2026 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814690; cv=none; b=am37+X01nWLiT/L/4f8Z/3adwMKhd9OxmWsYcNgkrNQ/LXX+wiMjvrGi8nsK3E59fncmnuUcdIGGdxHw/X+Eh3cXT+rNs5ANAk2flhLEOEM08TYBedtLnsz7JYyr5LbWkp3xeI4r+1dsx17x0GubY6Cg7OMuQsuqu7MWgfiKVhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814690; c=relaxed/simple;
	bh=wOFgyVW+mFV4u1Mgj+ViC9dWe76QPfT6z199p0Ty7Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PiMgleIISZsCNZuRKcC//a5TnCK7UUqBCT5fbTjWhtfAydeSWASp6p528cBaH5KSe1gXPbFpsZpXhMfbw3ovn/JRsa8QTpa4vTrCcrqZcXy3+HVeAWYjYVv3tphr/qsCldtZ4Kbj5h36XM8rc1wyFpktn2ubhebgx/BWXtH0kOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFpeJydE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFpeJydE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7921F000E9;
	Tue, 30 Jun 2026 10:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782814684;
	bh=0UoXyJSh3afJqhKqJSCh/o68Vx37FBjHGBy6/T0wWFY=;
	h=Date:From:To:Cc:Subject;
	b=BFpeJydEc+ZhCZB02x9m21QsVp8JWxHgmL7zRqqU/BJ8RWbYY62+G6UxYamlltLma
	 wsvP8xvzVGAwCHXkU1PhXaPLFXOqBjcB/YbyhlgtlpwLFrnRIiGwk+BoI4jpvgI3wI
	 scQ2bMJZH0XbKOxgQTAFKlmnVE8LBRu18DsAP7y9lU0ph4jFsNKfWZjIZRAvSQR0cB
	 7YaMi3DnCKn/LYJTx6bYkvSL0C53nf2P9uEgGi2Lihr3HG/KEVAtsyVC0gWUCLPTGf
	 5GZlXJOSurrJenyCuDK2njCUhpEJ0petEJX3/bkoageV8T4PamLtX5eQsg7pUSasJ0
	 CKd+pQcJ7jF3Q==
Date: Tue, 30 Jun 2026 11:18:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the perf tree
Message-ID: <akOX2cfUOK1rRbu0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ago+6XdL66n6U8a2"
Content-Disposition: inline


--Ago+6XdL66n6U8a2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  535c327f22a28 ("perf python: Add LiveSession helper")
  4f093d248b148 ("perf python: Add perf.pyi stubs file")
  145f6bea48134 ("perf python: Add type checking for parse_events/parse_metrics")
  1bb0a1721f3f1 ("perf python: Handle Py_None for thread and cpu maps")
  226e60c35ac93 ("perf python: Add config file access")
  2b8aad745c248 ("perf python: Add syscall name/id to convert syscall number and name")
  6efb7ef71b226 ("perf python: Expose brstack in sample event")
  1b3460930fcda ("perf python: Extend API for stat events in python.c")
  4d97f00572c6f ("perf python: Add callchain support")
  0dd3f949cfb58 ("perf python: Add mmap2 event")
  b81c05a559ee7 ("perf python: Refactor and add accessors to sample event")
  beed2f88c2d7b ("perf python: Add python session abstraction wrapping perf's session")
  f46938e02fa6c ("perf python: Add wrapper for perf_data file abstraction")
  d8da1ea834a88 ("perf python: Use evsel in sample in pyrf_event")
  3e153b92b6e88 ("perf evlist: Add reference count checking")
  4d7018b55734f ("perf evsel: Add reference count")
  7e7110bdf0e37 ("perf evlist: Add reference count")
  ca42447bde058 ("perf data: Add open flag")
  3d295e4e6974a ("perf evsel/evlist: Avoid unnecessary #includes")
  6a7ac633a3e8c ("perf python: Add missed explicit dependencies")
  bdd53407c817d ("perf util: Sort includes and add missed explicit dependencies")

are missing a Signed-off-by from their committers

--Ago+6XdL66n6U8a2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpDl9gACgkQJNaLcl1U
h9APqwf+LnowFIZDznxcQ/RXLq/l51jnR+NqMVEARaoxAPviBavzwYkwsPHoFANz
B5xSuXTXRhrEQpnG3LoaKnKDnExnxeHghtbUde2VjZHHicfMvnD78nQydf9f35v/
H5loGZmaIPXrC9/zn3bRo1CFMQOTOQlVW2MFHrlxa/ap7/wbu9bOUnonvks2Ariw
n9gJaAzWO0frzh1XrdJv/UwLB1S/TuMn4/5fTx3nKWDZ1V4dT+yD+NFOvXrAcM2s
gXpFstRyfRut24QBq30iT5ldxqWP3P6QHMSq9VESgihtWcw9iRyiL3EtwS8U+jic
eIqETRVe2xnyz/5mMfhI0C19HRbrmw==
=w1Kj
-----END PGP SIGNATURE-----

--Ago+6XdL66n6U8a2--
