Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70D366DD6;
	Tue, 20 Jan 2026 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917875; cv=none; b=qnT+D8zkSgbKXBxOS6Wy8zE3FqKHpnWdPZdhgBozdMKIg2bL3nQ7AfxjWBVCmkbe2UKKG6eEpetXHEmCGmWrDGwaiHapbGC5WB+VKOo7IPIH+601KkLxyKHwhfgLgqlgwHNAicAuhgbn1aDd8sB61Po87HZvJTBV6GYbANTXItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917875; c=relaxed/simple;
	bh=dwlZ1GZWZbF69eNYnxzyZsbj+hrUgLOwf7GF0nl8mMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rL8jYiYwt0pSAGQNpvuAmogKdMZYs29/PISVccxNHgsMHxVa9q5siAIJCCnuAx07F8Fh02ncD6fvzNuklLN/gOmmRGdnuisVX+8CpZykRTRV9fZFknlMTywCHixLdFZLixCrZcZ+mBRx3FR5RbGaCpTnGR1jMNW6SJYOUZZz46s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cu2RS5DV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cu2RS5DV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04ADC16AAE;
	Tue, 20 Jan 2026 14:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768917874;
	bh=dwlZ1GZWZbF69eNYnxzyZsbj+hrUgLOwf7GF0nl8mMQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Cu2RS5DVjCRM4iqL8oDAKTXzRj7SfCmzulY/kRSx5KeOFJz/PHMml839u5k5txLWZ
	 iWZG9lixfIAgDbTNilV3NRYcB7CjkXEr+EiIMga2Hx+1Rli/9qxv2dNphJ/lAAkKvG
	 Kk36Z3Dvp7glo5uWNoD2Zwfqcr1ryaNoScZfF3Bmy7XGP3KCTlTlAuYSSUBVVsQy1n
	 LuppkkPpD6ayCAS3Hui+9EKKzQtr/jL8iA1EIln0lqNQMhD6kmOyjz1yBgpTA+F0mF
	 1KSTwJDzDOZrqLSUQAZ602BpX2wxOcscnKMROdspcq5DuS8y492NBRoXcfL73/kLft
	 23tnuSr/s87mA==
Date: Tue, 20 Jan 2026 14:04:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the risc-v-fixes tree
Message-ID: <aW-Lb2iMAMC04IG1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ilpaSRLwFG17Af5"
Content-Disposition: inline


--6ilpaSRLwFG17Af5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  69132c2d4c118 ("Documentation: riscv: uabi: Clarify ISA spec version for canonical order")

is missing a Signed-off-by from its committer

--6ilpaSRLwFG17Af5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlvi24ACgkQJNaLcl1U
h9CMEgf/T8jCHS2GqqcspJZ/saJxqJ9yHWUuJejz3muUgktsR/oOtgSdd7zWkyhJ
TGSyoY1DX6qoBXCb5Wj4XXpTdhEQax6ubKUnaUistPqa4I1VLYZJCMIWF23amj/q
tFAHLKlNPXQgA+r7cs9xiyjin7m/YfaRj5IVV5xqcQYnfoowcQ8/KF29jqvTE9cW
GGhu6C/Aj6ADPxPYj2FOWamII5zhHu+zmbPgUxTNW7yY9S3ZJa2wOQ/XNs165hmt
rGM45hDrZ6adkxEjFYs5ZD8GueT87LuhiNd/L6gTAJ4eXgNdVScq3ifqbbZl84Vy
fYVbzJm9ceSd5yZAzuYLUg+HH0v08w==
=kAjg
-----END PGP SIGNATURE-----

--6ilpaSRLwFG17Af5--
