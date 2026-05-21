Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CE6368D70;
	Thu, 21 May 2026 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379145; cv=none; b=W8BvL8ALXVaTWlLtahfznFFNhiirg13MwxQ+W44cQiz+/55r7+od6EyeqlBW7GGDpIDWnwBEcc0xPP+93bNLxWqOGADj8cVCLkhWONQkcdxdDT5csPbf4uAk+GwTCRBdfy6CrU6abt2Fpah+tclyJHNHs2HQD0WFXmxZvQt0vos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379145; c=relaxed/simple;
	bh=43KZMaQuu7d1OCnfwvqZxbWPEYa/FQ8sIrmIc9mcSMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n43WCICgm7+JHAQ31ey99FvhJRQf5xakp6bke6nn3WyPZtesK/wRAVd0bk4VfRUsFLhdrbe2f/HIG0HfJmXlEruXINEbJTUSZRqBj2avjS9kNoRpSa8GFm6ofUDowscjPOv21T8F2iukqwTDzlv4sUhiNkG7oYszsdJfUKirP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4XkzU5r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4XkzU5r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50E81F000E9;
	Thu, 21 May 2026 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779379144;
	bh=43KZMaQuu7d1OCnfwvqZxbWPEYa/FQ8sIrmIc9mcSMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O4XkzU5rK8EcB7en1JfNp8PhptzmBid4L3vYA6lp26KV8WQqi2DkB6AivI+XzJt/d
	 rZgw+VzRbihF7vliXiZiVAykpVPiKjjsBFAmBqj2Wb2bUiWsmJkE8Xb7qGJZMeFJuy
	 y6lVQqxtUZnvCNywLyFPFJIkdJRFiAVFIh7vzXL3x5H0Am/ebU8rj2vxyrOSd4/V4b
	 d8HvGbIUhDS/Y4F7AAPpLBHy4G17YqcGFENuZrgbGN2XAk6KEOWkoHw/mlHBodtMtJ
	 XbdDYDaeA2GD6efSfj/HGqjevcZgbBdJaQqMTT2Kzpz1qQqb6MLQFbR8yjkXpg8ZXx
	 k6qndJRT3hs5w==
Date: Thu, 21 May 2026 16:58:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: acme@redhat.com, namhyung@kernel.org, arnaldo.melo@gmail.com,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	linux@leemhuis.info
Subject: Re: [PATCH v1] perf build: Fix fsmount.o build
Message-ID: <c5ede3c4-33d4-4974-ad5c-d55ad97f15b5@sirena.org.uk>
References: <e08366fa-5fda-4534-8545-5d446734387f@sirena.org.uk>
 <20260521153558.1421014-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uW7wFDQKA+2spdV5"
Content-Disposition: inline
In-Reply-To: <20260521153558.1421014-1-irogers@google.com>
X-Cookie: No shirt, no shoes, no service.


--uW7wFDQKA+2spdV5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 08:35:58AM -0700, Ian Rogers wrote:
> A merge conflict between:
> commit 552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")
> commit 32969ef6e3e19 ("perf build: Pre-generate BPF skeleton tooling during umbrella prepare phase")
> Resulted in a missed build dependency in the merge:
> commit 61da860eee07 Merge branch 'perf-tools-next' of https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git

I'll add this into -next tomorrow as part of the fixup.

--uW7wFDQKA+2spdV5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoPK8MACgkQJNaLcl1U
h9C89gf/YzvhJ0/ty9/X0dzyw5h5kt42l9Z9TPsagJIHCFFo0SmX3umYhn+fYxc6
o42L32L8IF1LADSUFA872Fifb9MTxz9S2CuR5TEADLcNAeOPa7zWvtJpuMMmfOrx
40EEzZuOxxebv590GfPTMVJeZFxGal1cjcNL6HutzCNCV32m4vPryTlnSNNbeK0C
vaAaoYjGBUgQB8DJRcVP5w2cHC3355POkvqOmc52SDYtwq9AOlzCcSYjuyPG4w4D
/oKebo6JyRtXC2TZh2xb+CZERR8bqA4qW3lwuowrY1oHmkoOnsi75ODlRyl7xcG5
k8PCEt7dXJyFA/LG2hpvrtxxdOWB0w==
=w8SW
-----END PGP SIGNATURE-----

--uW7wFDQKA+2spdV5--
