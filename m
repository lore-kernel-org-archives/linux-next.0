Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD438E5FA;
	Fri,  6 Mar 2026 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803479; cv=none; b=XTDe0bn+vcogiy398QcSldGIo5st9wfJJu1eTEuMwLQ/JENmx1MMGOROoN1Q8C07kpJuXh38613Sxib/qP5IjsL5coLZmCNZpmWAYArcOSVJgRsD7TN4gZ6et20MYsIEORKFTU3flWXPHhWxkVclBzyftokfA3EacMap9WB0NJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803479; c=relaxed/simple;
	bh=yxfLN+Xtkt2TtessKg2GJucz5W4wtJY8o0YnnL+ymtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+e5FXkRiW4JHyHYUVelBGuFwP0LSEcGK60+2CP2zLPgULtp6HIW3izp3N9tQ2SWEXWdNGKHrFKeOgCoenONMszhH64HEAOLAywZcbemyDwqLU8LK8dWqwtaLcF3RSJGLOYO4LMCgYWoWHZcbTHp5ebwEkIQEnHNLH4jyQYFe6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fu6JpW7u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fu6JpW7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D156C2BC86;
	Fri,  6 Mar 2026 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772803478;
	bh=yxfLN+Xtkt2TtessKg2GJucz5W4wtJY8o0YnnL+ymtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fu6JpW7uL2+Oq8IWiUQnZDcVDxsTqLj+wMnC2CyWsoH9DkoWQz5KWnUwuGTJdHyY1
	 G1ZNE9p9agMHDhZlzH5GuivN7mtgC4NEhOLAfZxeuUEfpZWoEYcG9E5oFyT/WPbk63
	 94A6UX1pD7XdRwTtGAlacdDtDsxaqtbWvPRGMYS2ObZc1kK/PJSYO4QGvVmOpuiWMw
	 L0rBvTUCc/n3t22mO33x2o020V0JZWqwP/pVmgyF1wvBQHb0yT3uqeZFWYzZTFHhUR
	 22SvcxDIQU3xkdqETs4CRMswYjtpzjPIaR3NA/XbrhDCI54tdPRUXa0U4o/9q86DEV
	 dAv1F82Cnvj3w==
Date: Fri, 6 Mar 2026 13:24:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Chao Gao <chao.gao@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <20b59abc-096e-4578-9935-0aaf80dc90d8@sirena.org.uk>
References: <aagjzN07Pv1fnSHq@sirena.org.uk>
 <aai71uI977FU6599@google.com>
 <20260305192401.GA1783111@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UPo2juSCXrFibkPu"
Content-Disposition: inline
In-Reply-To: <20260305192401.GA1783111@ax162>
X-Cookie: A nuclear war can ruin your whole day.


--UPo2juSCXrFibkPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2026 at 12:24:01PM -0700, Nathan Chancellor wrote:

> This obviously clears it. Mark, can that be applied to whichever merge
> happens second?

I manually made a change which hopefully matches that, your patch failed
patch format detection for some reason...

--UPo2juSCXrFibkPu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmq1ZEACgkQJNaLcl1U
h9AvEQf/fhrn1ocs0lt20XzAyv4t01QPw2ieXX86rsMBtIQO6rJisqM6/xcjBXjc
04TzXHOyHLiE5J2ojV13AqeOPWpVbZ/MQQ202tLCzGjGYMzHRTFD/4IJzN26G5B3
IOm8gLO6yLLTImvs8+FIp350A3Qi2j7ImsvQnUuCQzUBAVDvV1z12k/BziJB3PZm
T8nkbdQO4EnhH/5L63uT/1Ho3f6asvmyQowm7N+cKrfGe+H+FKxEmqwN7YAZxdeF
0TsZ7IVCrAH+nsEk/nD7Icg25oL1IFfAVvvz0pVjdh6yXfUSraa3+xCgCYfDj3PB
GaHWoQ/LS+UE+FkUbmsY8STu96XFGA==
=kddh
-----END PGP SIGNATURE-----

--UPo2juSCXrFibkPu--
