Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C19E288B1;
	Thu,  9 Apr 2026 11:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775734040; cv=none; b=D2veBADCuLQjVkB6oyB8bv8YA08AwUWD/UJuL8aW3t8eyuWqbhPSK8o9LQ5GepAUFGNvXPr5IdZziLcrQvD7TnJ8NzQNlnTrlDsvcH85d8iIFTn4sogcVsrm0lBOTsMRajbZfTtlnbbL6ujAquqdWpMZk6G+U1dBqQFXTSUae4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775734040; c=relaxed/simple;
	bh=eT8IVS+i5d+8q6bb5nP2DYk0pboS2NFCRCJkxFuKKcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ap4qwIsoflKT78OEcKzpyMwD2q2awTS8n7he2f/VenwB+UzGKqzSyjEXubD35uLFOrjMn+P63V/1eae6p3eQ7HmvnHb5ghYoAPTmwPK2NvLn65tGdvdS7Dn+kPzoaJZSWhFNI+Yz0U77YgcBzM3D8LVqAWZo6yMU1OtF1iWHX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5zWOYv5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5zWOYv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13174C4CEF7;
	Thu,  9 Apr 2026 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775734040;
	bh=eT8IVS+i5d+8q6bb5nP2DYk0pboS2NFCRCJkxFuKKcA=;
	h=Date:From:To:Cc:Subject:From;
	b=H5zWOYv55MdqLfYochGvSPOpv8VeXr7WnyXaxeVuQLR8NhGVVW8+CvLiv0T+9m+h1
	 AyM+4eLTNyGdaqDNHOb9cIkB7phFf0AIKoCwhdhWlOz5sZ6bthYke7Xy4JKJXYIAqw
	 LCFfo8b2abpV+YQdG6TKsbwy0Q6HmcMGvmuSqGU7tgeQz0wt/U+I/1Qn6B9wBIis0L
	 JT1x1pmnq0QcKFoBGLvXugQ+cq7FMW3yu7XTiWWKJphre3c+029sL2/6l0ktzYR1eo
	 UUWzhxfoL/zWzwt6DZLXfQvvrO0lVYAejT1WWUg6DNFs5zxzgHf8U3ACupWv4jG7gO
	 u9tsypJarjK7A==
Date: Thu, 9 Apr 2026 12:27:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the qcom tree
Message-ID: <adeNFNx-ynFtR3qn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xeJCB9UhNq0qwtdg"
Content-Disposition: inline


--xeJCB9UhNq0qwtdg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  cf6e6ac63c62c ("clk: qcom: rpmh: Add support for Nord rpmh clocks")

is missing a Signed-off-by from its author

--xeJCB9UhNq0qwtdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnXjRMACgkQJNaLcl1U
h9Dm4Qf/VK88g6nmVlrgV6SLkutM41g6laxTF4WXPsOZJtKE8XscLYsTg05ovx3R
xaUXYqQL6tMCZ2HQaU6jW5SDs1Y48nuT67iaG6Fh6OPOTjSLSldVC9x+5tYgIlDb
7NTtkor8xLYE+9qxQPMj30TLhj1yS0RCU/+PCYuBbUqCI4ud6PGHBgR2oFkBiTN0
+PFvVJA94d+OWBInpP3QLPk1KalPQugBLpX1p8nPFzGmmAUcdi0/e8al17G7k3TQ
uuqBrn7bHhrrC21MCRfOWWvt4LAQq3w1PeSs9dnrTsA1KTjojdaU7YfX4FovK9R6
SgSj3Hn//d3QlH/+MldTLMFYycpOxw==
=dIMx
-----END PGP SIGNATURE-----

--xeJCB9UhNq0qwtdg--
