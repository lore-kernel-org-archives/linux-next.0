Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE15B32D0CC;
	Mon, 30 Mar 2026 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882312; cv=none; b=B8A1dxjr7iKa1iUIU/1IIIA2kVMTTrScfSPD0g9ZaZBNYVe9NvIQcU81NSFHd4s6dHDsdw/HdrZSPOIAmuUL/xtVTvSPBwx9xSzQy7egGPUh08mmPOZB9ujE67DRhoFkEGoMd5/K8OQDIHFkJv90pAxQFgzfCFuUoaAGFkkODNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882312; c=relaxed/simple;
	bh=QMX5CkmfgHup3HHE7/ogs24SSiy+sZrvRT/alh+kgIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPco+Twg0AV7srb9UNjHeeq4kBwOP8opuJxE/PrQDZHSlDa0sUk1YpF/7ye5Y0hO6cE5orJXL66byuKrKaKzpvxMhuP+RJcDZzc9XiDOfviM2shf/wn7jmaLkKKpILwXoZZrOxHHnPk1uR7XSNSJqxLyEQJDAS6yiklL3YRI0Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckPBKhPu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckPBKhPu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605D2C19423;
	Mon, 30 Mar 2026 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882311;
	bh=QMX5CkmfgHup3HHE7/ogs24SSiy+sZrvRT/alh+kgIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckPBKhPu9igZ6n/29EpA3GQpbxaIBLHq2X5OLXijOQAyG/Knxsi5Gwq5zYR98N0Mc
	 5a4wQNVkvkWFOXF6QcwtP/onRYnMW6uaf5JvsHn3Sn755QOqEDXkch+uq+kiXLJrMs
	 UvTe58dW7RXa6YjMJQW+yn3bq5atfnuEjUNPZDo0RuSaLmtKLi9Iy6C79rCEpdfEFH
	 X1lLizsyq5WbGvaNHVlOLSwU2Z0sdjtQfbtKw3XJL6FWhpsyPVtra9Y+WJAEldJXjv
	 3XbLAifnhbOqij0dLspfhjDz6SEYOxw2ShdbdEZ1IyfnPcDK0UMlvMpiM0wB/dVgVz
	 Wedz0i3pw497g==
Date: Mon, 30 Mar 2026 15:51:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <c1af4c63-185f-4252-b280-bb20ce9047a8@sirena.org.uk>
References: <acbrkFFGPIVppK0B@sirena.co.uk>
 <0e1a5161-ca49-4fad-9ef3-640236c2600f@sirena.org.uk>
 <92f6df37-49c7-4572-9fde-3802c5535a2f@hogyros.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wVjSJClsAgK/cJ3m"
Content-Disposition: inline
In-Reply-To: <92f6df37-49c7-4572-9fde-3802c5535a2f@hogyros.de>
X-Cookie: HUGH BEAUMONT died in 1982!!


--wVjSJClsAgK/cJ3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2026 at 11:48:58PM +0900, Simon Richter wrote:
> On 3/30/26 23:06, Mark Brown wrote:

> > > After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:

> >> /tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:
> >> In function 'intel_vga_disable':
> >> /tmp/next/build/drivers/gpu/drm/i915/display/intel_vga.c:68:9: error:
> ignoring return value of 'vga_get_uninterruptible' declared with attribute
> 'warn_unused_result' [-Werror=unused-result]
> >>    68 |         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> >>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> > This is still present today.

> The fix for that should have gone in through drm-next. The version where the
> warning occurs in line 68 is ancient however (that was changed[2] in
> December).

The DRM tree is merged into -next after the PCI tree so that's not going
to work, and in any case your tree really should work independently.

--wVjSJClsAgK/cJ3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKjgMACgkQJNaLcl1U
h9AYWAf/UxvUTc7Y+qa2u6oCxqZlFLK1iZV0tBrvPf6umRXghezjQGk6UksE+Fr0
zvDJHOrW3vKSqY44l2Ci9y+y61uki59UCHp9z48Whb1kK2fPhpiXmYxn5Y5aGY41
GFp7KnoqwWFo8rgz7YG85Ko5G3DY1yprl/fumE2gD9CrNb3Wo+NlFodA6iy48Q+v
ANZOJdQiIOO4avql03wTwbefh5CrUb/zNdsOh8oQ7EcrZSByEsC//x+BTZc+uLlk
v121qsitGhBeWVjC5GmLzz9vIXhVyPWrx2CpYlgSGcZaN64zj+R/jSRlepjrwXZD
SvZ1/U7CmsNuiMsgGVL5Iu9Ndhfemw==
=rW6V
-----END PGP SIGNATURE-----

--wVjSJClsAgK/cJ3m--
