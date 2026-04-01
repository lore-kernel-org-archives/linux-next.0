Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C163BE17B;
	Wed,  1 Apr 2026 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049670; cv=none; b=ou0Zevonu89MYAv7wrTO6XOLCA/7M3nReMYrJrSEXNBulghRh1qN9H1WGKZNv60gU8Od/vutUoGQf8zn/8uNgCSdaZWYg3J8OnLQb93ImCpegh7WI9KtnWjeBs1y10kft1WpuKZf5lG1bmluzRQEYy9W+BtmSRorkl7P60FUWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049670; c=relaxed/simple;
	bh=T7hTtrmfe9ZDnvSWjVlZZCMTJvib9NPN1YhQmgsEToQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XYDET6ZSQZGnA94MNjy6vgneVDtCjmViUcnsFbQ46fidazNR5aEqTlgqRop6xa+nJgSrw2/7IvhsNT6Ju3Uqlr7DZG1F9+fMNlRZNZ7FEECBnV0pwRcMP1o13KSjZjDmYA96Z7pYYC1jpHWubpM0Z3Yiqlwz/YJicbsEfH4v/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECv+/9Tg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECv+/9Tg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94801C4CEF7;
	Wed,  1 Apr 2026 13:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775049670;
	bh=T7hTtrmfe9ZDnvSWjVlZZCMTJvib9NPN1YhQmgsEToQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ECv+/9TgP55Lh/Lr7DlEgim8UfK3tmMtedZnM8CL/rbc6MlaQiTjLPfh+iAxXR8Yf
	 1MUMWyotcSiDV+N3doikcHTu5nO1Up+Vkt4qtzwqy8DIy6NuAc6CQtSIsNpvxyx9OV
	 b5RPsV4vpMshOnSxSNVsqBaZ/Yv//aX+fcZeWnt2dl9vJYTdrwFdK9xPTT6nVNCEMw
	 5j2Pf0hxPrXvhFBS3coJuX57IxdLDEHB4/7SOCBp9PRhOYq5g3Zt3cIzX0s2k0jdfo
	 kh5qsH7pEPFTGC1qxzp9ZG+sa4YUfpSGdXwy05ARW+QqdFHpa8ih5jbTIV3zuHMSwT
	 EV+fQStjaXf5w==
Date: Wed, 1 Apr 2026 14:21:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>, John Groves <john@groves.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
Subject: linux-next: manual merge of the cxl tree with the nvdimm tree
Message-ID: <ac0bwb8BPmZ1_aoT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fWlTm3P0gAb6Jewi"
Content-Disposition: inline


--fWlTm3P0gAb6Jewi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cxl tree got a conflict in:

  drivers/dax/Makefile

between commit:

  d5406bd458b0a ("dax: add fsdev.c driver for fs-dax on character dax")

=66rom the nvdimm tree and commit:

  39aa1d4be12bf ("dax/cxl, hmem: Initialize hmem early and defer dax_cxl bi=
nding")

=66rom the cxl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/dax/Makefile
index ba35bda7abefe,70e996bf15261..0000000000000
--- a/drivers/dax/Makefile
+++ b/drivers/dax/Makefile
@@@ -11,6 -11,3 +12,4 @@@ dax-y +=3D bus.
  device_dax-y :=3D device.o
  dax_pmem-y :=3D pmem.o
  dax_cxl-y :=3D cxl.o
 +fsdev_dax-y :=3D fsdev.o
-=20
- obj-y +=3D hmem/

--fWlTm3P0gAb6Jewi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNG8AACgkQJNaLcl1U
h9CULgf/aDFmQNtlaW2RLhxPmb3PyqnAAhmpl5CAyJN/VyICiweTC8Ax33xrJVRp
ZybBhYdXWsE3R0E4J51s7OuI7NDONVjo3aZxCydz+1QnqmF/ipnW8OJVqtgKScXt
J0peNawq8H40k9sOJaEDDynej5b78SgbJzYnV4rR7Sunrzab2aU9xJoyBEFAQ5rX
Qf6Muf6sIkg56L9241sTUU8qslUqf12ot2UM9yXmlGwef9QxgHQjLAuUhrj4bHbp
UwveIC0UDuYwMIo+7/pduE292Uef7+3oZWB7ZmMBQiNjenocj9/77jDAVsxc3cJY
APFDNlUjYlJPoHKfdWMv/EVM8LbLCw==
=aZWN
-----END PGP SIGNATURE-----

--fWlTm3P0gAb6Jewi--
