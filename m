Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E809A3B531C
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772023027; cv=none; b=ckxaBK/YMAjNI4f15jl4lgbF/EXsQKQ0uv7TX8x4AHI9aSTbTJbGH5qe7LGJD2bwajFCU2/lhULsgCRuNc4DhH4GTvzxIHOa4fUA3WQ1Nlu6EbIXSj4e+t+u4GRm8cs/oRdbHH+5YFdDEHFJ4D+9j7za/JS6Ad7bIlA3zHYOLls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772023027; c=relaxed/simple;
	bh=8gTKbBT6ymneRgEt4cDfxsqyaJcTT7e1Mk4lKsQelP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1idLSYXKpNvlKtst8GKlTVD+dqKd1oXByS/f/Xqs6b4V/e0bng8I3fVc9mpSUKA/59jmlTAMfECcGDZKVnrh8arh6kUQS74CRZt/guOnoW49PgZGg1yAe04PZ90u4ECX8ZKbh4E9MC15300JlfhdBWyaAD2DefJsYXCD/cV1UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3hTOI8M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3hTOI8M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B146C19421;
	Wed, 25 Feb 2026 12:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772023026;
	bh=8gTKbBT6ymneRgEt4cDfxsqyaJcTT7e1Mk4lKsQelP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3hTOI8Mclsc1T9q0fS+MwOFANriqIFWVip+Ft1aRV3rdX9G65WtMWHi5zvjVDRUY
	 J9Kddd2hkKMirg4e99qYeLd77CqtcZigvT1/GoIxSELQOM+6VfPM/uQfsmewifaQa4
	 KrnjsuT89ERDz/MVd1JeZlN0jwcCVv0bQn1X0tIjX7nqtPUYwppX+9Yl/Yxl1BvbXT
	 ky+sYDSIPrhUvYADShNyTmTuc1TqwUXrrJHNXJjuZoMRTmXGVW6nxL8KUPiq2dfbJu
	 g7xxr6BckWkyz6YojP96crQr4U3NVqqkEndoyh2KutCAkFBMnQ3N+/e0wIlmEn3iCv
	 dK/jbl4KSX8xw==
Date: Wed, 25 Feb 2026 12:37:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Include Altera's SoCFPGA tree
Message-ID: <42b96da6-ffb3-4fd9-8821-9093a323507c@sirena.org.uk>
References: <537c455e-36bb-4f80-a910-10a58247a67d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nuUd0sad0EekWERr"
Content-Disposition: inline
In-Reply-To: <537c455e-36bb-4f80-a910-10a58247a67d@kernel.org>
X-Cookie: From concentrate.


--nuUd0sad0EekWERr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 10:25:58PM -0600, Dinh Nguyen wrote:
> Hi linux-next maintainers,
>=20
> Could you please add the SoCFPGA tree to linux-next? The branch contains
> patches intended for the next merge window for the SoCFPGA subsystem.
>=20
>=20
> Git Repo: https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.=
git
>=20
> Branch: for-next

I've added this, all being well it will appear in today's next.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--nuUd0sad0EekWERr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmme7O0ACgkQJNaLcl1U
h9AE/wf/bRSBNxft409iKzYpVFcARh4Ad8UmDizWUFBKSXrHiI5wDSStAUnJKReN
YJaqVi/6uV1i+45JS7EKbVSohgNdoou+BDiPqoiqrtsf4TJ8WKmdqYI6A6VgJemH
j+g1jjJkCwrBPiBxJPRThnKj3b6HD8x5x0eN8XN1suhoCzJ7z1Arwc5+JAxtN156
uuH9KwrzWMH9ByWG2o0V9llT3iVlaon0xjAy9OeYyNs2chiS715ms2jzq/He76qU
7szcAiOY2sGCS06FuKLNMfy7Up0DvJeCMPTTZjkOvvL78hPF+VHzIoQ27BtC4WSY
yL2COJ2Ue3IrPo7XKB9SEhcg2II5xg==
=dZ4l
-----END PGP SIGNATURE-----

--nuUd0sad0EekWERr--
