Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CEC3009CB;
	Tue, 21 Apr 2026 14:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781696; cv=none; b=cOADzY5ddANdExS25NSEeIVm+flSqMrlIuMqa2O44ahyf4Jx/W0RMqZf1W7XuC5xlJYj0nLIgRpMJH04416ZPd4xQrQKoRDf1uc0FY3JEeGjyj4cx3cE+jXhydCueLSGBRXDkhUbr/hjXknJPeAovzz8JEgk0WunBgvwwEHUqb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781696; c=relaxed/simple;
	bh=psS3dekwYwT/TNDsH+6uYZfQX+HLUihHOgtCBzowBI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5z/a9b44OtT69u/ewuH6zAk7wY6oOWEAJcKmaiofznOTbb6EurVm3AKaC6ZPtq3c7Apdv1ugFFknGaXO6oyuYvUhnCwGia21A1a+fWKwIhI4AnB7yVSzVZHc9LlqsZJHRZekAN+tJwfqif4DmZv6sckIeOoMxhxoLfH8MeD6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xrf/AyYT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xrf/AyYT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C40DC2BCB0;
	Tue, 21 Apr 2026 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776781695;
	bh=psS3dekwYwT/TNDsH+6uYZfQX+HLUihHOgtCBzowBI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xrf/AyYTlaOEN1sLvX7rrYwXPw0YggESAGwEWWOAT5uX5SGwKI0dC17hKZdSntwO5
	 ANuYUlmo4VVoO1A6GkwcNVB46FlX0LCK6+Tm0Yrci20FWtUhzsQMcI8XDfcHNU+8wC
	 uEI8ZvdbJNUDfd8QPIYhF1701THr7+Ne4AAcUH+ZzHBESGjqtu6SQuxPGwdK7CMp9R
	 rKq5IgwCtwYaBUVp2yHevD2qKZ/5Z9Cv+WOu1lakvExQUu8ckhiihh9jj+VeViQRYs
	 MG87+QB+azwZqCStiJI29X8JuWbTYpKJc1Nv4YKfzZIPyuhBYvSh24MSp53/a8G+qF
	 51WUQUB2q+1gQ==
Date: Tue, 21 Apr 2026 15:28:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <404f951e-41b1-4bef-90ca-e3a89a25c9b5@sirena.org.uk>
References: <aed0zrXLgMtO33NQ@sirena.org.uk>
 <c64e4cf2-ccef-4041-9511-a2dcddbc73c8@kernel.org>
 <955d11fa-a9a1-4956-8d2f-269ccc3f2911@sirena.org.uk>
 <2efaf5cb-abe1-4eaf-b269-bf303b7b8372@sirena.org.uk>
 <a3b85bc7-d9b1-444b-8474-91d0e7f2a41d@kernel.org>
 <20260421071701.641a4cd1f8984c6acb53a790@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C3PQ9dUbF3xDWy72"
Content-Disposition: inline
In-Reply-To: <20260421071701.641a4cd1f8984c6acb53a790@linux-foundation.org>
X-Cookie: Jenkinson's Law:


--C3PQ9dUbF3xDWy72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 07:17:01AM -0700, Andrew Morton wrote:
> On Tue, 21 Apr 2026 15:42:29 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> > On 4/21/26 15:34, Mark Brown wrote:
> > > On Tue, Apr 21, 2026 at 02:21:48PM +0100, Mark Brown wrote:

> > > And similarly for the mm-nonmm-unstable tree.

> > I think Andrew uses the hotfixes tree as the base for the -unstable
> > trees. So anything that ends up in there gets fast-tracked into -next.
> > Not good :(

> Always been this way.  The expectation is that a hotfix is small,
> time-sensitive and fixes something which is broken in linux-next.  It's
> exceedingly rare for a hotfix to break the build!

> I'll drop this patch.

Thanks.  David, to be clear none of this is much more than a minor
annoyance - I'm just reporting all the trees I'm holding back so there's
a paper trail for anyone who goes looking to figure out why that's been
done.

--C3PQ9dUbF3xDWy72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnniXoACgkQJNaLcl1U
h9CSlQf+NsOnNlMvvki/Ontn8RQJd5EDvXFUDJxVs+vxtJj5JS2avYh5gN4bpPLV
R02JX2gE6qmGKPg9Q2YenYQZi91KEGuSxzOVEIbYmkJUAYAFSAr1lhaAJOLVJpTv
pcLjvXC6DzKtJRnCiXFLHcvVu1/AVX6K9+ch3R92DD0Qif3gyn86a2bVmPgmSG87
YKc+jVT3dR4U5cpC2o1tJIW5IXS1R7SV3p5sbHWwi/ZoFLVvWaqkwcju+J5csof8
9165CcL1iXR8/1pyT+YBc2clkVj7mTGHB3Xt64R0Z4Fixxxqw4AWb02mQZ8fZNs8
x8tr/wy0LWGZDTuVsWyVcY3FUPN9gw==
=iCoq
-----END PGP SIGNATURE-----

--C3PQ9dUbF3xDWy72--
