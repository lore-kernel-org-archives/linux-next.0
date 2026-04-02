Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F5C26E711;
	Thu,  2 Apr 2026 11:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775129695; cv=none; b=OaYsSrPDVJtTTXBgjEJeAWoDzyGhaCCRlX9QWDQno4hVsVpARaMqjK5LpPve6uo6gtH704VMyM2r72z9x9bHQc400E2CF5PpweAInmfpw4fHyhk41aND1qWV2bn4+ssFL0BlRIul+zr8wqKflFQ+K+9l1c/NgdL6jagixTuae5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775129695; c=relaxed/simple;
	bh=a6W4jON4rxT2DeuaEK/64b23bT0IGYA72RXps1TG1sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQVwRcJUuW6YViQe2cjm6x6OZi8mG+btaAexQnC0H/8+1jHxo4ve+cjnd7pe7Y94p8CjKEaIA40c/LCFbx+gljEhzbgG6b55BwcRjW7yNTrZ9+5F2qZOP/Svn5sMzzsrB8c5pp+jm+VpS3NQDyAErA+d2dwNNPFrn0rQAq/xbQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHP85khc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHP85khc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1430C19423;
	Thu,  2 Apr 2026 11:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775129694;
	bh=a6W4jON4rxT2DeuaEK/64b23bT0IGYA72RXps1TG1sI=;
	h=Date:From:To:Cc:Subject:From;
	b=bHP85khceAo7zs0UM3eIW8crcQuJ9XkJuVDo0VZkF803l7CpMNjCs8GaJxzaRpaVx
	 2Ob3MAtbjJQkX0yOnSVdwYMta3VozecL0BnQmefJ+8MEINxZo9HR+dyntAz5n8xO6j
	 LOgniqN2OMd6twoPKmbZQPhfv3xyE/V2c+5XOIwZoYLDQ16zwBaP6JeSRDTbGMzY7k
	 odcHsz7CEVSV5Th2PM48kXOrT+QBHKf5IGnjCRhZeoM6R/Ez6E/BR9fszSu/LbSKBU
	 1RKOakAOXiSWd054HLo3FdzTpDwH22LJdgfFLvI1XQ+FZNOb+c1GmwMr3j1SLFZmfC
	 0mvZazL0yPq8A==
Date: Thu, 2 Apr 2026 12:34:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the block tree
Message-ID: <ac5UWqRPp54d1bM0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vU2F3dGTDIWEFgKR"
Content-Disposition: inline


--vU2F3dGTDIWEFgKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  7a9ffcf2cbf88 ("io_uring/zcrx: use dma_len for chunk size calculation")

Fixes tag

  Fixes: 8c0cab0b7bf76 ("always dma map in advance")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--vU2F3dGTDIWEFgKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOVFkACgkQJNaLcl1U
h9DmzAf/R7VEnC4gqC3up/7vJ3hYosY+QH+VL54TGFlAP6tzGeikWji0njFdqBuN
Xj62weUreo5CLAnF6/RkXRLOUkYj8NAJc3X9FMWpZ9oXn6NuMODYLS+cQrezOXhC
MqzV5W9yI3w36Zf7PE4daC0edupdHw9lWtSO2pjwAaPbU+I81nIAl5zZVR0u7RHD
Y0VIFNA7bMWY7LiifyWUFNL+mMtdPhjqmO8S6tQD8uG4rU5G1cA9k9NKI5TrPeKc
hnv+7C5TLMmah2fI3ewRhBWT2svrxONefvfYFGV8wHtdSPqzSc2fnyJ/ut7bWcMP
iUobio6ygK8lFuijd2y5H8Z+f0vbbQ==
=sL2X
-----END PGP SIGNATURE-----

--vU2F3dGTDIWEFgKR--
