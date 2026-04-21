Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86380249EB;
	Tue, 21 Apr 2026 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776778504; cv=none; b=HCmwPQltssdKl5yHq3/zJQmGZfVyCDVvLMMQMjQfv4JWguxddu5HHX9KnAVHqe1YhgNeI49iRwgpTfrCG6NVjiSI+4UqyuZg6XdkJWCzeWLg19Gv317jEdl1lCdXsrEMnvcSeZmlmsysi3FwHLcAsdel8KX4RheO9DgywrgpDL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776778504; c=relaxed/simple;
	bh=4VXxi8R3GdWg7Mw+8kl9Lx1PPyaY2jT+lNxEAsTO8ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiO01R2BjcYyUjyuw4JoI3pH+3IvNGaNa3BC036NBjHnsdrz/UECOqQK4WmYEMoHbfUq57EmQ80byBbvaKw0k19ZP3UTsCMOSdm0Vq4AbFUqEqW3tPOje+7u1QydVlz0FtOYYmR6c/GrNeaY1U3OjqdA7Ivb2z0SclFmEribBAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXdawNNK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXdawNNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FCDC2BCB0;
	Tue, 21 Apr 2026 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776778504;
	bh=4VXxi8R3GdWg7Mw+8kl9Lx1PPyaY2jT+lNxEAsTO8ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXdawNNK/0mKibo0HVTz1bLGxuYPGntCu6TioI1s6Px8CLodKp8JqY8NbnxEihv5Y
	 lDlI0UyvIxUuP0ZP/pqV1Cgz0fOQBt2CUb0T+AHv+dvor9Z2HMuj8O69L9l1uzO//9
	 uUdnBsxybcLhFc3ywfNGE7ETBFwqM9s1lQ4Dd+VDsX97UfGWxfth1+31T2Zq5/RC7F
	 j4tJqrj/DNMW32Z25itSrgewWazw9rWj0bw9WyxwkEma2rpz//KmM0Fmeao+P1VrKv
	 pHuEgk3CPY5L1e4MoIGToiik7aV+Q1/tEEZheSRlGXU1IMeh2sMiU89of0hRjbRLB0
	 O0q8tkawZPi6g==
Date: Tue, 21 Apr 2026 14:34:59 +0100
From: Mark Brown <broonie@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <2efaf5cb-abe1-4eaf-b269-bf303b7b8372@sirena.org.uk>
References: <aed0zrXLgMtO33NQ@sirena.org.uk>
 <c64e4cf2-ccef-4041-9511-a2dcddbc73c8@kernel.org>
 <955d11fa-a9a1-4956-8d2f-269ccc3f2911@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eaEE7TQ10kFjkPc3"
Content-Disposition: inline
In-Reply-To: <955d11fa-a9a1-4956-8d2f-269ccc3f2911@sirena.org.uk>
X-Cookie: Do not cut switchbacks.


--eaEE7TQ10kFjkPc3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 02:21:48PM +0100, Mark Brown wrote:
> On Tue, Apr 21, 2026 at 03:06:32PM +0200, David Hildenbrand (Arm) wrote:
> > On 4/21/26 14:59, Mark Brown wrote:

> > > I have used the version from next-20260420 instead.  The commit remov=
ed
>=20
> The commit is also present in the mm-unstable tree, I have also used
> the version of that from 20260420.

And similarly for the mm-nonmm-unstable tree.

--eaEE7TQ10kFjkPc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnfQMACgkQJNaLcl1U
h9A8NAf/SyzsnhpkJXPVsDYoWvd51t1jBljYUehMOGXAhyArsoLXSoEeJwjs4oJI
WkkDM0v1jbiZGIofVTxAT7q/vXPZV8p3xDDXB78l0gsuPEE8o3eBpEKtCx4alqvj
c8JFuG0YBco87kSBUDkV84bh84uZaAamfg+GUGPAmuLDhMmKEjgac/9kGhwflTEk
XBngqpwWNeXfVZrka6fgFjKUH+QILdR/xL2RsXO4NSUrdogrrLCfYXKv4XRl7EjN
n5MPnQS2bjIzNbPgEBWE1emayf016fwwb6aa0xuPZvJpJGjnz9+G2f1oIbGn/gdi
usJWKw4hSZYPt2F6J0Xi2W9ZuC04Sg==
=Sdeb
-----END PGP SIGNATURE-----

--eaEE7TQ10kFjkPc3--
