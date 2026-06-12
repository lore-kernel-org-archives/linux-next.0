Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D46A3911CE;
	Fri, 12 Jun 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284659; cv=none; b=Og1ZlTonGLjr8CaAVu45SwaiviMLDh73lzwRswDokqm8YDYPI4FbmMg6uCva62JVPvZb3z5Qer3KUK5mZB7Ud3YRdKTR05Q54AECy+up8SNK1WUxzQxG8AylGxmX74z/0lJmyxV4WWtUISAWMWlBqhUs82HQIiMD49zmku2t1Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284659; c=relaxed/simple;
	bh=vhvuwtbtUC3DJlBjSr53FqPAXQ/Fws3I2IQON8Dj6iA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SaNNSePB0a3okGXEH3yFaPTWLaPb6Sd/tkOVYTGZGYVY98ZRgYJsCODLQK0JoKn7K0vRl+S1yNqAh+ROBDsK1HL14Ajwq2IET27sSNQFPhjfjT5MFW0jGJ1NlQY7OCfteoEWj29YTTJsR2oZQQ4BvRvxUB7t3eUpEF+d+V7TsUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtsgHZUz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtsgHZUz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60521F000E9;
	Fri, 12 Jun 2026 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781284658;
	bh=nP97z1DOA0R6BAF3YzYIMZXaXtMJby7+dD8DlCmURU0=;
	h=Date:From:To:Cc:Subject;
	b=OtsgHZUz3gWb7DoqsyDoy5NsMmMW8E6X728hIXBWHfAyaGSEvLeb1ph4h5rf/JM1z
	 dSfLm4P0tOIuI2N1Y7uiqZDpxy37Zypl5LIgAn70So1G1wIt7LGkqjnhObSfdA1+7P
	 DIQJSvhtUmfHNjVWgzC7nnpLBdB5pp/Oq1Il+qxBJ7JvpLJXmOLKSHMNmq18sjVHy6
	 +DPcL6VR25U2yDvUNNXQrVPqOfVesmxdgHCaEW5s3D5iH/asnuS2A9xi2/XYeIhTM/
	 cS1lS5Cxl8oKKq48FWDjvs2F6O+MX+gxsxu08RVIJWJZray7FsoDtgfAnWdFwsUkfC
	 lh4VjhrTsfRBA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A024B1AC5AC2; Fri, 12 Jun 2026 18:17:36 +0100 (BST)
Date: Fri, 12 Jun 2026 18:17:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the iommufd tree
Message-ID: <aiw_MPAdee5HBXjc@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7HHwww71t0ONa2+L"
Content-Disposition: inline


--7HHwww71t0ONa2+L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  7c224d21ed43fb ("iommu: Avoid copying the user array twice in the full-array copy helper")
  6bbe55d4d6bc34 ("iommufd/selftest: Add invalidation entry_num and entry_len boundary tests")
  105209a23e1120 ("iommufd: Set upper bounds on cache invalidation entry_num and entry_len")

are missing a Signed-off-by from their committers

--7HHwww71t0ONa2+L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosPy8ACgkQJNaLcl1U
h9Ba3wf+MSGRPKCmCpVLj2+gDFR5w8Ckit5gLjqbND7fCfVnI8x9Cs4hefogF7k1
sVmzPadpL7V6UM1WYVoHGZ16RXxtuiNUCldVFvB0sfnS9AMgpgw/eQZPDgggTT5t
pozumFXeFEAhib96CpYBT+ppyiCEr65F3TFNaXvuhkUYDpJqcprW/xveLGqYDTBw
BedP4L2jkVlPFnATj98l62GGNUa9vSY921WSFJMTg7q3DFbka4ulPqy6we1NereS
IbrIRTKM8+EIKZksZQmLRvX+/9cRpmk6qWsjcOfDSggOQAjXGfxBv3zO+UW9NUrR
nBCXf3IZ2dmWFsPMST3HLRO3wrsVwA==
=GJmL
-----END PGP SIGNATURE-----

--7HHwww71t0ONa2+L--
