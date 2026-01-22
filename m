Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171843D50F;
	Thu, 22 Jan 2026 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083996; cv=none; b=stCmhk4we3yVlFStcweQzINaLQvQ0uxfcUxioD7sFG5wxQZzhVd/fXPoHSIfst5X6gT7qa+vltdqHgBuCkCuN9QrLEku4la5Q8wh4oIkNkJt5wAz9jUmD6Q2VDS2ISDcdhj7OIvfiEsX77Xshm0AFW0przR+N/D3KkbLj5HaAaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083996; c=relaxed/simple;
	bh=jhpgN/O8oGBKjvwE9kChMxn+SglWsPjK3/TEsnXjqWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzE2dfIXibHApCkcO3t0cN5SCoTyKExrkJ6ADYOa/CNq1ydjPZMe0GEMjNg5EQeQrpP1zsYKuBbKdtrTrSgxtQt5p7cgvfI03u2N8Igzs4cDRYyhkLecJ7C8q1sVrPocoOpJ8RG2M1ED/233OguhszZhgTNh9JoIX3plhf4somo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=narPZWfU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="narPZWfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C477C116C6;
	Thu, 22 Jan 2026 12:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769083996;
	bh=jhpgN/O8oGBKjvwE9kChMxn+SglWsPjK3/TEsnXjqWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=narPZWfUWUJ2s4Lkz+rnXLHXswjLwx0j/A85Ev69AMnp+ahRRuiP+SJMK6lJGtArR
	 yGIXSTcVEI3LsZdd/QuVQidAfZW3EtK9Yqh2SAST/okc88a6K19L8mv2lliBGEueDG
	 VptEfY7rFjPCwJklAYTw4KA/FWcr/rdOQ82amLCu+TWgInHVvs7f49sphmcOPaGXwv
	 ud+6tI7r3VwEZW1i/uPKOxRfl5rAP15ATFnlqmnS3cHdEoVra6gT31ijbSddjPg8GX
	 yvNmQcLd5Mb7di2oiwX4OJBGpbfhakZ+9MPrACA9StA2xEIc9DRAjOLnFh71ANf++f
	 r7PnAxazkDaaQ==
Date: Thu, 22 Jan 2026 12:13:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: David Gow <davidgow@google.com>, Tamir Duberstein <tamird@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <8cc01720-427d-4cec-b4d0-721b22c47552@sirena.org.uk>
References: <aW5xqLq7gatOy1DV@sirena.org.uk>
 <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
 <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk>
 <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
 <aa4bc767-8128-440c-a2a2-81fbb6992a8d@sirena.org.uk>
 <CANiq72njSUPt2CvjBiNyKw1KHSgnMdcBnXNL_pHV4iURYL1n6g@mail.gmail.com>
 <b17da8b5-6640-46ea-ba73-d2f4a08e246c@sirena.org.uk>
 <CANiq72kT9ThJcr5W0OhBmbwKZCpULjUehNjijTt8W09yB0CxSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ekuCCvqRL9kAMAAc"
Content-Disposition: inline
In-Reply-To: <CANiq72kT9ThJcr5W0OhBmbwKZCpULjUehNjijTt8W09yB0CxSg@mail.gmail.com>
X-Cookie: Don't read everything you believe.


--ekuCCvqRL9kAMAAc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 07:55:39PM +0100, Miguel Ojeda wrote:
> On Wed, Jan 21, 2026 at 3:56=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > We do really want things to respect O=3D, all the -next builds are using
> > that, so if anything shows up in the source tree that's a concern.  I am
> > bodging that for the kselftest build at the minute but it's not great.

> Not sure what you mean about `O=3D`. Using `O=3D` is supported (both for
> the subdir and external dir cases which are slightly different in the
> build system). Modulo bugs, of course.

> If you mean to ask whether `rustfmt` creates files: no, it replaces
> in-place, i.e. by `git status` I meant you would see modified files,
> not new ones.

I was asking because you were mentioning checking git status and since
we are doing out of tree builds there should be nothing changing in the
source at all.  I think with the way we get trees to the build machine
it won't make a difference in the end though if no new files are
created so it'll actually be fine...

> > That is not going to be usable if it fails -Werror builds, Rust is only
> > enabled by the all*config configurations and they turn on -Werror
> > through the same process that they turn on Rust.  We really need -Werror
> > to pass.  I can set CLIPPY=3D1 for other configs then if they enable Ru=
st
> > they'll need to pass cleanly but then it'll just explode when turned on
> > if there's lots of warnings which doesn't seem like it'll help Rust
> > adoption.  If we were starting from a point where the build was clean
> > then it'd be more viable.

