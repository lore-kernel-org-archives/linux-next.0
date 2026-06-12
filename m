Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC9C40627D;
	Fri, 12 Jun 2026 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284667; cv=none; b=EbBgwQcXmt9kqoN6uV7DkxNEU/niPibDrf+ug6OG8yFSUKNfaIErPzvUxsHQJt6NfzvDDJugfv1Esr5Z+fNJJgdxH2CL8iz7u/FCG9bInArVQVFrz8nDSgA9gMAbDf6uw/1YZZN/hChXrUxwIC7HLJwkfGydRTvuzm3yD9yayEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284667; c=relaxed/simple;
	bh=Jb79rK7cKAIO1l8scaol5UAJROBz8hOfGaJrxkcvQss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHvKBVkLM8t+Qp7TnwIEZHdAexOB6I1fjcloqBW3eLoCh5mQEKqPptkkrh/pWjMAmvFBagULJi1rzRVSJTGugjCLLvH6mXnWBy4BkBY+9Ro9bZfqOMq0HLEz3YZd20oOkfzGxEmWSqtMTM5SG5knpQqjw0HUeluJMneJh6aUHXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfmAr10d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfmAr10d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B121F000E9;
	Fri, 12 Jun 2026 17:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781284666;
	bh=xsl3f07TRYZ9DEHYNd5AVyXvxBMbwNWvFLlErGGyUss=;
	h=Date:From:To:Cc:Subject;
	b=SfmAr10d86a2wwDPOujWYco+H+gBuf6fJfpX45lD8eyFAz1WYB5wQ2DtJj/tBT/hz
	 buq7H1EW+7YLGuDOVCC4C0N7tE8OevTuv5RVC4SI9lj5nfSlq2p8VbK+7M485kOIjK
	 nEU/MiWnXl0hVP1GvyCO31vn76/zmkh0ibGSDJQY6pADgdEEBgyE/LG2UHdns9aPAC
	 UkEoiZNIfrTJFoJSlpG7RIAuNgovB9qXfmXRt67gn9bAjgw1dWe1svc44C1/aH7yBS
	 QBECXPy8PLf/OxjdJ/jm5Ad+MhoZK1WV1G3HbaFWQTBVOSJr5wJefO5numSTFb3fJp
	 ek/7ST3PSVHIw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id ED0101AC5AC2; Fri, 12 Jun 2026 18:17:43 +0100 (BST)
Date: Fri, 12 Jun 2026 18:17:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the iommu tree
Message-ID: <aiw_N6WA0zNLKUB3@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dm9kLU5M6q7zMqZe"
Content-Disposition: inline


--dm9kLU5M6q7zMqZe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  db50fb87015b95 ("iommu/dma-iommu: Fix wrong scatterlist length assignment in P2PDMA path")

Fixes tag

  Fixes: a25e7962db ("PCI/P2PDMA: Refactor the p2pdma mapping helpers")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--dm9kLU5M6q7zMqZe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosPzcACgkQJNaLcl1U
h9DznQf/TK1NPFrpWUUq3iVPdutSlD+08qSuAouyNue+8degBXq+ZLorXd3hGIvw
59pR0sNzGnR+dufh4Jkjotdhr4RSFiV6VLmCMLHb78IREKrAdbQ4f1vrq0hbGxQq
NZiTNoIeGLKAjuiLMat7TkUSUnBZEJOA9CqVBXlRd4RVz2veEt/9LCQ8WbiQUmf/
IavBty6Ss1GsZdhWYrB422pkY60noRDATRFCqV/4bwT/febGiHACiqFI6vXQqi0n
yiisa+ebAn+bEdX1Z7QoHOX7gWl0pq28b0NVIPFx8hvuWHda4T2pmxcxEVzmH9U4
b5Kb9XN7QcKh206L7Jr9HlAj2Af+DA==
=uj7P
-----END PGP SIGNATURE-----

--dm9kLU5M6q7zMqZe--
