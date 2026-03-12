Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61F73A168C;
	Thu, 12 Mar 2026 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315824; cv=none; b=S12fIMqvY9dv5OB+ppadWoeGkETrLz1/sx10i/UK0mXfzkZ8KDpA2fRJy2ZS7eKwdSsNrdiSlpiih8EZGVMkAJjl0q1qd8lhJ9WDYJsgY5GFBgea7WqyCztRQraPG/M8jdtEOp8mYIiEGVHVe82aJj5ksDkpIYFTwf2omKTbIyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315824; c=relaxed/simple;
	bh=KviNKT5cGVrb29a9TtMHC/xexwyR2yPqFTHkYD6I2y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRS6qdjN+4M8luYYUyCEyxdtynNqam3bXKKsAAtVP5pk4X3vsfgJR/z4XdqDUklQd7YvZC0Z+zLjKYDS8JjnUXXn229Smve99JGtBhNP0TCIDoiWIOhXprO3py12U+FrEa42MX6Tc3STVOesuIuMWxJuQq5ij9uNdGKx0LIkhLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oT20aFh9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oT20aFh9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC42C4CEF7;
	Thu, 12 Mar 2026 11:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773315824;
	bh=KviNKT5cGVrb29a9TtMHC/xexwyR2yPqFTHkYD6I2y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oT20aFh9S9ZPFL5uJWEAcK9UE+QB131yrlLvJsQGZ+j2DqgcJOYWnE2CSNHLhOrd9
	 HCwfPkAvKAM/bZMDsFhT59pOPvM5lfu2W6a+1BOkKYWmOXHqtF7Est54LeAxM7PLFN
	 taqqoZZ68e1xt7uJkqwoO7OD9pfAeVAaLPo8y1PKNc9vvcluoUllz2hIOhB6WDE/RD
	 npFJqVfkHvJjA85EZSq/o0Ew5DkfQvQgKWIcLu8RhgtSfNVewDNqS7ytNRE2BK6H/s
	 QeerpOxNtjWiKiyuSHjVnkV5FZpA2rsAUapqWwZuM5y5EEQIUbvtU/mVkV/r7cwfDZ
	 Kp+Bi+1/OiEFg==
Date: Thu, 12 Mar 2026 11:43:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
	"Souza, Jose" <jose.souza@intel.com>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <b7f67081-7b8f-48e0-8f9e-bcbad47165d6@sirena.org.uk>
References: <abFpM1FHgzgARB88@sirena.org.uk>
 <ae413dfe2aa2d18c0b4c44d4bdb15bb630db177d.camel@intel.com>
 <abGv-5kXSCtOTO8M@intel.com>
 <8ec7f38d87fd49a4c81a228b87b1ad244c9b9df8.camel@intel.com>
 <abHMaBe4Wo_PH4uR@intel.com>
 <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iSty4Hq7CECcRi/n"
Content-Disposition: inline
In-Reply-To: <7df1c2dd-1e62-4cc6-9fb8-9f4ac160077f@intel.com>
X-Cookie: I feel better about world problems now!


--iSty4Hq7CECcRi/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 09:47:26AM +0200, Lionel Landwerlin wrote:
> On 11/03/2026 22:11, Rodrigo Vivi wrote:

> > We are in -rc3. Jani might be sending a PR in 2 weeks from now.
> > So, we might be in sync in 3 weeks. Worst case 30 days.
> > But it can be speed up with the help of the maintainers I mentioned.

> > Lionel, what do you think?

> Is there no process to deal with kind of merge issues quickly?

> If someone comes along and changes the bitmask macros again, do we have to
> wait another month after that?

The usual thing that normal trees would do would be to make a shared
branch with just the API change in it that all the affected trees could
merge and base their ongoing work off.

--iSty4Hq7CECcRi/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmypusACgkQJNaLcl1U
h9D1hgf/UPPecP+7mamz7y49yGlIgpN7IqjGebC/b9Pu3iHNsofv1eAjDE2+Z14I
hm7CGBFveZh9TZpjJ3K8HfEtGT665l4V+kORPv3GEy6AgtvTc5RleKBHx6ACCU8l
gyxI0+XNEgV6y/FLhRFPpWlwauwTnuCTKmGqXU9Try8jSG97LDsu2HPhXIaiFEiQ
btw6oaKYIE/rB9rSM773jnK05H6lwpUaYEZDcFGyWD6vmDdZ/zNMbSMZ5WdhkBfp
OiadqQkeJ7KHinGN3nOmVBsJHvUtM/RU0laZbu4h5R4i7/9akOmeCGPxdSQmvJAs
NAuzX2UMqurQeNnBCspmCS+qyqWuQg==
=UFBQ
-----END PGP SIGNATURE-----

--iSty4Hq7CECcRi/n--
