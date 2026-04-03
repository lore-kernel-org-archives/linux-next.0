Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C461B13E02A;
	Fri,  3 Apr 2026 12:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775219733; cv=none; b=aJFhcXc34EHX7FxmA7qmYNqGUjbXGc7sfXPoLOEi1CRjBn06OKm41+nYHYrmv0RlFSD8tnVwUmjwpmjrR6DT6Lk12AETe0Z4g9036tb8/CG0Eb5EBtz3pQSufWOhSSOhy98KiKqiTSy6zy/6qtDuSzGhftstFrKNeJWNQLqCIFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775219733; c=relaxed/simple;
	bh=nr/7qLzuouyILKZAsV/unylcpGT7kDEEY+UuKrfg6Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pa0TO0jiiXXGBx909U9qKbzr525CkCxj9KgB1kTHu4Srj3zsrPEadi4ZV1giN3L6/H1nWb498aEYjc3547ibltmz/728WNo1VqGcCt/TluUv/E4ZrMuUWLJSwgiaZCTCA0MdExL9bjVRnTEbhQPQ25wr4LdpyrDZhCslEEhZe5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s36f59+3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s36f59+3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192F4C4CEF7;
	Fri,  3 Apr 2026 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775219733;
	bh=nr/7qLzuouyILKZAsV/unylcpGT7kDEEY+UuKrfg6Wo=;
	h=Date:From:To:Cc:Subject:From;
	b=s36f59+3NM7DcP9aBWCBNRTWsMutfLYmO90qn+2hSXljfNDUo7yXqGNvUhayXfRlN
	 fIKha4DU1oLZjJSvOig1vDtdsCF8vk3BaaNt0/eKQvcFAuLuWaWnFsCZzVfq33hHpq
	 fg2D0H/NI5IMUgzuyZJgoBzEnusHBfvwGqEt4E4ENtHgbuhxE5d9qdzCdrd45N0gee
	 GEWZYOjRcHOS2lqK9pGhBHy8kvW4hugqKoVkQoxeXmqc/FRN0A6+csJmUo3azX3Bq3
	 lNy/rgAMbWOk3ZTeqyp1mG299hl2vFyqmvDaiacV1/BGkkziM5E+qP3h17nBDF75Yk
	 +B5qa80FjLM3A==
Date: Fri, 3 Apr 2026 13:35:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the origin tree
Message-ID: <ac-0Eb8leHb-h3FE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cn8I/6bQL8RdPbWc"
Content-Disposition: inline


--cn8I/6bQL8RdPbWc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/ptr.rs

between commit:

  08da98f18f4f9 ("rust: ptr: add `KnownSize` trait to support DST size info=
 extraction")

=66rom the origin tree and commit:

  0a51b384e0dec ("rust: ptr: add const_align_up()")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/ptr.rs
index bdc2d79ff6699,c7788656a1621..0000000000000
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@@ -2,15 -2,11 +2,17 @@@
 =20
  //! Types and functions to work with pointers and addresses.
 =20
 -use core::mem::align_of;
 +pub mod projection;
 +pub use crate::project_pointer as project;
 +
 +use core::mem::{
 +    align_of,
 +    size_of, //
 +};
  use core::num::NonZero;
 =20
+ use crate::const_assert;
+=20
  /// Type representing an alignment, which is always a power of two.
  ///
  /// It is used to validate that a given value is a valid alignment, and t=
o perform masking and
@@@ -232,24 -226,31 +232,53 @@@ macro_rules! impl_alignable_uint=20
 =20
  impl_alignable_uint!(u8, u16, u32, u64, usize);
 =20
 +/// Trait to represent compile-time known size information.
 +///
 +/// This is a generalization of [`size_of`] that works for dynamically si=
zed types.
 +pub trait KnownSize {
 +    /// Get the size of an object of this type in bytes, with the metadat=
a of the given pointer.
 +    fn size(p: *const Self) -> usize;
 +}
 +
 +impl<T> KnownSize for T {
 +    #[inline(always)]
 +    fn size(_: *const Self) -> usize {
 +        size_of::<T>()
 +    }
 +}
 +
 +impl<T> KnownSize for [T] {
 +    #[inline(always)]
 +    fn size(p: *const Self) -> usize {
 +        p.len() * size_of::<T>()
 +    }
 +}
++
+ /// Aligns `value` up to `align`.
+ ///
+ /// This is the const-compatible equivalent of [`Alignable::align_up`].
+ ///
+ /// Returns [`None`] on overflow.
+ ///
+ /// # Examples
+ ///
+ /// ```
+ /// use kernel::{
+ ///     ptr::{
+ ///         const_align_up,
+ ///         Alignment, //
+ ///     },
+ ///     sizes::SZ_4K, //
+ /// };
+ ///
+ /// assert_eq!(const_align_up(0x4f, Alignment::new::<16>()), Some(0x50));
+ /// assert_eq!(const_align_up(0x40, Alignment::new::<16>()), Some(0x40));
+ /// assert_eq!(const_align_up(1, Alignment::new::<SZ_4K>()), Some(SZ_4K));
+ /// ```
+ #[inline(always)]
+ pub const fn const_align_up(value: usize, align: Alignment) -> Option<usi=
ze> {
+     match value.checked_add(align.as_usize() - 1) {
+         Some(v) =3D> Some(v & align.mask()),
+         None =3D> None,
+     }
+ }

--cn8I/6bQL8RdPbWc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPtBAACgkQJNaLcl1U
h9BLhQf9F6G9tuY2hCi5A9pF6D05jcOKj08XGxS8l0JwB/cPXtX0UA2HGoPvIVo4
WI88E7wdabB0sm+FeCmCxX69R/HuHkSM6z5+QaW7bO3nwtrv9g6Z4CT1k3YrYq2o
eM0VLz86UmVlX0QUG3rosthuuwOchZ+pLyF49t2KsEPfdk+YJB2ATzVt3i8ZZmvi
+YXUVraE3DHjAKFadKccOYeDEHJu0A2Il1zxZ+MzXHnWMjVUuwu3sopext2xQ9+3
mbYRAzdccNeJNjxjHPY3thAyXbC11RbmiM7jtIwB5cLJr6WG3FDKg4jV7OHgEdbN
UhcWHxvPUv/VQ6U2VtXB+Y8W3tRc1A==
=KVLW
-----END PGP SIGNATURE-----

--cn8I/6bQL8RdPbWc--
