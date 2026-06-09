Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4322690F9;
	Tue,  9 Jun 2026 11:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003934; cv=none; b=TnaH3Bp8NOpXYHYNYbYczMRnHo7H3i/mA8oGlXDYFjOz7iVm2B3XKHRGOOR8p7JZJp0OfFLOdBeoCpYCf0BgeX7cCoZ/C6b+AUdcoOcyTtQfpgVxHsshoCY47x9OQ7hFnfaTYepJ87fN+EOzti8a1XuUvluNOKqpnNwRiMUHFIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003934; c=relaxed/simple;
	bh=o6SvvTASqZimSfWCn705L9fTGMVlge9AbeIqpfp0Qmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhvITtasoenuFuCvGT9Cx8cCqgESsyD9RxyitZlIC9bp9TWV4iKvkVvvGtHn/7zk4+tlY9eOJ3lDvPon4jASUIRGwaJMADoowRZwxiAxt4n9ltCtoi0YKEFFrKdhnxsilCBVPcPP/5j2zr9GL1aDpxVMuSgCn53js4YYmLyKV1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCusuz/H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCusuz/H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A1D1F00893;
	Tue,  9 Jun 2026 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781003932;
	bh=TFFIXcnQZZx62aSyIM+X6wDjPZycN0CvCtma+zign5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KCusuz/HGquGDhveLDguINQ5iAuKTnSPBrxt2are7fq7HQveCWyO8klgItVYc3V87
	 zZ2mSe4KmaXmGuA0LXstS4n3WoUQEuFquzkQRoU2a7KHrlff4pdxZtUpic6M+Wggu1
	 0S71hq+Ib3jI8HWkb44fgxuYA1iTnMmJzxYQFNWM+vRfZSbEjLjh1s6No5HhW7kA4/
	 LNZmI77qa0W+42xBaxjxTwwd40mUCD2Frc+E0afmXANst+UzvyuFapbQi+6PsT/Yvy
	 Mc1lJ16dwVCiYZ/IaAy56vvBORjN8RtjWC+zKHhctK9tE64SxW/JJRlCL1i/xc8c7w
	 aIXnv3xt7/kgg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F30B81AC56AD; Tue, 09 Jun 2026 12:18:50 +0100 (BST)
Date: Tue, 9 Jun 2026 12:18:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org
Subject: Re: Add fustini riscv-config to linux-next
Message-ID: <aif2mpLE3n6lJwLa@sirena.co.uk>
References: <aie/DAyvda4bcdLm@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Tp7hiC/TaeW4+oTL"
Content-Disposition: inline
In-Reply-To: <aie/DAyvda4bcdLm@x1>
X-Cookie: Leave no stone unturned.


--Tp7hiC/TaeW4+oTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 12:21:48AM -0700, Drew Fustini wrote:

> Please add these to linux-next:
>=20
> riscv-config https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linu=
x.git#riscv-config-for-next
> riscv-config-fixes https://git.kernel.org/pub/scm/linux/kernel/git/fustin=
i/linux.git#riscv-config-fixes

These should be added from today.

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

--Tp7hiC/TaeW4+oTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmon9poACgkQJNaLcl1U
h9CRoAf/b7tvISSqsdsBz79Iwhxzjn+zFEnsjXDRjfMnct5ead6s7W+KHHmtT9N7
eEsnNOsGZZKa6K3B28gQNu+3rXC5jQZSvZqnCRuHmkMxkRy7CE3aPoXoImLAI0J5
YSiSziauZI1uJVe05HQZMR+VcdR1NHb6G3A6Ka5ZmXl+FsmB1BkToh/Nj+vUyE+F
mCiqhXIK0a8UjABMyRIQ88ISceMyXwyBzjJ/xAt4FXhrgSQaiUSqqGMw4Eq3VXsa
rjELB3qgiYsl/bzihGu2g8FyMEb/oGYEDVrUT6H+pxrwUwLJVDu/Z8RS6XnxVsS4
5LypB0Zj8jkqFk9XQ/CLrh8ef2gPQQ==
=bszZ
-----END PGP SIGNATURE-----

--Tp7hiC/TaeW4+oTL--
