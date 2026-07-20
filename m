Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF86C41735B;
	Mon, 20 Jul 2026 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559317; cv=none; b=Er1YWemGkdN4dpa/KCpqzJ7dlX/8a8PceVeNYKibZdTlRp1kue/db+5G9nC7ZXNcaLqomq2+Qzv1zL2gupxExIczMkvzkCFhe004s0brelqGL8VF10p9Sw2Ycu6A4kYIkALNWCRzija0fKpZVyKsu92cFbg2mErPNmCryldVcME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559317; c=relaxed/simple;
	bh=ZlDFJ+KmnBf4EjppuJGOqWUpgtCBd/MsGzRlmJo/2TM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pqifw3ITSRYleMIRobtmFc8AZPJnqVj+a2XJyXncGh1a8CthaUabAsBGDr2dbYGIRI1EXpzG0q4zhxKABZ2pV2w5jQ0BfkTwzkpgRZYMRfFkCvZPG+AkqlH0NKw4rHwTEOyrYPc5c4qcNNfGU5d4zEE8t+g4E00nl9e/FR7B/pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=go+SQ+jl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="go+SQ+jl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B6F1F000E9;
	Mon, 20 Jul 2026 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784559316;
	bh=K8I1jZlw2oahWFbUL5LfeUBfX99WOwVTWBL3zD/z8vg=;
	h=Date:From:To:Cc:Subject;
	b=go+SQ+jlyr8Bdtw+PX2pSAEdgB4yzMuSbRZwRqD/OEnKZMKYhOTZhMEtqH4V5Gt/b
	 o4WE4keOylxoAUP9BqdUNAZv6qRsUKVmadHQFkL0KjUFT/FBp6bD8B5d/8grHSy7Jz
	 PZnVr4f1QtyepwH6iNEAzNt4Do6TF7edSO2j6SLdE0+hey51crlQZV83Nim9GpL9HO
	 9AWqC4lPqYpPzTyf+12ezw7Ce50+c0LUN7M+O08G5ZPbDDBlvkMxLMlrYUJCttOczv
	 nFsVa9Vn5jvuC/74Zt9suYWiZcGtN8s/k+/cgjJsfnn2sakfuYueUg+el37HIuMd8d
	 StI86NI3rkr+w==
Date: Mon, 20 Jul 2026 15:55:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the nvmem tree
Message-ID: <al420E2Rni5icZbO@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wNJLmHTLppWgo7Xt"
Content-Disposition: inline


--wNJLmHTLppWgo7Xt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in the char-misc tree as a different commit
(but the same patch):

  b13e7886c2e16 (nvmem: airoha: Add support for SMC eFUSE)
  d5bd22d9d2032 (nvmem: cleanup dead code in Kconfig)

--wNJLmHTLppWgo7Xt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeNtAACgkQJNaLcl1U
h9DEuwf+PPjht7pszLL1Z9buKdZRnCplYL3Nc1JPgPg+ZTbIql2N421jKL57QAAx
gfeB4fTEXTXhKT3zNU0EM1O7RBtflbUrszD81M2W4+ZKncPBzqBa0PLD9fiOy7EN
4T95W0FDVHPrOa6cl19hUU8rFv4U2FXZjNfmBW6fTRTnDMIcoOJop9F5502WGOUa
qtMFPCQAoKGpoyoTE+kdhzF5C6/udkZO6/844mwrs/wUvePIFYv/luS/R+8uTlLY
Px49MVof31FLhMG+X70fiO5nJTgzObITzf91ztZx1Qa+PD/HIn/UIjbpK/dgUmZb
kZMSForXmvnR+RG3u+o1moYDAbhllg==
=DSOE
-----END PGP SIGNATURE-----

--wNJLmHTLppWgo7Xt--
