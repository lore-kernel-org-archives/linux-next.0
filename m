Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B074657C0;
	Wed,  3 Jun 2026 18:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513034; cv=none; b=QP6Tj4XeRJakMSEnCr8Wil/NSQyZmRlI6M1ds8+R30Cn4GM41QeruROdJ8qe8itv5MGvWwDbmsdM1JI78Ya7dPz4HzjzIcIIW101TXy7PF6qoe/qtJRogybdeF+PyPKmqG6ojFhjcZlVn0d3Yz/NgcG/Vh0zIIa6GLgvgzuIMFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513034; c=relaxed/simple;
	bh=IP7YneB4Ftgs7gRY0/aBKax/3ihafclIEJveIoHDSrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c6HX/VjFp7DC6KPd+W2qNRdal1Zg+mnWVVFsbGUvQlf8QsAfA/PfSTYRkq1wxxaJ+7A3Q5fd6+Y/777DqtdZrD3PcXzyKbeM4iH/n7dbcf5NmOfHCSwuSvLihV/fcAbF6zHr0SyQoDhd0T2002j8thv7HLlB8rir1hacSh5FYFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZsyl9Te; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZsyl9Te"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A8A1F00893;
	Wed,  3 Jun 2026 18:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780513033;
	bh=oSl5pynR8ZC4Ge5Do7QNDUi0SkVBxkJQJHr5wGzqBuc=;
	h=Date:From:To:Cc:Subject;
	b=PZsyl9TeRrsiihK/8IFaWoB0SH5ePTxaUXN/BY/N2KAOFONll7yZXG5LP4LTT2Sjr
	 XZjYJnuqzXSSMGZ90a7DnbUmRXtWtSk24iB0e75lis37yO9SYQoQNAMs0npDu9ppu6
	 4UDjL/EVcd6JamhkGNUreVHYaoBEFtGcNlIBFgedNskDBg9969dZCfuhmKtx9ZOQgS
	 M0ST6siUqs4pjYySO5q4NI36oW6ilVjesnSZBOKfFIzYA6wiC5+cvKjuar8oAuHl/y
	 C/IvqNRzs0BjdTykWobExy6tz7YMrAKD2JjC/pktObj6NZr97jcMybmmARlxpdgXE6
	 57VIo+OoNVZ4w==
Date: Wed, 3 Jun 2026 19:57:09 +0100
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vhost tree
Message-ID: <aiB5BZiDROMWJVYr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YJJWzY/Udq72Twci"
Content-Disposition: inline


--YJJWzY/Udq72Twci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  fe4a6de84b939 ("virtio_pci: fix vq info pointer lookup via wrong index")

is missing a Signed-off-by from its committer

--YJJWzY/Udq72Twci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmogeQUACgkQJNaLcl1U
h9CPnAf/dus7VPE9qPlIN6a0ED8av9bJILlX5ahJmvxlLKYbgvJMWXseJ3rFtksl
Gxqlz8FvjxFxDqlZ8tU6wzyEvjaBbBXexfOgc8xxlMaHKX8f4SSuWzaizIirjL0w
q566oxk4x2eYiNB61gd8+usGMbQ1/GzdBsCSVsTsTIBGPoDrYPHXf2X6WtGYVa3M
xGhjgOReMKDrYzairWkSqlfiW2/ck1tylhy4xc9m81guKK7fiGejKvfo1968Xe5m
Th25flmL22AVSiQSyEykXk9SwICihsz27eQaf+4LkpXuiLsA1FVAEwxjdpl/7J0h
11R4jVKpatV3WblAXnk/8nUjRnDyUw==
=cbjx
-----END PGP SIGNATURE-----

--YJJWzY/Udq72Twci--
