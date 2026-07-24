Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90984A0C
	for <linux-next@vger.kernel.org>; Fri, 24 Jul 2026 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852028; cv=none; b=HjGU0JvUEHcIib9SWt6cBiurrFcRfzAos/YckpGJc7A/ReSbT1wth4n+yj13e72arn8KaU7h9j5Q4pnvkolATZZc65TbMwJqOtl1c0U+X/bVZ3cRH8dJkPd4x+0I6j6F7u+a7q8zUxOPuysWxyYuG3ufoza9AcFI4lr1cONLWO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852028; c=relaxed/simple;
	bh=vV8SHVjTvcYQq16HYBY/lONPVrjZ6kNVzEGGtrciPts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMgLQl4dM7hzxf3z0Hd/IMAZmsHKQF2LsLkR23pGvzA5q/5/fUe5f+FUM++xxln46+wHbtOVZZQFdLddRIOunw2FNNNRoEasK+gHOILFOQXzgp5sw29W1hJknBPa80xF5quuk+Dx5JeUOc0yAErADahDTYmuko14GJFZnKdPVcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dY1l+6xN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dY1l+6xN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9DC1F000E9;
	Fri, 24 Jul 2026 00:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784852027;
	bh=vV8SHVjTvcYQq16HYBY/lONPVrjZ6kNVzEGGtrciPts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dY1l+6xNcFo3rz4Dt3iclqEw2EUP3Ft0aroaZGaGqL6/XjguFqJ+XWMcYGYWWfYfG
	 MNfgUiONFWs7JFanWwteVGQ+kVLIA6g9/yqBElieVwGy07CjuBsdurJY3iAFJcyaGU
	 C/qkzvreZslcgvgowrVZXciNyzkAakDqsTU0xfepRjyaV2dCVDqTLr7TtJD9ZMZW2B
	 ceze1n/B4MKPrz2a5tBh3M1memlPANA6Vxn0aIEQODZp0MQB9tJdsee3gYulDNv1tP
	 E17ArD9dgqxzy+Iu1+JINh3pn2fee9OW8j1/az4JtG/9DYjMSd0YB8I5S8v2pMckZH
	 impkerrA2eyRQ==
Date: Fri, 24 Jul 2026 01:13:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
Subject: Re: Semantic conflict between 04b177544a04 in drm-misc-fixes and
 0b6b1bb28482 in -mm
Message-ID: <93289e91-ef9f-4786-bf49-e93d91afc1ad@sirena.org.uk>
References: <20260722225605.GA1910198@ax162>
 <amFPJc1NQbuYWlSp@gsse-cloud1.jf.intel.com>
 <20260723212724.GA999236@ax162>
 <20260723160942.b58b065d771401aba117bc77@linux-foundation.org>
 <amKftG6NRZy0Ii2/@gsse-cloud1.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fKoPW98d3CeKyWXz"
Content-Disposition: inline
In-Reply-To: <amKftG6NRZy0Ii2/@gsse-cloud1.jf.intel.com>
X-Cookie: (null cookie


--fKoPW98d3CeKyWXz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 23, 2026 at 04:11:48PM -0700, Matthew Brost wrote:
> On Thu, Jul 23, 2026 at 04:09:42PM -0700, Andrew Morton wrote:

> > I'm fine the drm people changing things ;)

> I'll jump make a DRM change so this is all worked out when it gets to
> Linus.

So should I drop Nathan's fixup then?

--fKoPW98d3CeKyWXz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpirjYACgkQJNaLcl1U
h9AqhQf+KthYj9FPBRNjt7aix5PlE9HA5FGCZpsxTVHHy1cvEyiZw/wwp9hNVUTe
emIcdoj3CNZDT5pkVttPqtDC2T/TOi+CSQ4oA9tJjENnDXAsT/riLdxeagqz76Vo
hkwo1c3ixmlItxRnTmPAu2f7fK5WpXaJS+ra6FUmyv00wKd3nwqWG+Bk5xNUZVLU
z3sE4+IlkU/EXO51fH//NX0bqW77sLFRr40gSDzAITZmizC66LIXf2s0SGWRtJlE
nhYpApQ96bL9os5zg3RP38naQQa2ri5ibgSsQ6XAVs7L7XIQ5E0lNmwjSOl80BQu
fVPDJ/W9/bQkgUEFFfxGmM5eCiIBqA==
=lo9P
-----END PGP SIGNATURE-----

--fKoPW98d3CeKyWXz--
