Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5168B36E47F;
	Sun,  5 Jul 2026 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783253210; cv=none; b=eX4jZs4OHlKYvu93CzjaVEspqEkJqfg2mHrvDHtVdbqHyCwYNRUI0X41Z2lb7WR+4YBYZbdR1STZX42uVjwLbko/3ZFPgC40oz/RTw+QVR6SMFibYCNIt396IWx7otjwlTZB7/syxtKbp00S5E+UG3WivpADsQhoBXjuNVwfGDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783253210; c=relaxed/simple;
	bh=TJyEZRYZ4VJrqbyQVMyQ+NXLD2nwvzgesEXMY//Jj3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MObTWAz5oMgC0BJNwgzwBvjLSHHCu6wq4u7T0wAdH1v2OFpn3gh4Pgn8SXw5Z8KaKIjGWsV3gbNXnvw0g1xlKINNbAs5UL7+zjUMmKJ0VLmLRPCGk6SQFqG+rt4t5gmHnDGe3RBTbHh7LbQFRIrglUlGYTkDanqH4drOc1+z9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nByx9Dy6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nByx9Dy6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B036C1F000E9;
	Sun,  5 Jul 2026 12:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783253208;
	bh=W3223BB57HLhg2RHbxz1ms1XkMGMNaRhY89SSnohc0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nByx9Dy63io6ssHjLEK2kv5UY2aoE3Y+X26TbDGE5GZ0zoFMxMRVagqqjJ9GfvIN4
	 CnHd7Cd6F+UcdDXlY5ngoC8mWeV8+Jhmx5NhZu0erNmKzp78uSbH2SwNM/cRWE5Eh3
	 WThCzR0LuIMech3T6Vp5XLKwLwA6ssGJg6dP7+j49SqDpPgzHWe0qINLftlj2METWg
	 OcnKrxcZH6t3syQ6q/IZBBGQ4rJRwFqdVZAbNjvwfQZysHuxy4mQOZAtKh+KPRUgw8
	 lCa2jgO+Guq4IfQ6CImVqx0OHEDC1T4z9/tid4W3KtCvJnRYlZYwdUeTQufYX6n/6R
	 OFCxkYmhiRCdg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id DE1201AC5AC6; Sun, 05 Jul 2026 13:06:40 +0100 (BST)
Date: Sun, 5 Jul 2026 13:06:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Alexander Potapenko <glider@google.com>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	mingo@kernel.org, gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <akpI0IIqgXCXmQhQ@sirena.co.uk>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cUCNm4H/iBiJ+1wC"
Content-Disposition: inline
In-Reply-To: <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
X-Cookie: Absence makes the heart grow frantic.


--cUCNm4H/iBiJ+1wC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 04, 2026 at 02:06:43PM +0200, Miguel Ojeda wrote:
> On Sat, Jul 4, 2026 at 12:15=E2=80=AFPM Tetsuo Handa

> For the latter, it simply says that sometimes debugging patches have
> been added in the past to linux-next. It doesn't say it was done
> unilaterally. (And even if it did, it is just a third-party document).

=2E..

> I understand it may be nice to use such resources, but the solution is
> to talk to both sides, as you do in that thread. From what I see, they
> even offered to add a mailing list for those patches:

Right, this seems to be something where people need to talk more.  It
does seem like there's real communication problems that need to be
addressed, it looks like some progress is being made thanks to this
thread.

Just dropping patches into -next that people are unaware of is going to
cause issues sooner or later.  Either there'll be some direct collision
with other work or (probably worse) they'll cause someone to think that
something is working better than it actually is since people testing
-next are testing with some extra stuff that the maintainers weren't
aware of.  It might be that the most sensible thing is to have some
extra patches in there for a period, it's an expected part of the flow
that things might get backed out after all, but we want to avoid
surprises.

> > I'm fine with announcing to ML that I am about to make debug/temporary =
changes.
> > But we might want a prefix for debug/temporary patches that are not int=
ended for upstream?
> > Also, we might want a kernel config option (e.g. CONFIG_DEBUG_AID_FOR_S=
YZBOT) for
> > minimizing users affected?

TBH I think a prefix is probably not needed since there should be a bit
more communciation about what's going on than just posting the patch -
some discussion about how to debug whatever's going on for example.

--cUCNm4H/iBiJ+1wC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpKSNAACgkQJNaLcl1U
h9Cchwf/Ws68GVi94oCcc+zhpbhf3JI+7hXqzOk8XcmRvqtSh5sLySQsbZztNyXs
IZhx/uhx5Cq1P9j8p/EBOnVWnvI5E3FMYKrx3X9l8nljvUoKTNZ9TNW3dOg9Rg4K
d98IsAkNiQwZztRXLa59cdEFvU4FwTdvarGEwSoTXbXqXhp7HVAO5/L312OTTH8O
X+8rzmEktsUdpGnvJhlQC3jubzJeCFB455QplBb5dAueCvJi/8WrqmwL+wqNX9N+
XYAUkmMct54kk/HVH5yxiGv0J/6VlBI2CnJsXC5cageXLsK/U19u6ZJbpkqUIOz+
fUUv1K5nWd2KJ9S0oPpWd2wXql9kSw==
=jO+g
-----END PGP SIGNATURE-----

--cUCNm4H/iBiJ+1wC--
