Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D262E2663;
	Mon,  6 Apr 2026 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775480563; cv=none; b=D8gXFu0w4x0Ad+U9/PNeLczNZex6JXCFAeM353oOCUVe22z7lAWyOm5aN3twDMuOZAn6OG9RWgGNLKd9mXUkVf+yGiQBVeS+i3Yq0Jhn7cLoP8nt+BKQ1Yaq2OhHDsoTk9Fsaom5xBKj/wstt9TG0swf7fpLWDi7vUpO5su4SEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775480563; c=relaxed/simple;
	bh=ReLe3HSjGh/WYuSEKXV15VU/fBjvh3ezkr1xOtaQ4CY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QvZCrD1RjF0+mXoAF1eMoUyI0uC72kEA5G4DCQr/LjEOkejwJQ4rcwCQA5oCJFS510MDfL2nWHOFDnis8nsGxY9ZqANDTN3mufUUhlBKtI9/wgASYap/st0dr2BOffKW3XgB8Oi9B8Lfcy+Xlbx91UoMUoRZ9F5FIIQZpY4pf5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hwrt6aoX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hwrt6aoX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FD3C4CEF7;
	Mon,  6 Apr 2026 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775480563;
	bh=ReLe3HSjGh/WYuSEKXV15VU/fBjvh3ezkr1xOtaQ4CY=;
	h=Date:From:To:Cc:Subject:From;
	b=Hwrt6aoXm6dnWJFsBazkvTe8FLHlYSda4dsApDpZcwcCIAd89LaGz+8unMy9WynfN
	 HhzJDhj+Qu4+r9t+3Hz1yMlaJdh8/QKIUSDRUQaA/VXFYfW2yM5D3gICAwVG8seiPV
	 znnI0Xcdo4Xc81sTsJmN4XPK/fdkSJyADTGiDSIYDjHleqlRHy+U1GKjDC8Dl81JWn
	 9dhB7CI49bW0yom3q0+Hte0hnFzN6YKvy/xnJyw94k4WV14q/uZGbygo6+m71y8Sme
	 6W1HUSGSB1HW9udgafwcDKcQLMJqbqJ2+4N+Eio3USOf0uXwu3GYPfYbygQJQvz/ne
	 Pm0mIbFo8pqcQ==
Date: Mon, 6 Apr 2026 14:02:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the origin tree
Message-ID: <adOu7wNEgMY9CGo-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="emhVr/5if/0QYzVw"
Content-Disposition: inline


--emhVr/5if/0QYzVw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/lib.rs

between commits:

  08da98f18f4f9 ("rust: ptr: add `KnownSize` trait to support DST size info=
 extraction")
  f41941aab3acd ("rust: ptr: add projection infrastructure")

=66rom the origin tree and commit:

  7fa2b092b1ff8 ("rust: kbuild: remove `feature(...)`s that are now stable")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/lib.rs
index d93292d47420f,b48221a5b4ec5..0000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -16,33 -16,9 +16,12 @@@
  // Please see https://github.com/Rust-for-Linux/linux/issues/2 for detail=
s on
  // the unstable features in use.
  //
- // Stable since Rust 1.79.0.
- #![feature(generic_nonzero)]
- #![feature(inline_const)]
- #![feature(pointer_is_aligned)]
- #![feature(slice_ptr_len)]
- //
- // Stable since Rust 1.80.0.
- #![feature(slice_flatten)]
- //
- // Stable since Rust 1.81.0.
- #![feature(lint_reasons)]
- //
- // Stable since Rust 1.82.0.
- #![feature(raw_ref_op)]
- //
- // Stable since Rust 1.83.0.
- #![feature(const_maybe_uninit_as_mut_ptr)]
- #![feature(const_mut_refs)]
- #![feature(const_option)]
- #![feature(const_ptr_write)]
- #![feature(const_refs_to_cell)]
- //
 +// Stable since Rust 1.84.0.
 +#![feature(strict_provenance)]
 +//
  // Expected to become stable.
  #![feature(arbitrary_self_types)]
+ #![feature(derive_coerce_pointee)]
  //
  // To be determined.
  #![feature(used_with_arg)]

--emhVr/5if/0QYzVw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTru4ACgkQJNaLcl1U
h9BH3Qf+K2d8ODt/lEr5/wOtU/Gpw2isClBTGqt5Cn4oBJ/ZUqa209k1UYQW8HFX
PZJqwFuR9S1XtX2nixMUrzzw1A2qF4Gf3NuXTvpi+hunnUwWZDepeO8ZlUhvw/bu
VVs9ab8yKrPjbUMdTFw3hZ9GLpj2NRR6MgUI1guagIH29HkWBHhYfYBhy6y2L1eu
QpbCzclbGqiQSaLMbEZ657UlG7xQ69H+x8zdXQJz6I8gDFoPh05tOtL54JBYTRJy
85HYFmMmQlrra7Cbpk3HzyaWh/JekPM7F9eeFuQONqsAa5P3XyOEAt9A1Ol6zP8B
axTpm13G7nZ8MVS2Y1DVaSFgmMM0Ow==
=+LbP
-----END PGP SIGNATURE-----

--emhVr/5if/0QYzVw--
