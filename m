Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7730F319852;
	Wed, 27 May 2026 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891408; cv=none; b=WR0rrOcHKzLBv1hFzY9mm7vTZ90Rt4KCDOA2VCRbtvnzghOHCohh7aDGWxF2godp6mmcLqSwvevi6H20+wNLEuaxSjVrhcb4BL7QhHa4s5RRdb3OEvZPmgfOXsxC+CatYsBa6BgsiVlBoPoHcOe9lgcDPkTGCLyABu2ugYu34ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891408; c=relaxed/simple;
	bh=rBJ7OEcpzX0ty1W1oU0GkLNAo4q6tJy5chLR4emqiXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=biCKfi4p37tXCKZMh3kRi02c6ivzxsxwK2Ghma4mz4ZU7902KnXVvb70Tx/brpBCTZ0ediOsllCFz0DbXW0OyicAQErVXnyv7jycLEIRnfToh9QjWc4JRgMeMxpnYayDYj0XQh6TmsNN+SqGEfJE318AA0uyW+t+rSo5oTuZ1ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evtNM+7V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evtNM+7V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F641F000E9;
	Wed, 27 May 2026 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779891407;
	bh=jmeYr36B3ddjtnomFK/HAMLXKdAGWqgpOPH1Z2Q/8Bw=;
	h=Date:From:To:Cc:Subject;
	b=evtNM+7VtCoJcH8yEKBJtykbWrpLfUEInXViAK+f+EHEFIeKIjhuZXjrT6k+oTkrz
	 gxSBauAmb1rbqrcDET0y5/tbaGM7iJrE0cUft36DSSBrSy77zmk62SqUIdh7XKXyUU
	 KN0MD5d1Xl+Oe7TinL0HHDowZ3ORxg9eAPFqRi9tN1H61XLaxICd3qw06GlJZbU4UU
	 mgT6gDbYHgFHqzSdTfFnQgAc4WaApdSd6mnuve3Umd0jOcjd+3KCnGgvO3uUtbohiP
	 k3iWOSq//22i2U6x8To/7Ni/4MpBri76+BqFuYfrq7O1YhW1m4BS++Vd5PkKXcGK9p
	 SAFmrUVW6uSKQ==
Date: Wed, 27 May 2026 15:16:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <ahb8y-KE12lOUIVz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TZhMIX8GS/PUZHHd"
Content-Disposition: inline


--TZhMIX8GS/PUZHHd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the block tree, today's linux-next build (arm64 kunit)
failed like this:

ERROR:root:error[E0308]: mismatched types
   --> /tmp/next/build/rust/kernel/block/mq/operations.rs:274:28
    |
274 | init_request: Some(Self::init_request_callback),
    |                       ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn
    |                       pointer, found fn item | arguments to this
    |                       enum variant are incorrect
    |
    = note: expected fn pointer `unsafe extern "C" fn(_, _, _, i32) -> _`
                  found fn item `unsafe extern "C" fn(_, _, _, u32) -> _ {OperationsVTable::<T>::init_request_callback}`
help: the type constructed contains `unsafe extern "C"
fn(*mut blk_mq_tag_set, *mut bindings::request, u32, u32) -> i32
{OperationsVTable::<T>::init_request_callback}` due to the type of the
argument passed
   --> /tmp/next/build/rust/kernel/block/mq/operations.rs:274:23
    |
274 | init_request: Some(Self::init_request_callback),
    |                       ^^^^^---------------------------^
    |                            | this argument influences the type of
    |                            `Some`
note: tuple variant defined here
   --> /usr/lib/rustlib/src/rust/library/core/src/option.rs:580:5
    |
580 | Some(#[stable(feature = "rust1", since = "1.0.0")] T),
    |     ^^^^

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0308`.

We build with --kconfig_add CONFIG_KASAN=y --kconfig_add CONFIG_RUST=y
(and would also do an allmodconfig which picks up CONFIG_RUST=y in any
case since there's a usable rustc installed).

Caused by commit

  b040a1a4523d9 (block: switch numa_node to int in blk_mq_hw_ctx and init_request)

possibly interacting with some rust change but I'm not sure.  I have
used the tree from next-20260526 instead.

--TZhMIX8GS/PUZHHd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoW/MoACgkQJNaLcl1U
h9CUTAf+I+SYj2SrIEDUI/inkUzCf+JGF5tloCVY1WXDBp8+7CJs8DHL/yQ/Df1n
0PrzgMnMD0n6hIfDwE8jXqwH6/rMZLn4h41i4WJOsEF1axkEAFh5kTC/4KRNPfAh
SF7c5tC0lOMTAHTn4n3jCLd8juIbjMwrivkhjyVNscm5ll4wnX0gBx5WEP3KmhHn
BafhQYOLxOV63rre+xJYbb6JbCAuEN9jtY/M0OCw12InhXaw3zcmnjKc7vWNUkZ/
LKJLImRnL4PCVOZHPMgDXoRfIwKzOlPFxTVvABHkgDKNsiJ5NtvtvrTvBi8vchuz
SwY1BplMqaoOWNFUGUkTl4gdUPT4fw==
=kykK
-----END PGP SIGNATURE-----

--TZhMIX8GS/PUZHHd--
