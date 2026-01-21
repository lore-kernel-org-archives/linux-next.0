Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0A24968F7;
	Wed, 21 Jan 2026 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007417; cv=none; b=tqu85ey6B+J6zc3Fc5MXHabP0Mw+BvWURnf3Li1AZBZwfwYCl+UELnuwDegchl7Ai+M2zf3Vb/1ERhXBf1fKXJ+18ILCdqbEpWev/xoFCqu+QD4iDI8erp9705XIwCayZmVo9GQrnE0bZYlXFG/0hu+AE4daF9ph6uoibPysqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007417; c=relaxed/simple;
	bh=9YTT/qT1y7z6jx9j8nFJC5ykVWV2gTWA4ah0iqMhrUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubFmcWPapl/acBMlss9ROILX5Ol92TkJ3Ns7rGxuFxpZsGTbUh6GnVqvh276HYrBw1h2ueIXaDUhS1hNY97f02P5kHCQv6DpojKXGHCpf66/jHkrPIYM3hieFBmh7Wq8z4Ls1fPAQ3uvJmOV1uqLLtKYrYnLel83Xs1eJ1Mspng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2DJ3cux; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2DJ3cux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42797C4CEF1;
	Wed, 21 Jan 2026 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769007416;
	bh=9YTT/qT1y7z6jx9j8nFJC5ykVWV2gTWA4ah0iqMhrUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2DJ3cuxMiPeNcs+3iBItvCzn9UrmWAEFfYkcuKa4F4Xhl857occgwnwMXn7JGF8i
	 9P6Il63Hm2FUgD5WxSs1AgR+VMVEQ04x44Bj4Zm9PH64orA4kKYz0eYRcPKJogCHRj
	 NQrsl3LPdOQ3BGD0CRrkD2oP42eCGhYXcxlOq+Nfgbi2zQ8ohGdKKox/0inGqSsft/
	 3q5CfuuJaqEq+l4azb8xa7RvzWLmStJ4Zr2UZgWrnlhe0G05Uyzx0w1ViLAIBdEKJ9
	 a439FmtOlTozdgadmymUngmBodS/MQ2nw66u04HiuctkAxkvqH9pmh+MNRaDLb8o1O
	 ct5noBxt2BBvw==
Date: Wed, 21 Jan 2026 14:56:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <b17da8b5-6640-46ea-ba73-d2f4a08e246c@sirena.org.uk>
References: <aW5xqLq7gatOy1DV@sirena.org.uk>
 <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
 <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk>
 <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
 <aa4bc767-8128-440c-a2a2-81fbb6992a8d@sirena.org.uk>
 <CANiq72njSUPt2CvjBiNyKw1KHSgnMdcBnXNL_pHV4iURYL1n6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GNZ8fgGYI+rqJD/6"
Content-Disposition: inline
In-Reply-To: <CANiq72njSUPt2CvjBiNyKw1KHSgnMdcBnXNL_pHV4iURYL1n6g@mail.gmail.com>
X-Cookie: Eschew obfuscation.


--GNZ8fgGYI+rqJD/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 11:08:40PM +0100, Miguel Ojeda wrote:

> Are you checking the `git status` after `make ... rustfmt` or similar?
> Otherwise, you may want to use `rustfmtcheck` instead.

I'll update my notes to rustfmtcheck, I presume that exits with an error
if it fails?  I'm not actually doing any of this Rust stuff yet, the
builds that are done are just what happens when all*config sees a Rust
toolchain installed.  I've got a small pile of things I'm going through
one at a time. =20

We do really want things to respect O=3D, all the -next builds are using
that, so if anything shows up in the source tree that's a concern.  I am
bodging that for the kselftest build at the minute but it's not great.

> `CLIPPY=3D1` will catch stuff that we want to keep clean, i.e. if there
> is a positive, then it should be fixed, thus it would be great if it
> is run on linux-next integration. It will break the build with
> `WERROR=3Dy` (it just adds more warnings to the compiler), so I think
> you should be able to just reuse your workflow/automation.

That is not going to be usable if it fails -Werror builds, Rust is only
enabled by the all*config configurations and they turn on -Werror
through the same process that they turn on Rust.  We really need -Werror
to pass.  I can set CLIPPY=3D1 for other configs then if they enable Rust
they'll need to pass cleanly but then it'll just explode when turned on
if there's lots of warnings which doesn't seem like it'll help Rust
adoption.  If we were starting from a point where the build was clean
then it'd be more viable.

> More details on what I told Linus back then:

>     https://lore.kernel.org/rust-for-linux/CANiq72kkjGVAtWNZjz5VGen4xoVLf=
Ra+Wv399PUO=3DEfcA4TEfQ@mail.gmail.com/

I should be able to run rust-analyzer to verify that it doesn't error at
least, it looks like rust-analyzer unconditionally outputs into the
current source tree, but it is just one specific file so it's less of an
issue than random cruft.

Running rusttest is a bit weird in that it requires a kernel config but
seems to work fine so I can do that, I was already planning to run KUnit:

|   RUSTC T  /home/broonie/git/linux/rust/macros/lib.rs
|=20
| running 0 tests
|
| test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered ou=
t; finished in 0.00s
|
|   RUSTDOC T /home/broonie/git/linux/rust/macros/lib.rs
|
| running 10 tests
| ii........
| test result: ok. 8 passed; 0 failed; 2 ignored; 0 measured; 0 filtered ou=
t; finished in 0.34s

The build seems rather serialised but it's not that big so not a big
deal.

--GNZ8fgGYI+rqJD/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlw6TMACgkQJNaLcl1U
h9ANvQf/euByicnQQ0xxi/nQSbPgowgSQ6Syla73Z4hKrO2fUF9iK8mQCsDl0BR2
OLcukeepH482N5Oi5SwhkkFcThWzx9KJBghyapNAbFLVK/yLlC+NQ7yKiM+zZ7KD
ICIycfB3n+luEWww0qij3yXfRv64UR/Mous8gWMPgU2OncwEMzKZxytAtpjXyS2w
tJw0HFfhu4HdCEwwKzv7FH8l1AVsz8yL+8SvEofBsPx2yF1xHEBlXC3ivnz8M/au
M+bh3N3jlw9Y9gkTmTgQS6UQNTR0aaxJBIr656n3iFtPnNR8Q+wURqLQd7Cgkf5y
Nm9LOBK+s7n6s4r/7GB4KVN9n9cKsw==
=vLaz
-----END PGP SIGNATURE-----

--GNZ8fgGYI+rqJD/6--
