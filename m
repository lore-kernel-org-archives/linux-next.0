Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8DE1A275;
	Tue, 21 Jul 2026 00:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784592692; cv=none; b=JAHGUWGYrOkGi2JZL1cKP3dFOcyFDEFqKy/h+pGliXX3wEWYYMBr0Z/6aMxjTu1Vk10lznZ7H/v1SGHVpswTgieAZKIIitjlHtO9mBYSDWQYmaX7ZkB3PTOzgV0ixTU/gDr3Kanu3cz7LX5gnYc5oRrIdYzEF11wX6UP2SIV47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784592692; c=relaxed/simple;
	bh=k5b5/CyxiyJRoxKuqGz67MPpTu6Kz/wdYey+kqLSvEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OOi6VDxDfEvhXLCtm/VnbsxLVvSV6MPyZsdxIH492FIDgUkqN4TjbZg7td5FbfQObaeCjW4njcu8aVpx/xh9Arw9vKGxKuSivUXU8DVCl5R+EQSqLKyKTYWKXHdFPkLA07geBA9GnBeX/75fkax4j2NVjlGCexObXa1zKzCspWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcLI4Y/B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcLI4Y/B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C781F000E9;
	Tue, 21 Jul 2026 00:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784592691;
	bh=B55A8Q4D0J3nMWP0zYzNDXiCim+rglP6D2zMdcVHJ8M=;
	h=Date:From:To:Cc:Subject;
	b=QcLI4Y/BL1q3UaVIg2fpj2ySuGZZS+KDlU8sCzQYKhZ0KXedfVHGpEZkwxhb5wHyZ
	 Jiy+U+1hm1gbZ/sbn6I+EJ3hBsiMEWqnkG+R/il6MpntDI00tRJ5pOmgpP4BoSjZzR
	 0wTCrn0rtR6d1xcpkGNqlXMrKecZ/rZy7FqwpaOxOAzsO1zcYYYmTst/2ugMrXyF/b
	 YjrwMylZUM3lknYEZYAI6CiI0DXZl6U5eghvN0Tg7jbtObWq0gtwzNBXQRhxYf7L7C
	 bCykx9s78zvkXb7gk9OVkx/S1iqcDhyPg+mjxCGaukMrga8T0RNf6kiKELLRo3rXOS
	 MrxMFWgYiNxQw==
Date: Tue, 21 Jul 2026 01:11:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.2-rc4
Message-ID: <6d67fe1d-1e06-4e44-9422-8314e0000866@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N3+zlfa50M4KmsPV"
Content-Disposition: inline
X-Cookie: <ahzz_> i figured 17G oughta be enough.


--N3+zlfa50M4KmsPV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

We're getting the peak conflicts phase of development, but not in a
particularly unusual or remarkable manner - things seem to be ticking
along fairly smoothly.  There was a bit of faff with things ending up in
-next that shouldn't have been there but that sorted itself out easily
enough, and we had a surprisingly large number of breaks in the final
builds but those are all fixed as of today.

No trees are held at old versions.

Trees with signoff problems:

  ntfs3	(missing author)
  rdma	(missing committer)

Non-merge commits relative to Linus' tree: 7105
 6767 files changed, 287833 insertions(+), 107538 deletions(-)

Top trees adding commits to -next:

  1307	drm
  521	mm-unstable
  327	qcom
  231	tip
  220	sound-asoc
  198	net-next
  172	v4l-dvb
  154	vfs-brauner
  152	staging
  138	iio

Thanks,
Mark

--N3+zlfa50M4KmsPV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeuS8ACgkQJNaLcl1U
h9BerQf+LE75QESWY37J3o+Y1QziKUu38vJywB6BGCfzD5zsGlUMRo42WkSRiMa6
uGsbCi1yr+UTzLdAjcKyrK6XITap1l1+cQQBEzcxNtbj5Wpy6W3RXHF3sYYAYVFH
eonU2SNfjqEvbnj0wEyW65lNtA0vS19Dvqs0ZNm4xlVlECMgp1wuYTxWvMTaR67J
miapgCkqiAbMEglJeE9joS/ZuggiYiyOR2Q61C2rnrKktNGFCt8MTuzX8JI6NXJd
D61KaUAtj0e7qStzHYcYt1yaRc4Sp2QPNCVZtd4P1OqIQvolP0be1dbcxGiaXxD/
kpnjYZ7S+6s72vbmMfP+dYMf70Btgg==
=Ler3
-----END PGP SIGNATURE-----

--N3+zlfa50M4KmsPV--
