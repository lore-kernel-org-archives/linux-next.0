Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10B44307B7;
	Mon, 10 Aug 2026 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786381100; cv=none; b=oWQxFNOS+SAnbc0I+YupzpvJIMN31TaUmuUVfr8I7NRnfcSEBRIK0ybOXbKsuuaVhNPRvJcwJC/ke4V+SG7t0c5FMpkUU32dq2m07X8CHIshGGyzi+jQR6OqCbQLpA7FE37Db/2Hwv2r2qADeif6vOcs9VxsxAgD7bLYczVhVg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786381100; c=relaxed/simple;
	bh=8E1xDIxiC9uFSDekrsvpv9rCP+uV+Iw5Ye3JlPP5SjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pE2te+kT8EL3Ph7UMbRnc9SMObasl0zH1r8UOW+LOK07cHkldvrmGw9KP0Mzj+JalaGRBIi+wOapW8jE3nmcFwy7yT5DUfWrEsOfAcTOqMyxE6z1e6j04AAdpQEyF/pdHuoQkeo47PYg62SzdMF4LJbxrVRUA6zfz7hPuSg+nLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMSosH9D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMSosH9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3E51F000E9;
	Mon, 10 Aug 2026 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786381099;
	bh=46fqdnpVdJmFnV2pUQ2C2ucZogbcvqskJybBU17bO3s=;
	h=Date:From:To:Cc:Subject;
	b=nMSosH9DcG12MnM+2F+n0u9raLFz34DuQa/Ci2kN+bo3Ad5Nf7/UfFKtIxksR4KAM
	 x2m0OoPZTcse0CzodRPX9xF2dKMR1ExI8q8BNkzWMpz3sSnBZjzQ8heSA0wByLaJEQ
	 V3F5OBuF5WZp3PdRCzabHjjG9+hUaiph5f0007OG1gtNlYUPv3zxD5gu9YiJvxPMHg
	 mEKKHa91wnG6bvrjKxJKhrR1oN7qmpRRn/apSZmc6V3uBp9x3bL5/0eQSt/FV/zcyR
	 tKZHr+3fKeciJsSVzqzV/OHqAefvSzyGMvg7L+SeIvOLSzegZp7rASPI87vPqUF3y/
	 GgXhARGlgORGA==
Date: Mon, 10 Aug 2026 17:58:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the tip tree
Message-ID: <anoDJw4Y6kX_7eio@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isgz/3d2bQCKzOmU"
Content-Disposition: inline


--isgz/3d2bQCKzOmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  rust/kernel/sync/poll.rs

between commit:

  47c3367ff096e ("rust: sync: Use safe synchronize_rcu() abstraction in pol=
l")

=66rom the tip tree and commit:

  e5e86df8b6661 ("rust: poll: use kfree_rcu() for PollCondVar")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/sync/poll.rs
index 5aa0ce9ba01b7,684dfa242b1aa..0000000000000
--- a/rust/kernel/sync/poll.rs
+++ b/rust/kernel/sync/poll.rs
@@@ -8,13 -9,14 +9,18 @@@ use crate::
      bindings,
      fs::File,
      prelude::*,
 -    sync::{CondVar, LockClassKey},
 +    sync::{
 +        rcu::synchronize_rcu,
 +        CondVar,
 +        LockClassKey, //
-     }, //
++    },
+     types::Opaque, //
+ };
+ use core::{
+     marker::PhantomData,
+     mem::ManuallyDrop,
+     ops::Deref, //
  };
- use core::{marker::PhantomData, ops::Deref};
 =20
  /// Creates a [`PollCondVar`] initialiser with the given name and a newly=
-created lock class.
  #[macro_export]
@@@ -103,6 -106,72 +110,70 @@@ impl PinnedDrop for PollCondVar=20
          unsafe { bindings::__wake_up_pollfree(self.inner.wait_queue_head.=
get()) };
 =20
          // Wait for epoll items to be properly removed.
 -        //
 -        // SAFETY: Just an FFI call.
 -        unsafe { bindings::synchronize_rcu() };
 +        synchronize_rcu();
      }
  }
+=20
+ /// A [`KBox<PollCondVar>`] that uses `kfree_rcu`.
+ ///
+ /// [`KBox<PollCondVar>`]: PollCondVar
+ pub struct PollCondVarBox {
+     inner: ManuallyDrop<Pin<KBox<PollCondVarBoxInner>>>,
+ }
+=20
+ #[pin_data]
+ #[repr(C)]
+ struct PollCondVarBoxInner {
+     #[pin]
+     inner: PollCondVar,
+     rcu: Opaque<bindings::callback_head>,
+ }
+=20
+ // SAFETY: PollCondVar is Send
+ unsafe impl Send for PollCondVarBoxInner {}
+ // SAFETY: PollCondVar is Sync
+ unsafe impl Sync for PollCondVarBoxInner {}
+=20
+ impl PollCondVarBox {
+     /// Constructs a new boxed [`PollCondVar`].
+     pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> R=
esult<Self, AllocError> {
+         let b =3D KBox::pin_init(
+             pin_init!(PollCondVarBoxInner {
+                 inner <- PollCondVar::new(name, key),
+                 rcu: Opaque::uninit(),
+             }),
+             GFP_KERNEL,
+         )
+         .map_err(|_| AllocError)?;
+=20
+         Ok(PollCondVarBox {
+             inner: ManuallyDrop::new(b),
+         })
+     }
+ }
+=20
+ impl Deref for PollCondVarBox {
+     type Target =3D PollCondVar;
+     fn deref(&self) -> &PollCondVar {
+         &self.inner.inner
+     }
+ }
+=20
+ impl Drop for PollCondVarBox {
+     #[inline]
+     fn drop(&mut self) {
+         // SAFETY: ManuallyDrop::take ok because not already taken.
+         let boxed =3D unsafe { ManuallyDrop::take(&mut self.inner) };
+=20
+         // SAFETY: The code below frees the box without calling the actua=
l destructor of the type,
+         // but it's okay because it re-implements the destructor using `k=
free_rcu()` in place of
+         // `synchronize_rcu()`.
+         let ptr =3D KBox::into_raw(unsafe { Pin::into_inner_unchecked(box=
ed) });
+=20
+         // SAFETY: The pointer points at a valid `wait_queue_head`.
+         unsafe { bindings::__wake_up_pollfree((*ptr).inner.inner.wait_que=
ue_head.get()) };
+=20
+         // SAFETY: This was allocated using `KBox::pin_init`, so it can b=
e freed with `kvfree`.
+         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<f=
fi::c_void>()) };
+     }
+ }

--isgz/3d2bQCKzOmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp6AyYACgkQJNaLcl1U
h9CwKwf9EaLPYyKQQV+DnDqqnJQcnmN20UZoYaftceKyV2Qng8ytAWAF/35vW0eE
Ec3TR04zKn+WTldTWCyC2VvMq+6jrvd9IjjHazQzgvsJ5sUMpoCMo0JododTI75p
woxd0eq6sUbk5P5tYxQ4V0wWWNlQZbM26HXp/MrMBteUUJelWfAhIXOOZQCosf8j
qsqXBGi15sz/7D7RWPRqDzC/JRJptiFRr32Euvro65p5AH4DmsoiBdBlg84b1cUV
d/9Fm42eGQ3MvUwhIy3DGpDS1lEAt+wfin5bdASmGfWvaOABLfOQ466sY3LLPwOJ
lJrTE9q/v858y8+D0Cgp/QlWqLDJwg==
=hsfJ
-----END PGP SIGNATURE-----

--isgz/3d2bQCKzOmU--
