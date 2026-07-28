Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C6F305692;
	Tue, 28 Jul 2026 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251819; cv=none; b=LfXVAZ4S9P6oIcOrz5TPxymB/NVNSJ2DYEHYpeoMoxX5qO5672ym51b3v8WlHq31+xzG5KhsfjpQJDrt52+cOkSr0MjF4wKwGjnsGFi3gYH7pWu09noTMujsyO4JxY004/kJulU7RStI5mnaRE4A0oFCzno+iSs3z7RYq4G0EnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251819; c=relaxed/simple;
	bh=kcTc2e0GD239OxwFej/aSbZTIzmU1Ak8lnq9byGKfhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0mYJmmTwFHrieVz0HkDmSq5Ug9eT0ZwADuALojbQ7Gw0upE8YuWir3W6frv160B4jVDHDYFs7FVBq5iG3g9PHchOWTRo4osWNyX30O/F7+JGg7CzU39eyN6JYrEi1abtkoLlLIyUFXXI00nOX2tyo/cVmrQ5QCMWf1B/cNQGYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DB5fKf4j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DB5fKf4j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ED21F000E9;
	Tue, 28 Jul 2026 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785251818;
	bh=uChjWCOBBg2tkvSmqCgfhyud8TZSuL7bavJgwvz5HuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DB5fKf4jIFVuKLQC50Sw7ySubjGv+Ymd/afRNmtyRHSVFQmJ45wNGEcByBP/5nnbi
	 AD+btxoYbyGpz3xh8NjE799CRdAtXFw+Isf2GpUuixD1EgDTDK0Aab/feqiwPdBfq9
	 tJFLgS20m1NpHz6CHFtDsWRDYPncD6ArAMVxE5jm1kyIdjc4jYT4wBNj90lDWnDYkk
	 g2whuGWOpdmb/lpAtmO4aA1bZoM/A7os9Qo1C+2UCcX5RuH4eJ1Y0pnzZ010gCK7hi
	 02stTNYDxspD8/obPt3+Y0b+X2GXIotaHuWr1aMk/OTmUCa40CRqCXZy268B8WHSkz
	 eeaPhjSc678wg==
Date: Tue, 28 Jul 2026 16:16:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Daniel Stone <daniels@collabora.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Theodore Tso <tytso@mit.edu>,
	Alexander Potapenko <glider@google.com>,
	Christoph Hellwig <hch@infradead.org>,
	Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	mingo@kernel.org, gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <e42fcabd-a2a4-47cd-a3bb-fcf69c824dfe@sirena.org.uk>
References: <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
 <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>
 <43a46fbd-acea-43f6-99f4-c8b866a5f9f4@I-love.SAKURA.ne.jp>
 <c7b9cce5-5d69-43db-91c6-10f6bcd07b68@sirena.org.uk>
 <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CgyY07uJD8+KsVn9"
Content-Disposition: inline
In-Reply-To: <cba31f88-09f2-443f-ab0f-b2b263750947@I-love.SAKURA.ne.jp>
X-Cookie: Stop me, before I kill again!


--CgyY07uJD8+KsVn9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 28, 2026 at 11:46:04PM +0900, Tetsuo Handa wrote:
> On 2026/07/28 2:39, Mark Brown wrote:

> > This really just looks like another case where you (or someone) need to
> > commuicate if something is urgent - I would have a hard time telling
> > from that thread that there's a particularly big problem, the only reply

> That commit says "Drivers triggering this warning must be fixed.". That is,
> they know that it is expected that WARN*() fires. But they don't know that
> syzbot stops upon encountering "BUG:" or "WARNING:" within printk() output.

Right, I think some of this is the difference between "needs to fix
this" and "needs to fix this right now" - WARN_ON()s obviously need to
be fixed, but it's not so obvious that it's a major disruption.

> They also don't know that syzbot builds-in almost all modules into vmlinux.
> That is, initialization functions of most modules are executed upon boot.
> If one of modules emits "BUG:" or "WARNING:" line, the boot fails.

Oh, that *is* surprising - more people tend towards heavily modular
kernels than fully built in ones, I suspect a lot of driver people won't
realise that they're impacting anyone who doesn't have the hardware
since it's not the norm.

> All new bugs which are introduced while syzbot is unable to update linux-next kernels
> are reported only after syzbot succeeded to update linux-next kernels. The "being unable
> to build or boot" caused by addition of WARN*() can break whole testing by syzbot.

Indeed.  I'd suggest following up on the fix with this information to
try to chase things along.

--CgyY07uJD8+KsVn9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpox+IACgkQJNaLcl1U
h9CeiAf9GkeLW3onj5SsEZscRO4XFqLM+FB1Lfel88AFE1VkCFhpo5qvDCx7Q4Jo
hq0upMd0WWUVB20vimkW0dJnlD2kKocYekYUdreSgJDuZ0XPkRZthGgsXefchw4f
YdMM0ADZ9O2KYMmrtfiarSMuBaDHlMGjMEbgqxmGv5dSX/ym9jPxkH0TL2XFWSJs
vhuwFm8sdttoi+br57PhgdfruTMjplUkgGATFFF+RZsBbx4L8jGNoB5V706DFlqz
lpNCeY6EM+1fPmuy/BTG85WM+idOWJeNPqDF/2wX0AUqIuQbjqQan3HaM3y6PCNy
ksN81l1+Bm+Jrzz/PdzYDnjLsYekWQ==
=lUHu
-----END PGP SIGNATURE-----

--CgyY07uJD8+KsVn9--
