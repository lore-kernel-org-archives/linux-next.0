Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A873876D7;
	Fri,  7 Aug 2026 21:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786137014; cv=none; b=Zx03HT0H++A/jASBUJ8fCzrmSl3lUP91J7ja4Mw85PkFDl6/X6Wav+0Kb80eXtv3cwvJZXNHKzDZA0+xqbdfwAnCw01rSmm8lu5P9DJS+CqJHJdByAmarpqn26/zTbmGqS0HPtqYkPEcOEcKCziqR9fLoYF8HkZxJLmOVTSBPtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786137014; c=relaxed/simple;
	bh=CxQA98wkYFLCv21CjXI2Z8zlTe30KU+ixPWB0588rUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIGNrFlIeXX67emkV5X5WDPzrTLeAU50ci+W9YJ95JDhabAELzz1vav9n+xeXLXKnxbKpoK2g6F+GihGTUg0RMZvKP9JDH9jZwRYIJN3fOkvhR0mQg/9XIN/GobE4GeFQySg0vrJbaxmL/VfD3MkwJQ4itNQDEalCl/dDJUDCMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtWMKs73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtWMKs73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7E31F000E9;
	Fri,  7 Aug 2026 21:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786137013;
	bh=s1RPl1QS8Ja5ft8yY4z6ymZtmk/pWGz2XGUE0pdpLwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gtWMKs73JY3aGDTeEODXfn8QQ8QfhQpuCpDauyHZoBaLk/CCqdqfFzClX/Ubcg34M
	 LyoNTmRth5Dt91sAKMB78rAZnHLjYeCXshmmlAUbBcRjtqpbq9YvEMpOOz28b9HBCu
	 AEB5fCRct//Vmo4fYiu/7CXLt8D0uEMmkiqvgAVCUQxOF5Ach7s/ELZAPkzhizmEib
	 O4K1yt5aLzV4fnTnbHEKQILbXVxLmEAEds1zw0pvle1iujxmYJKuHHPemfQ6sKK57l
	 QrNNgnWrGubr2kx/ZS99kglnly/r6zPlnzdMEAPlFszPcS/Xutaex7pb+KLmL1T2+u
	 jaHF9zCWSTyUA==
Date: Fri, 7 Aug 2026 22:10:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: "LIPSKI, IVAN" <IVAN.LIPSKI@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Roman Li <Roman.Li@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <4b2e8c3b-bcc5-4773-bf1c-3fe42b1a152b@sirena.org.uk>
References: <anX9ZElBEqtJ6py-@sirena.org.uk>
 <CADnq5_MnXMj31uNLwkjzjfzyzG_o3BVxecbBYpFW2esKwi7N7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ihEx1D5d1IjSIXWl"
Content-Disposition: inline
In-Reply-To: <CADnq5_MnXMj31uNLwkjzjfzyzG_o3BVxecbBYpFW2esKwi7N7A@mail.gmail.com>
X-Cookie: 1 + 1 = 3, for large values of 1.


--ihEx1D5d1IjSIXWl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2026 at 04:52:11PM -0400, Alex Deucher wrote:
> On Fri, Aug 7, 2026 at 11:44=E2=80=AFAM Mark Brown <broonie@kernel.org> w=
rote:

> > /tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/s=
rc/dml2_core/dml2_core_dcn5_funcs_mode_programming.c:11:13: error: stack fr=
ame size (2400) exceeds limit (2048) in 'dcn5_mode_programming' [-Werror,-W=
frame-larger-than]
> >    11 | static bool dcn5_mode_programming(struct dml2_core_calcs_mode_p=
rogramming_ex *in_out_params)
> >       |             ^
> > 1 error generated.

> What compiler were you using?  We are having trouble reproducing this.

Debian's clang.

--ihEx1D5d1IjSIXWl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp2SbAACgkQJNaLcl1U
h9CeBgf+NO46pN4lWq87Ec8iocqStaxqEtfKune72klo/HfY5ZYS6LsI67nPheh6
RqRjVw1U4xmO8qTjKg4ma4nslQN09lha6dB5K9+xKgQV4SgZzqAg2/w3OV/avsGD
CWonEbvemtRaL1W+q9XbvYvJ4fHNqJWZAY6Cdc9cX75js5IcGMfcGu5RmhszpMle
jI63VNhgGJqj5uDd0gECcZLFjxleB8aK6HflyvsooVDIaj31krLP4DkPCEEPsa5H
E4jKyJpsDLIP/xRSTaUuPKluZJpPR1jHCyPRgBgMzMdp5vwkc86TIAVs3xmFa4gE
ySKY+HCO8dSN3K6ovr1QNQw9T3i7GA==
=Ffao
-----END PGP SIGNATURE-----

--ihEx1D5d1IjSIXWl--
