Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C13CCFD0;
	Thu, 21 May 2026 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365286; cv=none; b=qFQNc1XGobL/t/i0bG6aESHkMqBTr6DZGGm4XoN6pTx6K+WW7Nt+fDwKWYyQj+CWJeQOaNqf2rw2k0qebQkXgIDSE7NHDb4kjPpv/EXFoTOItregEi57IL+aZgvAo+XsJEL0K7Y+i20j56aD3dsBuE0+59XO7gnTcqbJ4cKXA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365286; c=relaxed/simple;
	bh=3FRZXYgJ+G5toHjk3WlFk8JZFDuPj8A+fMAuXS2AcxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uy0tg6EeX2C+xBjKvLAqRgwX6TZEmgIGv3TZqxe2eUXn/BoYMCIDPMXA3vXT8cYAaIAnUmvA+peqsB+jSDHl5x3L+R3fxBJZvrEucJ8Z6LMStNQNLoeYvYw+1KFmdnmGpn+yk+in+Kdwao44KQH0VOw4vdwqbDua2GCXrQWTkt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVh4sLFF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVh4sLFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAEC1F00A3B;
	Thu, 21 May 2026 12:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779365278;
	bh=z6hxapG4IBgb/6c2gkQvopiSA4A1Y/JUUI/UPZbrU7s=;
	h=Date:From:To:Cc:Subject;
	b=ZVh4sLFF2N+RyeFd6J25X0Q/NC96pl8oHgWlKa425/ZK9UVr63uGvitYup1qKLLuu
	 vanz9C1FADyExqRbqQ/gO6du5ZFQJ+VWIaodrGcMikDjlf2iXFExlsS69+w5nBTvSq
	 vXRtwlsgyfH4iHW7lZmrzMUzFZWrox+C0Zua6a1k+l5L+bKJauppmSPA9jQPMkCNBi
	 2/EYIqaHnrYI0dC8qCW66/lK51OcDpBe7mVATVL9ZJXjbp7z2xHhcO0QndfMty58yL
	 +XeBdzYSaCW6ueL6Gdvcp/7Y8QJUTNptWS4RarheAbFk+QqOgeLWx7ctZt9KrgnrDn
	 VG/JMo1ti3ztA==
Date: Thu, 21 May 2026 13:07:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the driver-core tree with the rust-alloc
 tree
Message-ID: <ag71mqpl_sgr_hsk@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GjtcP2E0siw9KCdC"
Content-Disposition: inline


--GjtcP2E0siw9KCdC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  rust/kernel/alloc/kbox.rs

between commit:

  9b25d4111e913 ("rust: alloc: cleanup imports and use "kernel vertical" st=
yle")

=66rom the rust-alloc tree and commit:

  abb21500e7e5d ("rust: alloc: add Box::zeroed()")

=66rom the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined rust/kernel/alloc/kbox.rs
index 31b2588ed5bf9,c824ed6e15233..0000000000000
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@@ -3,47 -3,25 +3,47 @@@
  //! Implementation of [`Box`].
 =20
  #[allow(unused_imports)] // Used in doc comments.
 -use super::allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter};
 -use super::{AllocError, Allocator, Flags, NumaNode};
 -use core::alloc::Layout;
 -use core::borrow::{Borrow, BorrowMut};
 -use core::marker::PhantomData;
 -use core::mem::ManuallyDrop;
 -use core::mem::MaybeUninit;
 -use core::ops::{Deref, DerefMut};
 -use core::pin::Pin;
 -use core::ptr::NonNull;
 -use core::result::Result;
 +use super::allocator::{
 +    KVmalloc,
 +    Kmalloc,
 +    Vmalloc,
 +    VmallocPageIter, //
 +};
 =20
 -use crate::ffi::c_void;
 -use crate::fmt;
 -use crate::init::InPlaceInit;
 -use crate::page::AsPageIter;
 -use crate::prelude::*;
 -use crate::types::ForeignOwnable;
 -use pin_init::{InPlaceWrite, Init, PinInit, ZeroableOption};
 +use super::{
 +    AllocError,
 +    Allocator,
 +    Flags,
 +    NumaNode, //
 +};
 +
 +use crate::{
 +    fmt,
 +    page::AsPageIter,
 +    prelude::*,
 +    types::ForeignOwnable, //
 +};
 +
 +use core::{
 +    alloc::Layout,
 +    borrow::{
 +        Borrow,
 +        BorrowMut, //
 +    },
 +    marker::PhantomData,
 +    mem::{
 +        ManuallyDrop,
 +        MaybeUninit, //
 +    },
 +    ops::{
 +        Deref,
 +        DerefMut, //
 +    },
 +    ptr::NonNull,
 +    result::Result, //
 +};
 +
 +use pin_init::ZeroableOption;
 =20
  /// The kernel's [`Box`] type -- a heap allocation for a single value of =
