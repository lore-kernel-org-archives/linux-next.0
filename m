Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35498378D8D;
	Sun,  5 Jul 2026 12:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783254056; cv=none; b=j2uQwugloT9MOvV3E1NwKLol3W7kZhtQJGDVHBdf49oQ1WvYXCRnGD1hfCC9NdN/BXZGI3wyt2mRrHOd4Qys4ULL4YDrKGttVPvcfhutnMXt04/5i+JoSbjNROKCMiIwsZ07ibjtEAbZc8bPCQ0J+y6tIyECCID+im8Sqp/nCg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783254056; c=relaxed/simple;
	bh=TD/E9SRcj1uswBEvub6kdnOoLfvLMcUnv6zBDMISXko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khA5oH/d1oW7onHm78ZOBzxoEXuOL175J8qqUmzeTpiYwTXdc04BhS141JqbsaQdajd2UTJMhP+kcSsyspScZMq0uM5mLt/Mptm/n4BpOMnBskV8KMw8xP7t/Pt0b36bqBpod+FcWRkoieZmLuZW5JCxrzg5R10jJjp7zLzMZyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BR/h40Eo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BR/h40Eo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC521F000E9;
	Sun,  5 Jul 2026 12:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783254054;
	bh=ldO/GSAElMFF/1Zt+hIXuM8wdqBWRwc1KYUMu5HINTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BR/h40Eov24FKQrV+Sx948aGWqEaSMPFwNTVOBEAHty/SohmYxthbQ/3MTsUDgKX/
	 /68YOOpKgbglDz0qBuQzxnnMlH6hISjOb2lPBznVYdGNfWwzcQKbylDJZRgXvlPSOQ
	 rpf2GK5xcqV11puXI0pD4yN9N8Y6VAbqG+gGRSqNXZCfafiWYcJlBJNEn5NCdnsiTo
	 kQ7LGGa+zwdufVju5MF/W05zV2MEvkveyDgnzPcABZPH6kPHs8cCV0pAC1Lh2nEaT3
	 allMSfvr0u7oqSZtp1iRVQcfBGNzzqv/AhB0Ucovr9xzmY9HoSfW6mos3pDGax+CfG
	 V6tUEqbhKaxCQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 512F71AC5AC6; Sun, 05 Jul 2026 13:20:52 +0100 (BST)
Date: Sun, 5 Jul 2026 13:20:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Theodore Tso <tytso@mit.edu>,
	Alexander Potapenko <glider@google.com>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	mingo@kernel.org, gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <akpMJJquyKyweuG-@sirena.co.uk>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <akkGwsQg1k5ZfGwa@mit.edu>
 <dc3c0e2a-a3fb-496a-ac82-fff849b8ba78@I-love.SAKURA.ne.jp>
 <CANiq72nNz6Xo8yu0nyC3OLAJiAA9A86a7Ku59YX0GD-cVwJnGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NDyLM/A3tjATlEba"
Content-Disposition: inline
In-Reply-To: <CANiq72nNz6Xo8yu0nyC3OLAJiAA9A86a7Ku59YX0GD-cVwJnGA@mail.gmail.com>
X-Cookie: Absence makes the heart grow frantic.


--NDyLM/A3tjATlEba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 05, 2026 at 02:02:11PM +0200, Miguel Ojeda wrote:

> I don't follow. If it were to be agreed that linux-next is the right
> place for those tests, then those patches could simply be extra
> branches that Mark could merge at the end -- no need to `git reset`
> the "normal" subsystem branches.

> In other words, just like you are doing with your branch, essentially.
> But it is something that needs to be agreed upon first.

Yes, this is a good approach. Branches can be added or removed
pretty easily so there's no problem on my end - I add temporary branches
relatively often, there's currently one for Uwe's device ID reworks for
example.  Sometimes trees are managed in a way that makes it easy for
the tree to do this locally too (eg, arm-soc merges all their topic
branches themselves) so the maintainer might be happy to add things to
their tree but if not then a temporary branch is a good approach.

If for some reason there's some difficulty in working with the relevant
maintainers (eg, they're just not responding to mail at all) the process
of asking for a branch to be added to -next is also a good way of making
people aware that there's some issues and having some degree of
coordination.

--NDyLM/A3tjATlEba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpKTCMACgkQJNaLcl1U
h9BKegf/fEUWxJwNZmI4OM6mWTYHbu2Bu8aAGemmTHKq56E9hILXU8dT83Jnpud1
V8h8DALUhIG2WKFMKRtpI+kq3Mog0I9k7haG1m8vo7tih4LgNrK8obJrkWIKe031
scPXQf2uazTRK83OENiNO1n5IJ6nJzbVpaDjcY7sctHJLCe4/vcKmbSeIOhq+9wo
/tAIxwhCTlMxkfN3MilvswAAByGwmX1cQdlvksn4j1SjLTIwk0oOIxuiTeOYiS+n
vPwX/DhoKleU6RKQyOAQ3omZIAw/Jogw9Ww9popi4q1QMDCd770kLCC0x+IG4Ccf
1auFocbHmDvGdP3Ozj1D6+EXXT9RrQ==
=iYyN
-----END PGP SIGNATURE-----

--NDyLM/A3tjATlEba--
