Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC64EF144
	for <linux-next@vger.kernel.org>; Mon, 28 Sep 2026 16:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613404; cv=none; b=Ja1N4Qp0wDgSo/q0PkoQmUVZct5Zf647+0Iyzcdl/lGgN6Zgg7KhvZJiIsuiGcv0wdQog+bt7Dmlnk5dulxr4h2lxSrhSJO4SekjL6a0ihrR3czf4+mQCoSxFv6oCfx/l2Te0uu2DgPTKj93BFHtmQOvEoiviYgKxBblO6nbQIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613404; c=relaxed/simple;
	bh=n1bKO6u7CMUANL7LtfIsjBLimujZWZ6fPXEO6JXjq00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ew6EdVDQhisJPZN/2aTa3etOyK28x5rM0qU2eNug4+IUf79K1NWdk7uUmtPy25rR40+ltPl4vn+JssRNUIa8h0zMYRQQbRui1fVu12EA4Ah5XDvfYeM/fWEVYFXV5f8vPunoz0SoBVCbgcL9goAxRTLaaQHELfeu56cWi24HhQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLK4y80z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLK4y80z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70251F000FF;
	Mon, 28 Sep 2026 16:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613402;
	bh=0SJJ61sA5zoUApgumDztf+WYZuWnk3B0sHc4sGtm/uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mLK4y80zI/wJhbTgSmcDioaveC4sRNZLmaD+PZ05xgXFAxrgQqHaN9uB0KfjBv0Ud
	 lW+h+RoLFO6PEnTnZ7gMtKmgN3Q9VU4TnD94OPlOQBqoVwTIIRu7tSPG6RnNHnTj/S
	 njrtAWSM0hHOpf1nJps4CfYDnCfzyFnUryag0AduKyQRpjoQLUtbI02qUrtnoqJ5NX
	 k0LkbGQGdUmzpF2kLFpGWYcCh885YHoBH3B+YbB+6FXE6tg7BNhzBvTAGq+gBFi4Ik
	 3RtsbZHx2yBYuuH4mqIt6qhQlWH7Sgu0ozhnArIPNz186KSugk1zDRI8+tpwLu+jYI
	 LuRA5KeCfp2ZQ==
Date: Mon, 28 Sep 2026 17:36:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, linux-next@vger.kernel.org,
	thierry.reding@kernel.org
Subject: Re: linux-next: add configfs-next tree in the merge
Message-ID: <c449b6c6-b444-48cd-9acd-aa0c74175842@sirena.org.uk>
References: <apFFi-I3gJWvxeHk@gmail.com>
 <RG7jQ5JyvM4e5Xcaq6gH5fYtgwBJXjZBH3zOR4L9ct0B_2DKAVvUNLsKf-QBrgFByrKg76S9Cx8lUMwtTzrKsw==@protonmail.internalid>
 <5efe46d4-2e30-494d-abce-b58708d7c6dd@sirena.org.uk>
 <87tsn9u3ca.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xLHOf6loyUEksN9Z"
Content-Disposition: inline
In-Reply-To: <87tsn9u3ca.fsf@t14s.mail-host-address-is-not-set>
X-Cookie: All is fear in love and war.


--xLHOf6loyUEksN9Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2026 at 11:34:13AM +0200, Andreas Hindborg wrote:

> I will PR rust related configfs changes Breno and he will send them with
> the rest of the C configfs changes to Linus.

> Can you include my tree for the rust changes in linux-next?

> CONFIGFS [RUST]
> M:	Andreas Hindborg <a.hindborg@kernel.org>
> S:	Supported
> T:	git git://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git configfs-next
> F:	rust/kernel/configfs.rs
> F:	samples/rust/rust_configfs.rs

Sure, no problem - I didn't see this till I was too far into the -next
merge for it to make today but I've added this now, all being well it
will appear tomorrow.

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

--xLHOf6loyUEksN9Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6l5YACgkQJNaLcl1U
h9Dhzgf9F2szNus0CKUDgzFAoRa0oJ2P8fCNZPSxnjzse0eriPxHOPKsPCAyG2+y
vFlSihm6D+dl4UinbDT7Ti7Ubs9lkaSdbTL/9hHmD/pu/FT4ZQShkcnbbCjc2LyI
QZjKwqibL3vGV4hnOwSS8pKj+deaDEKQsIvtr0wA1hUOH2Ux9nPU/wiQN96maInR
6wrUq4jR4d/YcJZp7jvzYAA/lXKKVVtJpup2wkEk+jS+bWOs2Ou55X5D35oFKcDN
g5kQHRiqTuWmfltsGO5gXgHwiG8FMAtkxfm2TKXB/7axe7kR26kz4oeKkP2bwSIC
pIJjMiMt9vVCQwxxtipRZ6PMwfXOIA==
=U5aW
-----END PGP SIGNATURE-----

--xLHOf6loyUEksN9Z--