> I am not sure I understand. `CLIPPY=3D1` is intended to be clean, and
> over time I have sent patches to trees that break that (same for
> `rustfmt` and `rustdoc`).

I've been seeing people saying "oh, just ignore the warnings" on the Tyr
issues so it wasn't clear to me that people were expecting things to be
clean.  If things are generally clean that's fine, and I can hold the
trees back in -next if they introduce errors like I would with anything
else that does that.

> That is why if you could enforce this in linux-next it would help a
> lot, instead of fixing trees after the fact like in the emails above.
> Things will still slip through, of course, depending on
> configs/arch/... etc., but it would definitely help catch most of it.

Right, and there's the issues with things only being built in which you
said you expected to be resolved soonish.  Let's see how it goes - I'll
wait until the build is clean before enabling things (that had been my
intention with building at all, I didn't really register that all*config
would turn on Rust when the toolchains).

> > I should be able to run rust-analyzer to verify that it doesn't error at
> > least, it looks like rust-analyzer unconditionally outputs into the
> > current source tree, but it is just one specific file so it's less of an
> > issue than random cruft.

> No, it outputs to `O=3D` -- if that is not working for you, please let me=
 know.
>=20
> i.e. that should not be a problem even for e.g. read-only srctrees.

Ah, great.  I got confused by the make rule just having a plain
redirect to rust-project.json with no irectory prefix.

> > Running rusttest is a bit weird in that it requires a kernel config but
> > seems to work fine so I can do that, I was already planning to run KUni=
t:

> We used the `rusttest` target more in the past, before I made the
> KUnit integration of the doctests, but it really doesn't do much
> nowadays and carries a fair bit of complexity on the build system. My
> current thinking is to migrate those tests and then just make it no-op
> until we find a better use case if any for the target name. So it
> isn't critical if you don't run it.

OK, if the plan is more to phase it out for the time being then I'll
just skip it.

> Now, you mention KUnit, and that is very interesting!

> The overwhelming majority of our tests are all in fact KUnit-based,
> e.g. these are our doctests (i.e. examples that are built and ran as
> tests):

>     [  2.714912] # rust_doctests_kernel: pass:283 fail:0 skip:0 total:283

> but we also have a few other suites that come from `#[test]`s
> ("normal" unit tests), e.g.:

>      [  2.260774] # rust_atomics: pass:6 fail:0 skip:0 total:6

> So, do you mean you plan to run them under QEMU for x86_64 or arm64 or
> similar? That would be amazing for us! I didn't know you planned to do
> runtime tests.

My current initial plan is:

    ./tools/testing/kunit/kunit.py run --alltests --build_dir ../kunit --ar=
ch arm64

but I didn't actually turn that on, I want to write a wrapper that
reports any failures in a mail ready format.  I'm not seeing rust in
tools/testing/kunit/configs/all_tests.config though so Rust wouldn't get
enabled?

> Now, if you mean UML to run them, that is still best-effort with Rust,
> and it may or may not be completely clean at certain moments (Cc'ing
> David, who has been driving that and done a ton of work there).

I can't use UML as my build host is arm64 and UML is x86_64 only so that
won't be an issue for me.

--ekuCCvqRL9kAMAAc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyFFYACgkQJNaLcl1U
h9CrLAf/aoASzSH7II1//qR6yAMAyMgqn9qpLdlxiCYHKT8379EisJp+x2jXm3bP
89OQKIe3mphMvxOcZZfS8aYR5bQogPAWHCIQwa6wezxB9ilD1vOt795u1tkox5eQ
WLbzXsOFM5FLRvi6OrbMguEyxG4KXVPb7XesBsruIjGI2s1iDDY6Fen/MuzHa5sH
IWdoFhLHYbA71B/tGxl0+pMcvXPOLaQWcbwcjP1IR2WFGTXlfMil9yXor9sZTFa5
aa+oMPIui44az9egKd2P7umJBMPECN5dGHcdWBgzbWRhlv39PU4/TaFwtmGfQElY
m2a9jQnLCfmpFIxt3y/Vf8/nWt105A==
=53h5
-----END PGP SIGNATURE-----

--ekuCCvqRL9kAMAAc--
