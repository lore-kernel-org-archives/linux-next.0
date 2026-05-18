Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A6949659;
	Mon, 18 May 2026 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094313; cv=none; b=FLYjZXV0sIu071EmbDrN9uDODRmqvRH4oiA2MQXxl0hBE1huAWQuk3wRX5fx6Mn8yGgKbuzRmEGM0qQOkQLMe7bVUFz7d6hHsvvdOwo5Xpnezn37FfvkqZLCorzahWMJrf4zS1cZxDGMOBwvp+bSfQqqcu8+RFGtRKiAWuo79F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094313; c=relaxed/simple;
	bh=K3ARyEur+W+2/BupyQ8nom2844LcQOh2f98l/NjIRWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oGwtI37gz9ICD8KPOl2n6lvV7TdpwAy71/CKiY5a/To6gatYBE82sHmidciwX1LAwo6yuVdQn0zr1o7r70n+KiaVwO7tPielNQ6wI903a2jnwR1Oo1DZFeJgre3o4F13MUb2WpqolbLWfev9raQE6H7sd/7fq8crpYtNFbdYIyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfQo6a2S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfQo6a2S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485EDC2BCB7;
	Mon, 18 May 2026 08:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094313;
	bh=K3ARyEur+W+2/BupyQ8nom2844LcQOh2f98l/NjIRWI=;
	h=Date:From:To:Cc:Subject:From;
	b=AfQo6a2Slx0Z8WIfHfSpE2pMrOmXigBLrozUbDVLrKHccrLodiDj9Y53LS5FscjM+
	 /EBAwZ8VEJ9rDfkw40i4SoaqM/VPz24m6yOaJ9pO16aVq+NAhavEPOkyLqambctXPB
	 4V7VyUR82osm1RUcDkHSC1nIUOA/f95BdkP1eVbi2hA/mvRw6Dg0bEQkSM92RW7ISB
	 VAEbpsFkjHuMap1fOBUbxE+tcJs7dnx83UQtoFPqeJDTvRtlVOuBRNDm0t0c5+tAZE
	 m2c9CLPfJQgy+J4iOVNwTxbMnFpsbSwk/yz7I9mXPOOKCrer9jhlmKjT1S8VSuqfF3
	 +jlnzIkim/xKQ==
Date: Mon, 18 May 2026 09:51:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the bitmap tree
Message-ID: <agrTJZueEOL_u4e7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BJab7ZjbguL8h4HU"
Content-Disposition: inline


--BJab7ZjbguL8h4HU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  403750662dabb ("bitops: use correct parameter names in kernel-doc")

is missing a Signed-off-by from its committer

--BJab7ZjbguL8h4HU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoK0yQACgkQJNaLcl1U
h9ALDwf/T/Ko9jiy2cMtd7JbB0bWzAlYiyT+xCQllvaKTCV1yagWuCUIbb+UZATS
r8nnib3ktn8iI8P9KjSp4B756sBGDsNznAU0VWOGwCvkapkMM+5w0vN2BvTMFFVL
vbUYfesvybOL0ZhgXFfYGm4B/2c5R/N1AbO42v9JHqX8jHWOOTorSBBkBJl0LayN
OYHIlZckutpNtX4RuHkNuKaETpCUasa6DG84VlXc6qe9FAxF3GCe8pqUJE1KWZen
Xe7q7WY46cXAViz2ruUMTuO7GSRWdXUEeEDBP9lpp7vuSXw76U0HEiMToIsXndZW
5wgICr8COBSU94nfa5UoOlcCYaF1xA==
=tw/M
-----END PGP SIGNATURE-----

--BJab7ZjbguL8h4HU--
