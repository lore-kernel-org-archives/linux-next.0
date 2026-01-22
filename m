Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB628AAEB;
	Thu, 22 Jan 2026 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080822; cv=none; b=ndBEXjqINLDUB88bl3DqT8NSuWg6lYv9RjO38K9Bwi53FzUC5VFYIVl4WlkQayIPYb6/I1FBWIKkoi49dkCRduiej/ee2ug9daWD0LRAFs+8wrEpH69a2eXbAay2zw2UBoq5CI+q0Y0CZ7nT/F/mvETqviT8a9ZGaLSCWdLbfcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080822; c=relaxed/simple;
	bh=JEd85j0l14QJu/r3fveBK3583SVQ9bXB4p1GwZt3ba8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPXx/qRAZw+O7gB52BlJi9O62ABbSo6ZXURmI64x4L5bLNFMdHZYWjssKOrvINZGk6Bfk+++ylbiHdM0i781N1bTfn2EqYHzkxJdLkf+c6TDBE6JizT6PMc47jNEulhMOYbD5OuluAMbU3/EL/rLknZYOHXRJlrkAk3NSHpM72o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ez+rosqJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ez+rosqJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A5FC116D0;
	Thu, 22 Jan 2026 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769080821;
	bh=JEd85j0l14QJu/r3fveBK3583SVQ9bXB4p1GwZt3ba8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ez+rosqJUTPYzQRC0vKPGevduWDT9xTeGhIyF/KYg6JaNspdhSswjconB9a8gIgmQ
	 JHX6SkWiSHxtl1Fr6BwyfknmejWUztKxusDbvmOV3UldS3jFOEz8XIgQHSmltjky5D
	 KMIvhsmmiWVqzS2N4SB1R35eZiw0NGNTnRSWeqvIZsJKkf47C7EoStFL19ByQkqFzK
	 pEIS0WsLgP0fl0MPrlTeegEdRNQ6l+rzNIxTEk3wN0AFLysfASEPEeawzmt6ttnX2D
	 PHn26sIrucPZRbu1OnK+bFUM9mYEA+T4Q848hELy2tvnxUDbdnJlwxOqe9tJSq4Ufh
	 FwKM3Cr9/g9ug==
Date: Thu, 22 Jan 2026 11:20:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Beata Michalska <beata.michalska@arm.com>,
	Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Rob Herring <robh@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <7af0ccaf-fb5f-4690-9011-434fe0719af2@sirena.org.uk>
References: <aXEJZ88g0Ng2dIQ4@sirena.org.uk>
 <aXElns7ZpGuZR6ke@google.com>
 <CANiq72n=h5dzcmNULoXSZ4h2133hSY-AtU-xGxeJ=hfmgY1XZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WbToN9XN2qoMSD4j"
Content-Disposition: inline
In-Reply-To: <CANiq72n=h5dzcmNULoXSZ4h2133hSY-AtU-xGxeJ=hfmgY1XZw@mail.gmail.com>
X-Cookie: Don't read everything you believe.


--WbToN9XN2qoMSD4j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 08:24:07PM +0100, Miguel Ojeda wrote:
> On Wed, Jan 21, 2026 at 8:14=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:

> > Note that for this kind of thing you can add `#![allow(warnings)]` to
> > the top of a file to silence warnings.

> Mark: we are in a call right now and Danilo asked about this -- I have
> a similar issue with CI with `bounded.rs` in 1.80.0, so Danilo tested
> 1.80.0 and 1.80.1 and indeed 1.80.0 is broken.

> We are upping the minimum to 1.85.0 soon, so it is not a big deal.

> Could you please upgrade to Rust 1.80.1 at least for linux-next runs?
> Where are you taking the toolchain from? i.e. I would expect a distro
> to provide the fixed .1

I've just got the default toolchain in Debian stable which appears to be
1.85.0.

ii  rustc                                 1.85.0+dfsg3-1                   =
    arm64        Rust systems programming language

--WbToN9XN2qoMSD4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyB/AACgkQJNaLcl1U
h9Bc9gf8DcKLygMGoNvFah2GZL3WKa/d9ufNZaJKLdCsIG8TJOZJvxkqIq0QoU0g
A2tK+AKZ8JsC2U3gBs8UzxiozoRPFS1dDeqFExY6x7s+7Tfj6xjaR4Np5SYjO0E5
wnQzd+OHFsWawONlML2mmq+drMsCQcAlLRhb0gLRe9D07owLCq04bseqm/o8QrdU
slgyoRfsDKEQiGbQE+XS0nYHKGieXsF1FAuUPp8b3p8ZBkvKux+A87icq+MS7IVB
NhWYnG72jhnrk1CvaChMSbB23pGm12SeZ/5SMub/z8hgr58KuLEvLWemYQXf1yL6
ZpGwM68xbF6VZ2fhncAAEA682IMTAA==
=2ccK
-----END PGP SIGNATURE-----

--WbToN9XN2qoMSD4j--