type `T`.
  ///
@@@ -279,6 -257,27 +279,27 @@@ wher
          Ok(Box(ptr.cast(), PhantomData))
      }
 =20
+     /// Creates a new zero-initialized `Box<T, A>`.
+     ///
+     /// New memory is allocated with `A` and the [`__GFP_ZERO`] flag. The=
 allocation may fail, in
+     /// which case an error is returned. For ZSTs no memory is allocated.
+     ///
+     /// # Examples
+     ///
+     /// ```
+     /// let b =3D KBox::<[u8; 128]>::zeroed(GFP_KERNEL)?;
+     /// assert_eq!(*b, [0; 128]);
+     /// # Ok::<(), Error>(())
+     /// ```
+     pub fn zeroed(flags: Flags) -> Result<Self, AllocError>
+     where
+         T: Zeroable,
+     {
+         // SAFETY: `__GFP_ZERO` guarantees the memory is zeroed; `T: Zero=
able` guarantees that
+         // all-zeroes is a valid bit pattern for `T`.
+         Ok(unsafe { Self::new_uninit(flags | __GFP_ZERO)?.assume_init() })
+     }
+=20
      /// Constructs a new `Pin<Box<T, A>>`. If `T` does not implement [`Un=
pin`], then `x` will be
      /// pinned in memory and can't be moved.
      #[inline]
@@@ -297,10 -296,7 +318,10 @@@
      /// # Examples
      ///
      /// ```
 -    /// use kernel::sync::{new_spinlock, SpinLock};
 +    /// use kernel::sync::{
 +    ///     new_spinlock,
 +    ///     SpinLock, //
 +    /// };
      ///
      /// struct Inner {
      ///     a: u32,
@@@ -593,6 -589,7 +614,6 @@@ wher
  ///
  /// ```
  /// # use core::borrow::Borrow;
 -/// # use kernel::alloc::KBox;
  /// struct Foo<B: Borrow<u32>>(B);
  ///
  /// // Owned instance.
@@@ -620,6 -617,7 +641,6 @@@ wher
  ///
  /// ```
  /// # use core::borrow::BorrowMut;
 -/// # use kernel::alloc::KBox;
  /// struct Foo<B: BorrowMut<u32>>(B);
  ///
  /// // Owned instance.
@@@ -684,13 -682,9 +705,13 @@@ wher
  /// # Examples
  ///
  /// ```
 -/// # use kernel::prelude::*;
 -/// use kernel::alloc::allocator::VmallocPageIter;
 -/// use kernel::page::{AsPageIter, PAGE_SIZE};
 +/// use kernel::{
 +///     alloc::allocator::VmallocPageIter,
 +///     page::{
 +///         AsPageIter,
 +///         PAGE_SIZE, //
 +///     }, //
 +/// };
  ///
  /// let mut vbox =3D VBox::new((), GFP_KERNEL)?;
  ///

--GjtcP2E0siw9KCdC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO9ZkACgkQJNaLcl1U
h9AI3Af/cLpbrBnq7zJ1lLGimKLSZCD9DlwvhB06gTdmAfNYWBEwJ3hHYgCmVR/g
7IhZ9fNI5hg1weqCRgW6J0Nf/HizneEKJeD4EoVn4sBLg+uea87q80DsW8EYBlZC
6im1Ks78Fmf2eHUCagHbsyq9MRwq8OBVkzhHcxs1leNXUsFbxTJgzkx8CH+3Fih5
tkQyHYal82nYA+okDXfYr+k0vg2GvIr8MDKbNbkVRy2P0rKU3pSG7YeO7RyPzRhE
zU8L9HreW1l3htHDYnEoKVGg4/Yxr+B6XBq8yWATyit2OgTDPUAWhWaszusslzhV
H40k5MyLXIBeepRy8u8BJdGrqYmzmw==
=nLpg
-----END PGP SIGNATURE-----

--GjtcP2E0siw9KCdC--
