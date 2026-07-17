Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8794A37C910;
	Fri, 17 Jul 2026 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784295035; cv=none; b=nb6yTAq5T1rm2ijtn8vVuSAyNpCsqjkXC8CDOfDyRphkZUu9Ibe1x3joFBSJxBYAPtMQGEn38gZU/Lt8KOYvC+9qP4VxXkdPv/GSOreiL2VVedze69rmR3qrEbqKoegJD4aPR+roDNs/+4sg/fKuQZ93CgilpbcPkta5E0U9bjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784295035; c=relaxed/simple;
	bh=1rZrlx6EQHv0COFR73XSER2lRvS6omAYzIaFGfKWANI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DdPWrSWHaZlqX5Oq/gCLWWpu/G3/Hr+3fumLo4PplZAOkQH8RhlLSmhRyumUKz2j4PXi40tNVnAkJzKbYjWH8ITtoEaEOTaNmUtYChpxDc9ei9wMDG3NPVUjJJz2QhA1aGXcYtxyTLTD76a5iRqdcHwgsKLFGLCduzP019I/q/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgwB26F7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgwB26F7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8379E1F000E9;
	Fri, 17 Jul 2026 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784295029;
	bh=ZquvzOEIyx18euDVkktVSFUfTg/71xfclJzFcdCCsWU=;
	h=Date:From:To:Cc:Subject;
	b=kgwB26F782sYWHhUGKgksP+xhMW+9JqIOhd1h47TRPTWvn+7F+o1Os6X0TUIYn86K
	 CI8isCXr/HcEzXNpL134YQtOtJQH6kBivxPkeOqy4zDOtDMPAsA6jUoopggjHFLH8I
	 Qfhn/Jp+4+yyL0ASMohyMq6KGWkS0SMOL5Zt6frVcoyjKPLmxNae+nIQtFuW6GBblD
	 aKhc7H/2nT2SwlSGH9y6JTcq7pK2PSD2k4msExETJs3WicMUHN/0pQ/WePwZf0TRt3
	 bXXt8nIbydCyh2pbRhO8U8BYMA3U7P1loFHJrnveicDbIf2a6ynaD8KHveOK34GgQk
	 KkoLt784FvpPQ==
Date: Fri, 17 Jul 2026 14:30:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the iommufd tree
Message-ID: <aloucms5KlUfyCKb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MUJYuzvluVcL30HH"
Content-Disposition: inline


--MUJYuzvluVcL30HH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  b737ad0b96a6e ("Documentation: Update VFIO NOIOMMU mode")
  2406daf5fd3df ("vfio: Enable cdev noiommu mode under iommufd")

are missing a Signed-off-by from their committers

--MUJYuzvluVcL30HH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaLnEACgkQJNaLcl1U
h9A42Qf/fPPteFtoUhA/nR/YiF6JMVSU1GwLbW3j9cd863iCfyj3CjA8I250UyTV
quDAvaAlFzGYxgt4Y6TE8yFwEUJZZ1axQxf3SHXTzqQwpd7b3k+7HQTcIqTMt5iF
FCPo79IUYw3y4TzLeWYHR2RQJPaKvhVtZwn7nCo2+a9YJKVEB3owN/DVR8Q70dLG
IkqsaoK4N8m/bfFG8LByLdbz+czmKha993EugiQR/beYm52UayMEbJvmcmiPgtul
nOUDXZZz5LUQ51F9pmVwcF8u1nRIbVVxjcbJjsnjueoSTotsyWkcxsD00RNUJq/Q
3R4ls4TAqS9L8WP5HwbjIsZbVy/E0Q==
=89Nz
-----END PGP SIGNATURE-----

--MUJYuzvluVcL30HH--
