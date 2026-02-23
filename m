Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF6314A9E;
	Mon, 23 Feb 2026 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771865140; cv=none; b=pvRES12VQMaGoixDhxzTtXkY0b40Zrv3B36TbN2IB2G9QkymtqHJ+eA7yFGvXvclOKcWhkVihyiZfN0TulyVkqv0f+y/GStg5g/w0dCIV2E2PCEsf6zPdfRtSGJbeAuwBf4y5cCK8MEVy15+B2jiqkmgk69kWup7oKVvS2dNRms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771865140; c=relaxed/simple;
	bh=rVr3dIHvhgefOPU3qvFop7ViANPhq0n+p8nBE7atE6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5DqcHqdk6QMHUpl1jhwFrGDoXQQeDVQrLAtkQvc+ziMP+sAQZk5o6lWb39oYPMVlxkwrotTz1Zy/qXO3plOQPJVws/ZqyVix1dJAzkiOkBkN+D5DF2NMbxla0P2DnY8ubSj48EOMboJ+n5I7gvrAtYDoij7R6LDVOVPGtIK1n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P07vsdkE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P07vsdkE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856C5C116C6;
	Mon, 23 Feb 2026 16:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771865140;
	bh=rVr3dIHvhgefOPU3qvFop7ViANPhq0n+p8nBE7atE6A=;
	h=Date:From:To:Cc:Subject:From;
	b=P07vsdkEa8adbVFf5yg+406Jp1gTjBlOQieNFt7YbPfuQUgq3saAwZnhu6rCok/qd
	 3xUrYnYFPUf3PVJBZ96ZgJuncQkyTg7S6kOvWqpWfqgQKMQ7YObVnlxnAgVCnhTIPJ
	 MdZQjKFA3WyA4PczZBraTJpEiZXighO7yf5tvauVC+3eW5pBJsLahjX1Jvecft8cok
	 QCsrEIE9pfTw3c/0ac/qmXR0FEc/XMGTNFl6iW4e9IM8XO+EzvO40iX1hxblCjObY0
	 qOAC9bRSVn1+TeaQ/0tAc6STso2CDK+Elo2lOr4v3INMA/drCNdsF25YN75sJq9BJu
	 a6KGJs9FPu6gQ==
Date: Mon, 23 Feb 2026 16:45:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the mmc tree
Message-ID: <aZyEMMrxY05IOSZt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aoiYoX1PXsGdcAiU"
Content-Disposition: inline
Fro: Mark Brown <broonie@kernel.org>


--aoiYoX1PXsGdcAiU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  00a1b09fee7fc ("dt-bindings: mmc: rockchip-dw-mshc: Add RV1103B compatible")
  50af1aaea994d ("mmc: host: Remove unnecessary module_init/exit functions")

are missing a Signed-off-by from their committers

--aoiYoX1PXsGdcAiU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmchC8ACgkQJNaLcl1U
h9CLggf/UAdKi/Tshx9H9cz6QcgjlvR21+S5X+cOxqYjsDVi0cF8IMe1kFkAI+1C
WGybIOk1TzPsdbB6eTAQhXNrQAStNfB+A/RLN8yYWBbRf+TTDoLWgNgEmqjRAc6W
1TtLvVOG9zmulyitr2u0I8+GkWRMjg3lgZArXLYvlUCkLJbwAa1P7Txb+aVkIHob
G6JNooJ1S6myAuCKehylkXYVwJHBG5nyS31MAraBMjpeSpw3+F6YCAuOdXTomEPG
U5evT9QIQmIWK09QtpXbKNtgZ7vqXqRBd8zbNJa7q2KxETJXbgv7uR9dNU2R7Rvp
wA7WehWVZ1ZiPkQiB2xzaTF70ZUUUw==
=gfja
-----END PGP SIGNATURE-----

--aoiYoX1PXsGdcAiU--
