Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F283724A05D;
	Wed,  6 May 2026 02:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034111; cv=none; b=oXfg2ipjNOQxNXdr0X+3aoqCItEsXiUdsRhI7rVApU30nmq/K1SyamIHpm+vNYkca752AP1/0OKcTHjGNVVVwEFJH8VET2UIPwwF4/zSTDqj8yumUTj71ebkfs2Eim9Qma0Vo/PmV2cO0ffJB1BNM0rSbMHAN57cKA0IljTRZs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034111; c=relaxed/simple;
	bh=OcOgUl6OUL9raroiwth1Kfyzyv80xzNmCAEBY2vsjpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/rqgvKMMj2OsV7N5QhXLmJlZ/Mj++pFDHRCYpkaKRF/LQO+WmNnNvsfHzXmdVDBW60GzBYIB/yAkL/ouc68m0pPb0hUX/AgIikLb8tqCMl2ia/zzQ3CBkG8rcr0ebCVgwIR8uedbHyVWhwpl552gGLUM4iGt4OFFlD4SXX6KHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOz2I7Hv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOz2I7Hv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C3EC2BCB4;
	Wed,  6 May 2026 02:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778034110;
	bh=OcOgUl6OUL9raroiwth1Kfyzyv80xzNmCAEBY2vsjpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOz2I7HvmOmOcVjJhPOB31jpkWfHPY5IenQKWAolm99lxyC3mnRkjh2OPWceCG4bD
	 rl+TmQMfpoFdlECNyj19Vue81Wwam6H6G6wgQ1Jh5LUzDuMTsuVMmLz89sBaUIO9jN
	 8e2L4wL9BPtvhS7BHkXo+xg0yg/FtTUqGO36RPQWBvIjuP7E2jou7+RDCmG80LMF/P
	 hVwqJBKl9Q7QKQ9yP5CWUlLOvqxdR0aIK1kR1/WlQE60c2bMLqN9/FRf+yfuiSHWLy
	 9O3AULjyHrV++wHcyt56iMn2on28aVg/4nqspJJupmbBSpFom3pVG3cpFBaoyLCqFh
	 vMgmzxb1HUQDg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 09AD11AC587C; Wed, 06 May 2026 03:21:48 +0100 (BST)
Date: Wed, 6 May 2026 11:21:47 +0900
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: omission of the nfc tree
Message-ID: <afqlu-wFE7xEuN36@sirena.co.uk>
References: <e06a424df9659ec00dc929be6f50ac51@kernel.org>
 <6d26fbb6-3885-47b5-bfba-6c84bcc42f89@ixit.cz>
 <afnugiRnPPMCIxO6@arch.a226c7d-lcedt>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UhkvDsnAiesekedN"
Content-Disposition: inline
In-Reply-To: <afnugiRnPPMCIxO6@arch.a226c7d-lcedt>
X-Cookie: Alex Haley was adopted!


--UhkvDsnAiesekedN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 05, 2026 at 03:57:29PM +0200, Thierry Reding wrote:
> On Tue, May 05, 2026 at 11:47:10AM +0200, David Heidelberg wrote:

> > sorry about that, should be fixed (rebased against -rc2 now).

> > Is there strong insensitive to use -rc1? In case it causing additional work,
> > I can stick with rc1.

> -rc2 is fine, too. Anything from Linus' tree should be fine, really,
> since Linus' tree is the base for linux-next.

Linus tends to prefer that it's a tag rather than a random commit from
his tree, but otherwise as Thierry says anything from his tree should be
fine (and a random commit is almost certainly fine in practice anyway).

--UhkvDsnAiesekedN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn6pbcACgkQJNaLcl1U
h9DhCgf8Dq2TDMWPcysLu08k3XXAgEB3CMwmQ009dJdYefD9RD6h6hH4vDokygK4
vPm4QffXTfwsc/9jQuW925bje0n/1VG46X67FslJ3FZTE2iqkpCkwQubI3vqkzSP
I03twjr8XJYws9+m84mZeAhHLdGIcz6J44kNbmqQrtPi10hfuUTmhjq/ay1YWhcx
Ihp4t34D9NoL+f1hInIVqM7BX0cm3cEwu/zX/aJhAYQkSlX609rsyZOkZ1LzKTME
CBg7Ne+R7vgi9LLeNqx45jBMOYqiu9TaeSlz/a4xZjaUTF5Sa7aqs4A/iqCmfpyz
4neQIGrzLY/xDcr8QJPfSUaUNHjLdw==
=Pfhc
-----END PGP SIGNATURE-----

--UhkvDsnAiesekedN--
