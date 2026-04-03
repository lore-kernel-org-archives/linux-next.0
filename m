Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE753B7B80;
	Fri,  3 Apr 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217339; cv=none; b=RRGNhJeTUVSJdRMVc+w+9xaokYWnWLkrl5nJoYjPdwbI10kB6Sr8UsWwYOWb1LjoCMArlFugFIc61wTn64WJIprnxfl6O8TvvGQ53uKD3vJmizyQn7NywAhEEWvMVnh5itucfsVaFqbvvy4NUGxtq99JTzco2SFgho1GufNTsDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217339; c=relaxed/simple;
	bh=80OZcEzWAH/51fbV9nsM3TZDfERKtrEpMrXpiwCe28s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/WxIni/qbD3MV0zH6bfeDZAADZO4HODVtWos3rfDs6ubOt0sYPYA9pZrb9D/W1DMuXKGrh7FUTWNmleCr8EOXgUjrzWDFKlHHwcanbvxIGcqpxASSt3aSia8Qr1idYTe1pYfueA371YecVe9kA347bnzBAcqFkOfmKTFOoQ3Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/Ww9HXn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/Ww9HXn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76EEC4CEF7;
	Fri,  3 Apr 2026 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775217339;
	bh=80OZcEzWAH/51fbV9nsM3TZDfERKtrEpMrXpiwCe28s=;
	h=Date:From:To:Cc:Subject:From;
	b=Q/Ww9HXngJf8L0z/BsgX0RkqwhJnvr/qtqiFP3Loalqw0xuq42MGetEfEUy6MckV/
	 lMzb8979BR5mTlZCoCjK5G45zE7TUkSWkOVK0BCY0kFXd5YuPXL0bY/txb6hUjdfeK
	 4jbIRgrXFZ0M5oQHdOTelMkJ9XdTFw4piqoOVypYNSPQdTK5iHdV6dAXqp98TV1kYq
	 Ygdi8oUr5pqOmOJhw8C9fAvJMEJTQj0DA97yGxr0qq84ByKdm7W99qJxFk1CCLdOLT
	 BE3T6EPDpKu14Dm/iMr+wOZVXpgHNt1UweQ6fRvvyHoP1MqnohdY54TvU3mL+Ny1o0
	 xmjCSFokbT2CA==
Date: Fri, 3 Apr 2026 12:55:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the iommu tree
Message-ID: <ac-p1jdY0k1VOkMl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OsY0mkKLYiJXYwDB"
Content-Disposition: inline


--OsY0mkKLYiJXYwDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  cc5bd898ff707 ("iommu/vt-d: Block PASID attachment to nested domain with dirty tracking")

Fixes tag

  Fixes: 67f6f56b5912 ("iommu/vt-d: Add set_dev_pasid callback for nested  domain")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--OsY0mkKLYiJXYwDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPqrcACgkQJNaLcl1U
h9Cx1wf9EnMV3zDOWJVXNBGS/fYEBGKyK7FEqBGWGX6XZbQGzOKqhmx7mR+0qgKY
BAvTvM5mqLpuwIvCLATYApz3/H5h1GYmQPbrVUZEvX3fliEA7HjYOQgWO+D+WCUn
Ux3Bf6vnooaD4V1bD+i4K1pLHTtyXOMI0bjKALXJfiwPvLQ4yX0jtrUeGVGbF8l8
K1iNNioZxVEzomG/f0tSqvxB8v+f6HkDqxeEcqJ7DeZrt1EbbK9s1LEX/IFpbPWz
VSkpSVsCEOLrWlxG7fjfwwQ4OPczcmYQ+oMH11Z+9r5exMZ56JAqE9IoYLzE41+C
gSXRP9gwTd2OyXSPF3fANcYBCE3OFg==
=UODV
-----END PGP SIGNATURE-----

--OsY0mkKLYiJXYwDB--
