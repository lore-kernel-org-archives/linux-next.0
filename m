Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681A737C90B;
	Wed, 27 May 2026 16:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897772; cv=none; b=s58175AxF+GYKYjPI40oQ+f9X9vO0igD0M5FyWZ9L9OM2jyI2NM00Kx6004TTtwOPNhyM5XWMyc8J1tsEmYB44xIxkctWaP9+9gPyzBef543/h7Rb2m58v1qW9xowBCK0/o0J7qiXHDveDYqW8HjU+4z6hKetXevdHi5xHOW07s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897772; c=relaxed/simple;
	bh=81JQs5ogj/xYD4Xnsr3UPI7lfhQ5IyAkvbUIkuUOG6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZA9I3xxlgttpAAvaagZV0qHTODLEFKQmh+TFDapdsXAVOfQ9+yZNR/YqJ0LFMUPkyVFxKfwCFZcxUJ5baf6XbAwZyOYRBvNZMkphzlXCzc5wuryxI0HQQNWPJSVZsjmN2JRuFsgiXPLAPPjCA4FLB3T9BKhVbgkMB7HOs6vmaps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKz9jO36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKz9jO36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69A91F000E9;
	Wed, 27 May 2026 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779897771;
	bh=9y/lj6HguzXRoAURDXWldpYQZVg33Om3iW5WPUp6RSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JKz9jO36G/yBq4V0DSuP6eaMY0YRT2kV5LyjEa/r4ZAOkdAGJvdgL9ttSeJYkI56L
	 Zt2Wj4YK5Z3LAznZRltF+2PwbKYarltl0AjrDQR5EEpfPfLYKKTN216wa2FlwdquMG
	 kAkAV1vsfiNnw3k16Rv7EeZ1cRbNsmrkuYoOyPYuJ8yti/6Pwpwbtp+Ae/tOQqJdzc
	 6xD0qiWqscj6dRBj5mGbHSqtKkK7PfmAS9K7hTlOF5hHLiAlNNuR86L0UDZhaPTVGA
	 RmCEj9moW/TlqAssEP+e09dzBszg4Aa4t7/JmSKBuNPecQHCpKGE4zz3P6sMHWTnuG
	 3wuURrJ+XtIYg==
Date: Wed, 27 May 2026 17:02:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <a241fab2-f78b-4d61-8f6e-8b2ab3050d58@sirena.org.uk>
References: <ahb8y-KE12lOUIVz@sirena.org.uk>
 <a9f231c8-f48a-4743-97f7-6ce7f545b400@kernel.dk>
 <d2ba5386-03a7-41c6-ba67-b44ffa85e403@sirena.org.uk>
 <3f516364-f281-4671-9890-bf00e7c5b041@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Eb5uLCg/PR1XTDCb"
Content-Disposition: inline
In-Reply-To: <3f516364-f281-4671-9890-bf00e7c5b041@kernel.dk>
X-Cookie: You are fairminded, just and loving.


--Eb5uLCg/PR1XTDCb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2026 at 09:00:02AM -0600, Jens Axboe wrote:
> On 5/27/26 8:55 AM, Mark Brown wrote:
> > On Wed, May 27, 2026 at 08:39:16AM -0600, Jens Axboe wrote:

> >> Hmm, not sure we should let rust build issues gate whether a tree is
> >> current in -next or not. For, by far, most systems, it's not a
> >> requirement for a functional device.

> > That's also true for a huge proportion of the issues that get caught
> > with an allmodconfig, and allnoconfig is not exactly a realistic
> > configuration either.

> While that is true, the big difference here is that everybody should
> build allmodconfig themselves, but only a (much) smaller subset of those
> have rust enabled/available.

Personally I had to install a cross toolchain to be able to cover this
x86_64 stuff everyone seems to think is important. :)

More seriously I'd hope that people maintaining stuff that interacts
with rust have a rust toolchain available, it sounds like you do but it
silently got turned off without you realising.  If we're getting into a
situation where rust is routinely getting broken by not obviously
related stuff we might want to reevaluate that in general, not just for
-next but so far I've mostly seen what rust breakage I encounter be due
to rust specific changes which really ought to have been tested by
someone with a rust toolchain.  TBH given that rust conflicts come up
moderately often I think I need to have the build coverage just to catch
my own obvious errors.

> > that come up in people's coverage tests.  TBH the rust stuff originally
> > got turned on because I ran the allmodconfig on a machine that happened
> > to have a usable rustc installed, I was intending to enable it at some
> > point anyway.

> I think it's good to have coverage, but I think it should be more of the
> notification variety than a gating factor. For this particular time and
> branch it didn't matter, but sometimes I shove things in there that I
> absolutely need a quick test turn-around on. For exposure reasons. And
> getting a -next cycle delay on that would be unfortunate, and I think
> also unwarranted if the only issue is that the rust build broke.

OTOH part of what we're looking for is ensuring that we don't spend the
early part of the release cycle sorting out build issues that came in
during the merge window.  I agree that there's competing needs in there,
and we also have fun with things like both x86_64 and allmodconfig
turning on -Werror which opens us up to toolchain differences causing
trouble.

One trouble with notification only for things that break the build is
that it becomes hard to detect and work with it sensibly, and one build
break can easily mask another build break.

> Does highlight that apparently my build no longer does rust builds,
> which it did used to... Something to look into on my end.

Do you have KASAN turned on, or are you doing something like
allmodconfig which turns it on?  There was a change to make rust
incompatible with KASAN when used with GCC:

  https://lore.kernel.org/r/20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com

that caused me issues.

> Not trying to start a debate, just voicing my opinion on the matter :-)

--Eb5uLCg/PR1XTDCb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoXFaYACgkQJNaLcl1U
h9BVBQf+Osj3eiwH4rW+DHrKFLPJDM4QirZuqG6yLPaOH0o9Wb0AH8c6X0y6oNUi
YnlQi98wM+CGEI8BfscEOh2cx5kSmIJo5dRWPmM4ERElwno2ZTztgT/fOCUGMgUv
OBZK7ghGG5UucN5dJe27PPZ1A2KfqKd51hqChkiRLEyZ1e8vPr1AZ6HBYGK0v5Op
cABQRDYOaFni4v7jZc0Zon5xxMWmoiAy/YIHw8RxgWOEgw6FrBXkvCtiuj+DjoQX
r74i+eBK0A0qQ/2PfvkbR1PYBgTKvUdx3PU+5ghbwxvmH2tloXJiLcAp8+QEB0Ul
mQcR5GjcwO6CfPp3+lvGsoDNnSZwQw==
=BqS+
-----END PGP SIGNATURE-----

--Eb5uLCg/PR1XTDCb--
