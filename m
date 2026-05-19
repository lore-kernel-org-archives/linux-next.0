Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C604033F5BE;
	Tue, 19 May 2026 08:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179189; cv=none; b=AWuGtjh+Bc5uTNduuCq0uYXBU9SUMcJVvDFU2C8dPOOQKwqVoC7y2PnRO/DNw3TZoQss6G++eqmQg0eXvcc0LbRtipoPp+5keUWJL/xNOT+uRkJbLTnbJ61JDlgYuOYPyMHq9PQHSciTUW70+z3ecz5/YZv24mQsJxrfT0qnOiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179189; c=relaxed/simple;
	bh=AHFnTVP/YBSdy8U8iWzS3dTrld0snUt+8WP9KKibpFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVIAp5tUSnGuA1PaWIbUI/vmxuegBHmJN1yqu4hQIcUOLRY4S5s1pXZgsJsD1qoJRf/S96vHsAP5Ja8Bv7J3RWH5yu3t4rn2RqdGvXMOrNDnNLtQ7YkOBXjZ5L4JNM6RxAqgzB7HXeLbqhYNDGsahUl3Tq8TrQtef152DUXgxxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNvucwUs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNvucwUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E60C2BCB3;
	Tue, 19 May 2026 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179189;
	bh=AHFnTVP/YBSdy8U8iWzS3dTrld0snUt+8WP9KKibpFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNvucwUsCu+039p4WSNrhnMES1h0Y+vCfrkGGFZKdtz3yjcYgLbqvYKJZntwjs3Yv
	 Jv9rRimuw3ApoTNcife9vvOxzeB1fu8jyOsSG92WI5OIt1QEzTok9CrdlOyROx4Je7
	 XV2u3mow2IhUCCXoJjaP1HcKqDSxprO85fLpRA67yh8ZGE9wYM20TTEOqbzPwRQO1Y
	 zDGJmj8Svy1m5K9IofeniG7KsFVB+Fu9VhmWAJKDtox+Daqp2Qj+M7pnwUJg+ZhrX2
	 GL9XE4gru0y+kLWPSK2tCtiwhEtDlvknt1eiobQSh0OE8cmQajZb/Q0yekINVsfzwI
	 s74/ag35n7epQ==
Date: Tue, 19 May 2026 09:26:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the mm-nonmm-unstable
 tree
Message-ID: <6c01ab97-e3d4-42ae-bdce-b73d660fe68d@sirena.org.uk>
References: <agr_RxvNtfASfevg@sirena.org.uk>
 <fabba1ab-ceff-429c-af55-92844b179890@sirena.org.uk>
 <87v7cko7fp.fsf@oracle.com>
 <87mrxwndhl.fsf@oracle.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knk4HDML2660XOAz"
Content-Disposition: inline
In-Reply-To: <87mrxwndhl.fsf@oracle.com>
X-Cookie: Huh?


--knk4HDML2660XOAz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 11:02:30PM -0700, Ankur Arora wrote:
> Ankur Arora <ankur.a.arora@oracle.com> writes:
> > Mark Brown <broonie@kernel.org> writes:

> >>> Note that we are running on an arm64 host with access to KVM so the
> >>> above should be running with KVM rather than being emulated.

> > Possibly because the we got scheduled out while running the test. Not
> > sure why the test started failing now. I'm guessing the VM running the
> > test isn't under CPU stress and the like.

Yes, the system should be doing nothing except run KUnit and any random
background stuff, it's pretty high end so any background stuff shouldn't
need to disturb KUnit.  At some point I will go back to running multiple
tests in parallel but didn't do that yet.

As I indicated above I'm fairly sure the main difference is that I'm
running on actual hardware not emulation, though I do think there's
something else that made it more prominent in that situation.  I'm
fairly sure Thierry was using emulation while he was running -next.

> > If that can happen then I should relax the second condition.

> Thinking some more, the condition is much too strict.

> Instead of:
>   succeeds => (runtime <= timeout_ns)

> A better check would be:
>   !succeeds => runtime >= timeout_ns

> I'll send a patch to that effect.

Hopefully that's it...

--knk4HDML2660XOAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMHrAACgkQJNaLcl1U
h9A0pwf/dFmQ4Iye/e77thEWJ+mwdwzB93NFTmym95sZHfnfWdnOm57X99xTL8zv
XRaAVdWrOPEL06hmF2wksPd5DayOztD/ATGozttxj+TWQJOM1eKd5h+EgSElzumL
TuQFI+yWY40y0oL1PaxHLcpQZHbLB2xcTyRM8Se4cUNr9U5Fdbm0O18qFBmg92L3
9k7xZBBQTrs/wGEAzFab+VlqjHkuZzHCsR2HcMvXTknLHdns0xQdCkPW55pJ9cBa
T3aN++EAAkhixdXl/dLd0r0pOIUfIi44nCpMAYXkHYmwQ21+KWgDt7wpgAfQm0/5
+kYSx0gssHA4xaPo29SqxxtlHovfCA==
=xeQP
-----END PGP SIGNATURE-----

--knk4HDML2660XOAz--
