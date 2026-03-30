Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F352D274B46
	for <linux-next@vger.kernel.org>; Mon, 30 Mar 2026 11:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870079; cv=none; b=bi1I/GfOQcu0s4pbryWLu1PLf28oOID/W3oBARBHcsaVWozI6JXXm08BL8b8hzxA4PcjHfPJd+LDvmsExzNCB7Le3V9OqrWZXEj4xHDLu73eJ1R6kqJP+bGVWPn2a2gxyURf7CZIQI2FqT722f3ZM5LEZULk4j96kZcyef0g6OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870079; c=relaxed/simple;
	bh=R8Xiyn+MS5bTVgFnP6abvY2CzZK7UGh0LuA/fnc1GBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjQ0+XgqD7oTJyQlZwvw4g566uAu6/VQ3J4zWHjoOidpywCnY2pwTbbOoEKaqUI2O/gN6eNbvMwZhqNvixh7hk5rBy3PGlDG4dniIPLXUDYtNRp9qrw7alcf+7Sx0uihjLgYhwOenY0nR1cLn37NlNeTyNxT6KkkpKdTQPZxLdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjClWuEo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjClWuEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7964C4CEF7;
	Mon, 30 Mar 2026 11:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774870078;
	bh=R8Xiyn+MS5bTVgFnP6abvY2CzZK7UGh0LuA/fnc1GBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjClWuEov46QihtLwoe1agV+zGpHLb+0z2ArSMOsWv5yL79I3QctPBh8cuqU6Cgu3
	 Qs4fdLAWApKujSGfmHfdsdqsIZOqZzN7nFsdeaex3z0vPZFZLP7bkI61+MEw1xeydE
	 0wTXbMKdCD1GHfVg5kQCjXjAxv/Co04a0LQWXXaBQ8wKy8BSSDDcz2dnMP9e1JKzEV
	 fLb30r527Hp2F4QiBihhMZiWOuWxviD/j0rh701jGOTbBduXJfTOio5pRixu/DHPsf
	 NulNeR8Eue2H/++4BrFhYyRaspm3oY0MFO5xOn99Y+RWKzAr91d7Cx4j/rLRAS9o9f
	 q9mPU/2CedMVg==
Date: Mon, 30 Mar 2026 12:27:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Igor Korotin <igor.korotin@linux.dev>, linux-next@vger.kernel.org
Subject: Re: Please add rust-i2c-next and rust-i2c-fixes to linux-next
Message-ID: <b239bb2f-15d3-4d30-9b3b-8008864d8d62@sirena.org.uk>
References: <02908210-0ed5-42a7-b725-8bf70f936828@linux.dev>
 <20260329105919.73dea963@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qtUbv9wzEPR4l1Qo"
Content-Disposition: inline
In-Reply-To: <20260329105919.73dea963@canb.auug.org.au>
X-Cookie: HUGH BEAUMONT died in 1982!!


--qtUbv9wzEPR4l1Qo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 29, 2026 at 10:59:19AM +1100, Stephen Rothwell wrote:

> > Please add the following tree to linux-next:
> > Tree: https://github.com/ikrtn/rust-for-linux
> > - Branch: rust-i2c-next
> > - Branch: rust-i2c-fixes

> Mark Brown (cc'd) now maintains the linux-next tree.

All being well these should be included from today.

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

--qtUbv9wzEPR4l1Qo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKXjoACgkQJNaLcl1U
h9CiqAgAgm1Pk9E/oh8LNkQv5WtoxdGMvVCpYNUaCIB/edtl9f3aFR1cTt5tpguV
EVETQB8VJw3heckQSZL4X6RhL6CGlGHTF8AUPLJl1a+YEu3VKu5yOcbBLglNeaAg
0ofveVq8PlmGIl0pHjLLu69jL2EZ14L5JAzXvXTsZrcM4zbwsnl9xbbrlwF2axfu
P51JtMl8u4iqySvdbcTdfSyOdpb1xKvvbfSLNlLmR7aIvbZFB/+wUJKygVZ1bfXc
rAp8vzI8E3jENfby5IVXXVve8YDT/7wFF6NjSvWwjW5HD6thpG5QFdRb9LzWnMX9
4NtQV8PtxpA69m223b82B9QSo9d6Zw==
=Bf4t
-----END PGP SIGNATURE-----

--qtUbv9wzEPR4l1Qo--
