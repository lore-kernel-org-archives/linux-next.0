Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F671A01BE
	for <linux-next@vger.kernel.org>; Thu, 16 Apr 2026 11:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340001; cv=none; b=p5p1uT4EL40HVQaM4v0PZPtYFfb1L1ah9K2HOtg2u3l98KT9j/XKW4AoQLIFLUrb9zpcsjHqsX0Yl8pI0AizUq1a6Leqsg0GnRlFAGHf8pAccBC2mg/ZKyqw6/uyRRZSl/FYMT21sCoF44A9Kqx56ReRql4l5QSC0Gndthtzxvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340001; c=relaxed/simple;
	bh=qI9zcFVz14M10vCodcTKzLR1GBbMVYxbEW07SsDpyhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHl5zQVlE63c+bqFHg5YCspSGhWRnEiPLZrFHV0Af0gquEebjGCNTj2y2fsUUbbFvC2Mhd1ZT9QDly1rWwIcXIsMUhN6xW029GZ5SwXW2ZXYccFwYNIXFMOi4wkEPNpFcK5JdOW9TImWoRecCpi0v/TBMU+qFIjXfRzaC9Eq9bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKGphq+Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKGphq+Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86753C2BCAF;
	Thu, 16 Apr 2026 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776340000;
	bh=qI9zcFVz14M10vCodcTKzLR1GBbMVYxbEW07SsDpyhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKGphq+Z2tUYVCJlcsy9eJBGOKS2ZMD6tmnjrR4hLayx/ad58xpHYe0HrAxw+tccE
	 M/1Qgz4fjsCrgULTl6i9Ae3ezYPDAte8iJ5/tzDPaW3IuNe2yCP+/NuydiY9dJB8Pz
	 W8OMK/2MTfwfgJPIbG3tNRvAbekiNhGTp3B3Fg+XRbAYgCiek87wHAvdeHUIqNujRW
	 geZ8UC7F3XEENNph1wWM8nWkL5XToXLOPVa/QxljWvHbfZMKiYdhsxBy7zZXs/Kl/z
	 8RDwR7N9pSxZ/MGBGg67QSUfRhnpf7PzEGdn27ytcitBn33RHW6aRlES1047xPrKr6
	 wsviYeyfWpL3w==
Date: Thu, 16 Apr 2026 12:46:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, linux-next@vger.kernel.org
Subject: Re: adding liveupdate tree to linux-next
Message-ID: <b9ffc770-4f2c-4e86-8db0-4819a2d34acc@sirena.org.uk>
References: <aeDFNb2skxuNrDIW@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kar3Z8oIJ33/ia1a"
Content-Disposition: inline
In-Reply-To: <aeDFNb2skxuNrDIW@kernel.org>
X-Cookie: Process promptly.


--kar3Z8oIJ33/ia1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2026 at 02:17:09PM +0300, Mike Rapoport wrote:

> We've setup a tree for Kexec HandOver/Live Update work and we are starting
> to take KHO/LUO and kexec/kdump patches via that tree.

> Can you please add our branches to linux-next?

> https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git#fixes
> https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git#next
> https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git#kexec-fixes
> https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git#kexec-next

I've added all of these from today (I see they're all at v7.0 for now,
please note that we're in the merge window so the next branches should
be empty), everyone CCed on this mail is listed as a contact for each
tree - please let me know if that needs an update.

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

--kar3Z8oIJ33/ia1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmngzBwACgkQJNaLcl1U
h9C5nwf/fmfWICPK49ga/vo3fHYsAn5DPAE9Sj2tHrzZftAJgJDsyP1R18wvz/Gx
KOAVo87k67VfkyxpFdFzooKwl28YpP/ROmvcD88ps/kvULqcQP97LT3TNBmA0FPN
xJJCPzbps5Ozz+t+csQRpWUJo30bnkgEe9ziUwMulaMUCjxOkf7jDc7LoE9OwAur
+qnoqjJ777Tqtu7eu88Mz+VKKkWj7+b/TXblXrsp4K2nOnwm4998kRcuffQXP7u+
PBcYFLKhSVF2yz2E4GBnJCFaQutD+jdgmh8LJnfOcHrVzG68Edw3iMFQcbnS3ATb
EzPH7BDHasz1l4N4MjcHWMSspOuCyQ==
=MuW+
-----END PGP SIGNATURE-----

--kar3Z8oIJ33/ia1a--
