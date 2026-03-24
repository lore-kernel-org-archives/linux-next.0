Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAE43F7E75;
	Tue, 24 Mar 2026 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358729; cv=none; b=iAu7gbXthcVex0jtDxtvxAj2TnTJI701BxI4UYGjuwNRgBJJFgjVxKYU+K03ntLixgKt905mLL4YHoo5OSpv76u2GBXQWANTIuAjeFAt7LGdNJNXbY/loyA1FmKTlnnee4yh3a4G7igVkjYUq26wSGAngiDO08qLGXvtmL1MJ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358729; c=relaxed/simple;
	bh=4cCMU4CAiRRlOTyF/V3SM6pVAGLLuRL6M6AlJ29XZXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I1aRSyDh9+nhkSshNwPjHLN2FmCISMGj4bHKK2CAsgNtLDJ/s6IWtyaFql6OdAnkmXQbSB/m1b39GUjrh+BIVmM+agEZYKpVUTnfoFXBJ/rtCg/f79NFyGYwvI8dra1ui5xL9B+pIIzBihzlvE2bO0J8mb91OPzXTXowGEu9lG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kxh7nnCm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kxh7nnCm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9848C19424;
	Tue, 24 Mar 2026 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774358729;
	bh=4cCMU4CAiRRlOTyF/V3SM6pVAGLLuRL6M6AlJ29XZXQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Kxh7nnCmUwokJx0ZeDB/UbOHJNI4cafqGmM+0C2qW+cJIgwhpd9nP8S+3ha7etNJb
	 a/A1njWDEjnrr+XGyXw4fvKUbcP/gg7W0WHaMlY63NEvUkh5qAHfgGpkkC51JDcUr7
	 TkjANZrrNGyWo00rRJvmnFqc2h8osUxgmQS/DYSEphe1GFYfoCKdhiH/X+mJ4uefi2
	 pdut7FbrewBE7at/e939V3/CW46SE19opQOcMXMY/FJe5Vu18Mnk5yHiOimwDwMFzq
	 ISi0NxBhyB8W1HJjfsy86AwycTs3jZHuBcWNUPBIjb477G4UIH8WkaG96nztKas/Bt
	 9RNU4cHkfd7DA==
Date: Tue, 24 Mar 2026 13:25:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the drm-msm-lumag tree
Message-ID: <acKQxkSqGoOTXhtd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ue+C+7HFO5ruK83B"
Content-Disposition: inline


--Ue+C+7HFO5ruK83B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  769874594fe22 ("drm/ci: add rk3588-rock-5b")
  6545c64843ac5 ("drm/ci: i915: cml: update runner tag")
  9878b138ab72b ("drm/ci: reduce sm8350-hdk parallel jobs from 4 to 2")

are missing a Signed-off-by from their committers

--Ue+C+7HFO5ruK83B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCkMUACgkQJNaLcl1U
h9Dqgwf/V6wwlaZInx2FidMdp79IPnzMTPB/e/juG+TZRMR7zfNRwR1l7xc9btJt
BRYOkpIWFDR0eXMWESastD8nWQ8LphYW+FD3oX3MaxwZMDPPVXrGUfuYe2y/FhDx
ZkvVn2g/DS8n6oTJ7f4wB5wsaoXgVb7yHHTU7IIqwzS+tGTwguWesPLhKZjENilK
qPAczHW1K4F7MozbkRgNAWJTl/hshmjf3fRgCYlXZnjEtGSJ+inqSCtxdmnq3tjM
L+Q9OVHpVuGe/GyIDdCNpCHVA/cKGh2q+eWQZgBqzZLeMbSje7WOTeTjE2755O5R
OTTj1YJnt+jOFisgCRxmg9CzLRjqDQ==
=l91c
-----END PGP SIGNATURE-----

--Ue+C+7HFO5ruK83B--
