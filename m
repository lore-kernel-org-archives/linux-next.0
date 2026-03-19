Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F52B3CCA1B;
	Thu, 19 Mar 2026 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922013; cv=none; b=tYsnFtxaPTNQtp4tcSfK/+iTUSmG7Xv0C4a+FlG7fHHLporVjE6D+PC8pi3J0nwNF4SievjN1xQ6zt9t7g6L3ssdB1pTD2UjeD/4cr/h3Tr7tkHBqV9kAKRa8OIWiZe5tX+Htvwx60jGKcYLbMXOy6OpJ/r87Bu87oi6PGmq3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922013; c=relaxed/simple;
	bh=JQKdG9F5mms2qdoEISVRDPgoN+JPGFqKtPBaD5Ajc/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nIRE4lDgn7f7BvvY5xOAHiMjn6GwsaSFwHJ0a50AAYDgeInKRkRhe5FZN/WIe3jsRtBYI3xbzEqGFLyu/HI3U/wvbr46TzVOxu8qmcX3reSBVKmARSXHbyncTFSpatCIFrfApgQHcDF1bVz5RWQk3psmEwgaB71TQOH8MPyxIKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tufgW4xV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tufgW4xV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA9BC19424;
	Thu, 19 Mar 2026 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773922012;
	bh=JQKdG9F5mms2qdoEISVRDPgoN+JPGFqKtPBaD5Ajc/M=;
	h=Date:From:To:Cc:Subject:From;
	b=tufgW4xVuidZybeXWttTNqnQfgihw5ptFcabFqSeC7WFUKgTAyJstgxuH0G3JwCfr
	 R8srUJDi7APx0Q5lTwcBGWn+kB5RTFSU89uhkbSPM4P0b6CgaxWFVZppg8YM0KVdxs
	 TIpIwZJElOePVrolJIW4Jyj3v7x3dslXeetH9Z4tOYnPwUbYokHd4a5nTGf7cGPpD9
	 GU4G80ToFNJlkrJv4NfaW1UmKeNF4p3whCFNPdgsReYpccffp915XCR9azo40rQ/z+
	 nzXg7AzcihfOIFFMsLxAdaC/swkU9nVmzimOD73aZf1oVb9p86ju4UFf+zEH4Nr7sJ
	 DpepXjMw/QQuQ==
Date: Thu, 19 Mar 2026 12:06:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the clk-imx tree
Message-ID: <abvm2dkPDDbMBUoG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JzCnwYv5g6KXAysX"
Content-Disposition: inline


--JzCnwYv5g6KXAysX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  0463762fa001c ("clk: imx: fracn-gppll: Add 477.4MHz support")
  3cbcf93329c0d ("clk: imx: fracn-gppll: Add 333.333333 MHz support")

are missing a Signed-off-by from their committers

--JzCnwYv5g6KXAysX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm75tgACgkQJNaLcl1U
h9DqJgf+Ordhoe9Sd3UKVRle6l4YcTtLflYRKFJsYlsM37UNwitAaXzCu709ivlh
MSlbvCbmlB9oDoLlMCZjwA9THm/9Qo1+CIiNHkZEOKNTzCdCy0WdqbLFoVqRrmPn
7u4mQTuyIo98AlJeF/COuNel6fXyl1WpFurbVO5CpDQ5hWp0yR/fEwQER2nxguS2
154AhHI73TRu5bZnZVCFgKYef7hzdNRX/TYb0SXCnQK1Ezpf947n3NJiCml00u43
ZMFk4mZ5PGVEz+AYZMdaRE35DZMKeeoJaNsjnex0Z3PByipaNwbeT0i8kddhZNWK
ydrofiK8Ee4aVjxXkb5ANcr3BrUN2A==
=h6VH
-----END PGP SIGNATURE-----

--JzCnwYv5g6KXAysX--
