Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323213AD506;
	Fri,  7 Aug 2026 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113801; cv=none; b=mfT5Maa9mHtWNjFoOFgYpi5ytwyT+zO50+z+SUPP8mewICTjpfSHJociDr3WFWUo/QpJOnEtAqo5eUKUPWNd+wo7LxKJCyIT7kaZSV/601TEyoRCeKa+SrDAdpEhvg7/Qm7218NIhQ2qYcCjJkjlmK5FM85xxHWvjPd00Bqc0ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113801; c=relaxed/simple;
	bh=212xOoG5IG4p3qrESiSd97Bx9/IDl1ARy0vshXds+CA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXKhQ5SXiBm1e6RBewZkIPdoFFauSrg9Tgzkzf3HlLBm2yTDGhD0s5eA7XFsP9p67IhuHCr8AuqkvCJdOI/d+hRmGGL5vEDVzVuY3MJarh1PpETyEDfIhn4bzuIphOgXwVSzdgrt6gI1+qMpkwRUV6EqacYz/krLqeikf6hunIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKzsRKfa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKzsRKfa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF041F00ADB;
	Fri,  7 Aug 2026 14:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786113786;
	bh=9/FAbYE2H7YaXSYQKM68uFhjv3A2u0wk2hB2TDmHlng=;
	h=Date:From:To:Cc:Subject;
	b=ZKzsRKfaQt8fDJQDpsgNYSQ6/NMnjYa6ajOPdFiKiPH13csfgF4eQiUiJNyxypc5F
	 NiKuc1cYrbchbNnJHzzY652nTsihPuQ1xkM5lkLgV0yDQ1DasDetmc81BcyCg/5RG6
	 Osv1nUxlTw+qt0S95OYKCbDbAEl0XMTwY2rdldtvETppulETzzALV1G0+B43l56iin
	 uzBpy/iiBInPvH4zmuljyEX73+OsJZjAu4zA4+49D9sM0ThOtuJ4LAuCMIna7+MbiV
	 Zldyg/wXZIQ5A6mSzzvA0T0gi2MkVwVtjfv0mvq5UWHqI522uAhmJu7Ywesz8pu/Pv
	 phWiuRUws9YuA==
Date: Fri, 7 Aug 2026 15:43:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-rust tree with the
 driver-core.current tree
Message-ID: <anXu9ocZnLLP9PYr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8BVGcJi1QIQFb7Qh"
Content-Disposition: inline


--8BVGcJi1QIQFb7Qh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-rust tree got a conflict in:

  rust/kernel/io.rs

between commit:

  f88db65aece9f ("rust: io: gate ioremap doctests on CONFIG_HAS_IOMEM")

=66rom the driver-core.current tree and commits:

  65f6abf9fa816 ("rust: io: add missing safety requirement in `IoCapable` m=
ethods")
  bed01ca9e9cf8 ("rust: io: remove `MmioOwned`")

=66rom the drm-rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/io.rs
index d4063ee412000,95f46bb75f9e8..0000000000000
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@@ -4,12 -4,20 +4,21 @@@
  //!
  //! C header: [`include/asm-generic/io.h`](srctree/include/asm-generic/io=
=2Eh)
 =20
+ use core::{
+     marker::PhantomData,
+     mem::MaybeUninit, //
+ };
+=20
  use crate::{
      bindings,
-     prelude::*, //
+     prelude::*,
+     ptr::{
+         Alignment,
+         KnownSize, //
+     }, //
  };
 =20
 +#[cfg(CONFIG_HAS_IOMEM)]
  pub mod mem;
  pub mod poll;
  pub mod register;

--8BVGcJi1QIQFb7Qh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp17vYACgkQJNaLcl1U
h9ABLgf9HxDmXxEwkxslxrEa69fsUZUCK5l60EsRzBDzo+6K/VoV+b3NRm8Jxain
m1zuWtKNUbZxfOeNmmMXfP1iZbHPgUo6h7IqQ/HAIhVefpaosw9gT2TjnBe4ifLK
r2/q6gs9ELYwxucVg5SL29ZN7SwRAhwHK/v48GRDgWZXTcb6rvNtGvwOaXJecyWo
10LTamit+Ol9IPB4ZXE45zO5JB79Rlfo57nyX+eqXLp/Gm4l64LQV07w1kLkMzgC
ucVsF0A1Ncep2bDOfpfF1XiLwoGIkgzY8B4ErgB7Ipjan9QGZEBYexVp75N9u/xE
YbZa50qOOdVN/5RoqNRMofAJGW+u+g==
=ZRnJ
-----END PGP SIGNATURE-----

--8BVGcJi1QIQFb7Qh--
