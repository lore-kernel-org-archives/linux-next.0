Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A238B7AA;
	Mon,  6 Apr 2026 16:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493824; cv=none; b=lzA1XgtSsmh8WQ0T87GHzXCOPPluKppSoO0Mj/kj2UFOZYHt2PPPcKfDhXvKg65e8RTSgogudUg00WQef8tiSbMK2PuO6HnOvrRssj0o4m3cNGULawSXEuDpByQmK2ZWYOxlv2y/2n0DsPnfxGyJ7742eBEzrNvOMkqdcmbCwdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493824; c=relaxed/simple;
	bh=AFXPDT8wwMK53POj9t8lsa742VrEHUV5CGNV0S+9mN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRk6qnnscz3WyCEY5E83iUVfIPYjAJjgAZt8Vao8t1fG/J/ilezd57yw+7yz0CQvCaCnMUhLpiSxGC2VnDgPpZ9aaOe7+/ifKFAjsalmhqV7Uw9H+tiWYt75Wo2vAQD12SMN/lN5PkhVouL0xq6p4zdOOiNU41Vfh1PFGDKSMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffFXfa4c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffFXfa4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294D8C4CEF7;
	Mon,  6 Apr 2026 16:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775493824;
	bh=AFXPDT8wwMK53POj9t8lsa742VrEHUV5CGNV0S+9mN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffFXfa4cPefiS4vkDGrv1Ct3MvPeFTSQaQzgYsXB7PZfLRkFQYXBTBlGN5ZcRsykE
	 2zYT0HP68/fzeZgN+NRHDZS06msuPvhaaYH5Uriy4XRr9vBBOblbp7JN5SlZQauN1r
	 tl8RKXdiOM9JWnnga8KySHY3gUe+AL9LAtqgeY5oU9Bg1sv9RaS6C5iSQwp5tAUGhm
	 DO+RA3Eh7hym0EeIs3/g4e3dU+otFKIbbxsARj+so6WXQTJXXkAxY4peO2N0NZnI4q
	 LnH3Pzvf1kdNSEamZsStJoFfDzl3J3zNvCoeoMlfqmOAuylpIJdnaefC0o5ewsD9EO
	 OzK4Jj5Awdv7w==
Date: Mon, 6 Apr 2026 17:43:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the hid tree
Message-ID: <af1cf86b-c2a7-4b75-bbb3-dff151bf4edd@sirena.org.uk>
References: <ab096wLbcpu0M-GF@sirena.org.uk>
 <fa4b8b25-8b34-4314-a7f3-ea7143ed9247@sirena.org.uk>
 <782cb718-33dd-47c3-b5a4-d95440c2d09b@sirena.org.uk>
 <61868409-rs8p-rq71-q852-5296pnp42srs@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AcLqew87zc/7TZoS"
Content-Disposition: inline
In-Reply-To: <61868409-rs8p-rq71-q852-5296pnp42srs@xreary.bet>
X-Cookie: Does not include installation.


--AcLqew87zc/7TZoS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 06, 2026 at 06:38:14PM +0200, Jiri Kosina wrote:
> On Mon, 6 Apr 2026, Mark Brown wrote:

> > > >   142068281f513 ("HID: input: use __free(kfree) to clean up tempora=
ry buffers")

> > > > is missing a Signed-off-by from its committer

> > > This issue is still present today.

> > And today.

> Yeah, this happened because Benjamin rebased a tree with commit a that I=
=20
> originally comitted and SOBed (the tree has a shared maintainership).

This is a common way people mess up signoffs.

> If you strongly believe that this is worth another rebase, I can happily=
=20
> do that, but given the fact that it contains signoff of one of the=20
> co-maintainers, I wouldn't lose sleep over it (but I can be probably=20
> easily convinced otherwise).

That's more a question for Linus than for me.

--AcLqew87zc/7TZoS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnT4rsACgkQJNaLcl1U
h9DuBwf+I81Zgf7fXVWwHFUc0IeeZybVvd05nnAv6uzxk6fia5146PW8O9IctVKH
/cRKIUQRN2ypk1hej5zEqdFS98Z0IT3UL7+emQAGVvfA/UTtqbNQkNz6IkLF1Xfy
QhaEo6fEvFtOkWh5jybQ19vdmUhMeKz5v5o4UKisZ/ZXNNb3a2DFrF4o0OzmfpHw
4rh7gmmnBvvD51sH4xYnQ/SSpIPoXsBEE9snIJ3AVxbZMy9AeTETqCgKD7tKHqF3
rPKOqT6eI5BaH+8xsQj87bI84xJomdgtp5c/fXXKvnA9lH6esmjnntA8KJwAT96q
ydF4UVVYMSONFQskw0ThYf3B3/QO2Q==
=2reX
-----END PGP SIGNATURE-----

--AcLqew87zc/7TZoS--
