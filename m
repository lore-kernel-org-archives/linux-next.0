Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38CD409108;
	Thu, 13 Aug 2026 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623231; cv=none; b=Dr9R9qhWmud64DartGHYbjg9jLzXQCGM54VFQjKIKE2Z/ePl+x1b17T2x8JpvvGrcUkazr1CJ9o8hjWmePkCbBmkMv6uxIrc7Vb76WbADWRUjuV6YGal9hJVZOXpL+wwRXiu0Jt2yOLU1HDxFvEDpQ92Q0aBhl2WpKA92epv720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623231; c=relaxed/simple;
	bh=7ti9ye/rr8ZUmR688uFivf58D6xDh6SF4ganWxQMZkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPcAogrsaaQxRjQP8dmLE9/Wy54/C9Ck6Gse/ZeADfmS2eM9mJ6ru23Hs/SuznkYCX6GetQEZaH/4Vdi9SBzbnaAreXi68tSPCYurmqG2k/3vfawpKNaxE5sMFAh87qvGkyh6uNfB3rTGv5L5PcdzvDO0EjeMswbim6D3Ty3hSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cM0fokCs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cM0fokCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648421F000E9;
	Thu, 13 Aug 2026 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786623230;
	bh=2fiPE9V6n+xwfqZ3dmnGu/61qGvMip5FRlMXTY8CiRQ=;
	h=Date:From:To:Cc:Subject;
	b=cM0fokCs2NAznr9FO8ad6SSGoLvZQERVtnwaLHKl2dqDI2/3XoPMqoZlRmQHQ7IpP
	 6p/pgwuYgW25zCjenQTt07wGnzwTk5Vv9gJ2trkTo2IurnZ1ctZ2HrquJGrM/wh4aO
	 ervogEeKd/012BX0mTuxwvSMq8SNomQZpCDaMcS9Z3APtyBUwjIo8WzSviaIwilJrX
	 KmUoNEJ4tadsTjUhhBv6sDxHXRGjlHpBVaS3R2yGxJcrTlJ9CY/0Kzgje7cKruM9a6
	 hK7qmHEpNWDbdfviC+emsThBhFOl/9ySib3ceSK804/KmptdWY37Tua9OY/v6/vvpC
	 nWTE/4JO3/N6g==
Date: Thu, 13 Aug 2026 13:13:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rdma tree
Message-ID: <an20-ovUZR4ctNJ_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D/7NyZbd9MvaY6GY"
Content-Disposition: inline


--D/7NyZbd9MvaY6GY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  2f96d52eabe57 ("RDMA/rxe: Fix OOB in free_rd_atomic_resources()")

is missing a Signed-off-by from its committer

--D/7NyZbd9MvaY6GY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp9tPoACgkQJNaLcl1U
h9A/MQf/QMSMwrfAMD5Q1S3Ri+Ghhplys5TJgg1VwqW02t5t6FQIuZ62/iSZ8SSA
NnvmSl+2zHUG/rX5DdXClNKZew+OnctSjs5VtoPX7H+/Cc4SFERc0RxMofJNXZdG
g3t/eueku99vRi0aUg4+iPHuYpZR/XslCf8GIeLFW9jlH1UTLhiUdz0T9i8/ccWo
pQXe2pEdeYDnPAU6yLbK10NTP92E2nZtCsJpE7h4qLEDk1kBzk8JCiYu2aBWCrJs
jFSCUTaUniPczISrJyFaRUoht13XRno1sIjadJ9ITkiHvO4HrhZhcihMisRi3pb5
JpPfyDXE8kQiHtkA0t+j+dJgHUIp2w==
=C0DP
-----END PGP SIGNATURE-----

--D/7NyZbd9MvaY6GY--
