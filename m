Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9083CF693;
	Wed, 18 Mar 2026 11:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834249; cv=none; b=e8B5CrDfE/HWAVjBd7Xc6IV5Wn5xDKxNJiqKWCpS3MavqENfk2uxe8r1qYTtDOvTZac8DtPcNMq0dDt/pCs9vtLefh1htrlA4Nj16ZU96Tqds8vuNQbBtSNgN9W9rMrXiquSxAzluaGfrqoh6ZBQa8r1fTU8+YwcuKrUvLlto/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834249; c=relaxed/simple;
	bh=vtscqD2QxGMOqmk0e3yhCckOXbfHRiiNqrPmZ0Jw3jI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ujJ2OCXpsfKbA9vitFaBrGrR250P/fWKD+jgQsn0lkFhB//U3qJZGU2rmdI7MLTe9ao5ZSw47HzRTaVTvPdOqIH4BGmSXZ0Oo7c1bPhVAplK4oifbx2VJpw/pKGFUG/xXeceM4kwdwp/nMfrU5fubViSZgRCrR3Z7+ATYqfc2NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfFzZZ2K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfFzZZ2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC33C19421;
	Wed, 18 Mar 2026 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773834248;
	bh=vtscqD2QxGMOqmk0e3yhCckOXbfHRiiNqrPmZ0Jw3jI=;
	h=Date:From:To:Cc:Subject:From;
	b=IfFzZZ2KTonQRtPJYHhlV3qaixifnO8ZScx9qWzOWn9mN1MpPQhZOgV/JE9tIG255
	 qCFNidtIzvGB4d0TLGVqqVXD83dV1JEitN49U5OTM5EAB9k2HaY80aNwEeIdv75Ka3
	 4P8r0p+LPhceBVUJ7NjZmn/3kOpXs4LSyewmkGLKPPGvUB3pix4u8wZadjxhxa2eHo
	 s8auUSch83/rnJ2ofZFOo9SZntyJhTCR2PnCAQaWz9yLeQkmSuzsJ+iOrC4SCqJQuD
	 WN0/Yf21OMUtjf5+YyUcl1IkYDDgHpnBJMX52EBCTd8Qp4vaQD3Sdd/vADUgW05GQ2
	 Cnumh40cN58og==
Date: Wed, 18 Mar 2026 11:44:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the iommu tree
Message-ID: <abqQBPG__RWan2RB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Dg6rfcaF4XM2mNQ"
Content-Disposition: inline


--+Dg6rfcaF4XM2mNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  fe89277c9ceb0 ("iommu/vt-d: Fix intel iommu iotlb sync hardlockup and retry")

Fixes tag

  Fixes: 8a1d82462540 ("iommu/vt-d: Multiple descriptors per  qi_submit_sync()")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--+Dg6rfcaF4XM2mNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm6kAQACgkQJNaLcl1U
h9AhUwf/ZBBvaRC/p40iasOQTFtM1HkDzdl0eaeTBvutY19E87UlLJkzBWW1K3DW
YdTaP7L9Z7fSMGppQd/Grq/guKwOg0bksl4f9fCgr0RKdaa0xPM8t19PzE19sP3h
fkHQGrTY82tOaeduwyxIx9IFbT8twUFtLqA1M30CKp9zixsXC9lwjgwtKBcBNLW0
fYEINQzljlKQcTo+O504MSTJNeXoLDsMl00wJhkX/S2NNSbArOfiWrX/iG4faoeR
o2j8k/S/Gvgv2/qu/zch+doScZPLAdvlchRymLCqUIycqBrDeU3noNRK+4pqwCbB
jvkCzlnkbDsJgmgwvOk4t3fbxIAarA==
=Nh57
-----END PGP SIGNATURE-----

--+Dg6rfcaF4XM2mNQ--
