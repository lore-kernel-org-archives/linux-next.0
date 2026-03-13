Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5163BD24F;
	Fri, 13 Mar 2026 13:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408313; cv=none; b=u5Z+ktYFpSrTJ7+gnNhol1JsVQHYiRkv/DPuXsOoKMqyZox5aiewtArAeZtMSqU0RcZi5q2rwEMeemRJJC8Hpz/cNFbeQaQ24asNtreYkhfVReTYyPnSUNX6LpT50p4cOi7ko3jl2WOKoM1XO4WK0GVJ+k/x9tZiPpameMm5rIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408313; c=relaxed/simple;
	bh=7gJRlq1rnOd57mPTMVVq16U+Gl3uyhC6g1PszJdiCVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtM5c4BXsU8814K+ota3obZ+/DRLjPeB60SkHolAy1rvWuT6ehwsMUr4rVeFcd2+okQ00DxTIz0jM+8MrowOgOB/jrWm+UeVialLylBRa/anSDdcAvQkc4c03jW+z6jDjKEb19auieYg3D+OQastA4NFNQpK8UaYPI8vNshrm08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ar2BVWzf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ar2BVWzf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFC4C19425;
	Fri, 13 Mar 2026 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408313;
	bh=7gJRlq1rnOd57mPTMVVq16U+Gl3uyhC6g1PszJdiCVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ar2BVWzfczilJkEhRnc586QPHitr7DxL7qDDJIV5VA5U7tMWxYoaa9d1Og8uJmpn3
	 aYMuQdJgLyheBJj9XvpiEzP9N+s0HlTNoopd3HtV94sxJa8gP2sqy9tpy9AnBNZM82
	 1S7MFT0TUQcKan8ss1usgQ6RxApSbK29CXZvNSMCAjhntdP6ZRdUOYJxgeRs+rDB65
	 uWyTuwGwL+yIY8lV1D48uzuu+0+KPDJCkDILt3mtin7ZrwvffokAW4/Gr3MdyQMNCI
	 fNR5T9bg2xsKDtAlqCPxeKlk+DeIm6H0M7Oa4Nn9LwZhsQs8Mgxpg1jo8MRFYIGNbA
	 e99Et2e/uphTA==
Date: Fri, 13 Mar 2026 13:25:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
	"Souza, Jose" <jose.souza@intel.com>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <32a6beee-2811-4ac8-b7f3-50a0a13ff9f8@sirena.org.uk>
References: <abFpM1FHgzgARB88@sirena.org.uk>
 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
 <abGv-5kXSCtOTO8M@intel.com>
 <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
 <abHMaBe4Wo_PH4uR@intel.com>
 <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
 <b7f67081-7b8f-48e0-8f9e-bcbad47165d6@sirena.org.uk>
 <abNfbWemfOKGNrVZ@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yaHy8g7MUd+LpQX2"
Content-Disposition: inline
In-Reply-To: <abNfbWemfOKGNrVZ@intel.com>
X-Cookie: Monitor not included.


--yaHy8g7MUd+LpQX2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 08:50:53PM -0400, Rodrigo Vivi wrote:
> On Thu, Mar 12, 2026 at 11:43:40AM +0000, Mark Brown wrote:

> > The usual thing that normal trees would do would be to make a shared
> > branch with just the API change in it that all the affected trees could
> > merge and base their ongoing work off.

> We can work with topic branch as well, but the backmerge is not a hard process
> for us. We should just not have rushed with this patch to start with, then
> we could had put the branch in sync.

That also works.

> The pull-requests are already happening, so we should be back in sync soon,
> then you can re-enable the branch.

To be clear when there's a build failure I don't remove branches, I
merge whatever the last version that worked was.  This means that every
day the merge has to try the build, see that it failed, then I have to
tell it to merge the old version, watch that get retried and then carry
on with the merge.

--yaHy8g7MUd+LpQX2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0EDMACgkQJNaLcl1U
h9Bz2Af/V4hgTxTKdHjN1u+WMg6yXT02wVXXgFMuOCzgoTor2zT61LyB625ROaAs
KhGWxA0W0jNmD22Gg0y7musgHrUD0tcv9KYCaEglsrrItjh0hL6XyHId6JR5nlVK
ytoKwWHhbD0/X3pAJO6zk38B23R28hhdxRF0gUYS3S5wvbW+RBMmyUYi5GCXW1TJ
WHx9Mh/f/G17jxcBUkmFqRe3+41Zox2AzaploPpWDFaEzfLDxl+w6jTKjpZPYDLr
CrfiVK/AU+zrQorjLg0Hks2Q7347jM0ypSMHgD7VUnILcikfE9DAnP4P3aSehqTm
gfDPHQhuLYoCZ8S5CByK9uQPg6COsw==
=W2qg
-----END PGP SIGNATURE-----

--yaHy8g7MUd+LpQX2--
