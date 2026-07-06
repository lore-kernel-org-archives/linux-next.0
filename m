Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381B33876BE;
	Mon,  6 Jul 2026 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358629; cv=none; b=SQMIhjqe1FfRaMfXUFUbSs7Yq1/C6GP87myHjCnKTAcgzKrW8lOiGHZMSXzJPz/yxGOsQanqtfTQ15dmtJ5+Bd9YMdi+sjueRPHkag9jimEnfbrQF6D9gUhzGCR2weSifgwlM+YxQKW3X3hT230LrjGaU8spPCNlN2MUDnGKSqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358629; c=relaxed/simple;
	bh=fQukGKrYAnrySgkm3ewWgEUcGQkM3Ak6HXhrD0FgZYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fH8G2tHe+9dB3KrK8R2f+leW6CH/IYzxwB/JH4KyqDo5qybbxTaCQsFvc1LNu7uacJZjIphdKZzOv017E+2dhtt3MyiMumqHeBZECLldla6fTF5Ph0Io16plIMY3vV9zGPReXFEgY5XgPFYCS+JxvjyuCI/aWYQUPFkIRexmBU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3HVjhCN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3HVjhCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427381F000E9;
	Mon,  6 Jul 2026 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783358627;
	bh=qdhKu170+KA3bnwiKMBgmI8NUBrl7LRoTwQRZfrUjyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g3HVjhCNoKXZtpkTLMVrmhulqFUHIvWPIv/uEkjF8Tb70RS2HNVwXPJc4IIPJMydH
	 fOwpQNWQp20R1VO2TaIkHnoc7xuMPLPHvmzkWmfgcMNADfC31HWrfLA8Qc+giKM7Sq
	 H/brLaaqycXJov5pRUa683TXA60gkt4omdmAssmdZYZxx0B47NjwDEwloGwVbH5zvs
	 rc/rpw24ERBGNmoW1jWqmT7Yf3Q/7OXbza6G06zF1FbgH/XznMoTrXgfBnQWVHHFiw
	 KHFUuBvOmOwcTMCRee9o/Gmd3CPCVeQeURqOYZAtEX3KZGrf+Rt4hQqOdXGlG3TD+q
	 BMc3XrmlcyiSw==
Date: Mon, 6 Jul 2026 18:23:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	mingo@kernel.org, gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <c9872e4e-4447-4dd8-8242-3a9a3a7cccf0@sirena.org.uk>
References: <DJO29EZB2BIT.2AQMSG44P9M46@garyguo.net>
 <69f2f52c-a13a-4f9d-ab57-789eb4fdc335@I-love.SAKURA.ne.jp>
 <akZxfzEtam8yPXEh@MacBook-0RXW5>
 <7f1b93a9-f756-4bfc-81d7-1350ac1d50ac@I-love.SAKURA.ne.jp>
 <CANiq72=hLXip=gQS1tnLQxe6Kpwq03Bd8F1z_xLrdoCtvSAkfg@mail.gmail.com>
 <akpI0IIqgXCXmQhQ@sirena.co.uk>
 <4aecbe01-1ad8-488c-9a77-d5134def6f24@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MuQl0p4Hfo6us6Xo"
Content-Disposition: inline
In-Reply-To: <4aecbe01-1ad8-488c-9a77-d5134def6f24@I-love.SAKURA.ne.jp>
X-Cookie: Did I do an INCORRECT THING??


--MuQl0p4Hfo6us6Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 05, 2026 at 11:16:02PM +0900, Tetsuo Handa wrote:
> On 2026/07/05 21:06, Mark Brown wrote:
> > On Sat, Jul 04, 2026 at 02:06:43PM +0200, Miguel Ojeda wrote:

> Example 1: (not a problem with linux-next only patch, but a communication problem)

>   Linus's "None of this makes any sense." comment at
>   https://lkml.kernel.org/r/CAHk-=wjmFiptPgaPx9vY3RG=rqO452UmOAPb1y_f9GQBtuJVjg@mail.gmail.com
>   made Mikulas to say "I don't know what else to do." at
>   https://lkml.kernel.org/r/290bd5eb-9638-53ce-3c71-23b996d6ba54@redhat.com , causing
>   https://lkml.kernel.org/r/329e1951-0704-4d90-aeeb-ffc7123f4262@I-love.SAKURA.ne.jp and
>   https://lkml.kernel.org/r/9a05e50c-75c1-4452-b40f-f5a8b487f3ed@I-love.SAKURA.ne.jp to stall.
>   We need clarification from Linus or response from Mikulas.

That's less than a week old, and isn't it part of a bigger discussion
that was going on between the filesystem people and the fuzzer people
about how much to trust the data on disks?

> Example 2: (a problem with moving from linux-next only patch to networking patch, but a communication problem)

>   I responded to Jakub's "Have you see netdev_hold() / netdev_put() ?" comment at
>   https://lkml.kernel.org/r/20260325192214.133ffaaf@kernel.org but got no response.
>   I need clarification or response from Jakub. If some core maintainer asks network
>   people "Let's update all existing dev_put()/dev_hold() users to use netdev_put()/
>   netdev_hold()", some progress would be made. No progress as long as no response.

That one seems like you need to follow up, it's been a quite a while.
Probably mentioning the issues with netdev_hold()/put() (you said there
were some, but I can't tell from the thread what they are) and the
patches you want in one mail so things are more directly actionable.

> Example 3: (a problem with linux-next only patch, but a communication problem)

>   I responded to Al's "Not a peep in the logs, breakage still there" comment at
>   https://lkml.kernel.org/r/ebceac56-6a65-4918-b47c-1fb87aa66989@I-love.SAKURA.ne.jp
>   but got no response. Therefore, I sent an updated version
>   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?id=3ae78a69d3a9a4ad1d3b267324bd742654f40965
>   to linux-next, and I am currently waiting for syzbot to reproduce this problem.

Again, that one seems fairly new (a bit staler than the first one).  We
did have the merge window though, some people drop everything when that
passes.

It does look like you're seeing some stuff getting dropped on the floor
here but TBH it doesn't look super unusual.  There is a bit of an issue
in our processes with things getting stuck in a quite submitter
unfriendly way so you do often need to keep pushing on things.

--MuQl0p4Hfo6us6Xo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpL5J0ACgkQJNaLcl1U
h9CdZQf/VkyYDXjvdXw6YktGYTAG16idugD2OTr4p0mZgw8WgwrUDRkwojvTNAnD
EKjFLEaSOOO9rN0e7WvSNBZWA2gCKET5cy/P+I2rCsa472YlFlst+/Yx9CEKYS7Q
o/SOew7xPrjHb7feyjBJGBRExRwk4514uLv1NnplS6jrOtuhsHU3Yq9kf0TVioGX
YpznHTZeFPlJ2208JKRZyEQ1xHRYp6IJz9NqJNEhGNpDKnD3I/ZfiODwlq0ADPss
LPyxPTAnFTI+gwqYEIq35Hf9YBh08AuL1/RPghdDQCrNt6jklbyYAlY73LEv9Kyv
2DfAoA8wiOK/8VXta4a+JXg0Vbr5hw==
=eY9s
-----END PGP SIGNATURE-----

--MuQl0p4Hfo6us6Xo--
