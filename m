Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701266;
	b=Z6AaV4E/2Z9q1g2TzaMfKsGps1q4PGCThL0JTW7/kRu488eF6BKUK6EiYOGxY8DcKbRs
	 wQyfDjFwCXcv/LLeiYkS6wQ9Q6Ic2D4elYmlQvxLsa5frVtM1pRf4qOQpenmUXPFPOh2H
	 WG2bmrd8S6uIHXPdQgs6hE5uTfYoBvz/pRhjTQkMb2qq6Qj576a5W9Ah1sL29wM+ox+hj
	 XaRPKokYs63si8mfc7nDhzg1YGCQdsRRqMMA8YKvMN2LvmZf3Xj34+AyVmCAaTWQgpb3D
	 bzn5oBfNWLDqA3Xwvn7gXvC7MED+EwCMI6Xe7WoXw+ffMMEtaLrysDL+lk/B3+jIDxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701266;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Da34lVcI9zkQG7quYfCq9S4YuZwxAmfQRzRzebPfYYA=;
	b=BlT+F1ul6Ctbv4vXvNVq4frQpbEbEW6OZBw1Rq92LQTMnbtPwONuQswg2cxOpPnzDqIb
	 w/2W077MiSv3jSaPCfDZIk5krepg8ZKrBf8Dhupro7nnNYqpzzqC8B9rz34SJnC2Eox0x
	 8XUaCBw3o8xYj3gHvZg/DpdF/WOUh5d7OswlSalgzIub8EPbTD+oDDgc4UzneCM+A/r9F
	 GixSzIkoijT/5MyzFz8DMlOeY37IHM40w2lS5kujCA//C5K4NA1ocEFwaRFp6ESGupfOu
	 9CKgOn/mYft3JXHhfMASL147Ab91InQige3UYiPhoVXcLfF3q2bDGaS1Fi2+/dNb7gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvng2SS1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B08B606A31C;
	Thu, 26 Nov 2026 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvng2SS1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706741F000C0;
	Thu, 26 Nov 2026 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701265;
	bh=Da34lVcI9zkQG7quYfCq9S4YuZwxAmfQRzRzebPfYYA=;
	h=Date:From:To:Cc:Subject;
	b=hvng2SS1Zll3BhWrxpDjhADtYbOP6bN57/SzVdoEHjPBL4AOc8lcpd7C6WYshOHyo
	 WQrc0eGfEHTwUNV+nXQ40MgqjHZuFFANmYxfGOsbUvjYV4frV2WuHZOzVdIXiPgeS9
	 vP6CzXDKoYiaEL8Yeb3xq+Gzk5zdBS2IC4jZg+G7XNeJE7zwOc44CIJPhgD5vcvNba
	 xx6vQDEQeBfwn1N708+f2r6kX4zqnGE7W7RRbIYAtqx8MGGSxpLph6FEWwuaFaRPNm
	 VyYX0CmLt+h7mRkPhQriO8uUsoMQm6LdwHjPUvRQu21+j2QKCt2XVLQRSTEUvyXEOI
	 oRtzXuMFqdTjA==
Date: Thu, 26 Nov 2026 13:54:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust-xarray tree with the
 rust-timekeeping tree
Message-ID: <awg6DVNXrqmlwbfu@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mGE3I+gjgRbtyytS"
Content-Disposition: inline


--mGE3I+gjgRbtyytS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust-xarray tree got a conflict in:

  rust/kernel/time/hrtimer.rs

between commits:

  8a914f7625e4e ("rust: time: remove leftover "clock source" wording from d=
oc comments")
  6b391eec2ddeb ("rust: hrtimer: Remove HrTimer::expires()")

=66rom the rust-timekeeping tree and commit:

  5c057c3a0b980 ("rust: hrtimer: add active() method to query timer state")

=66rom the rust-xarray tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/time/hrtimer.rs
index d1ca2441f9bbf,e960821ace3bd..0000000000000
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@@ -569,6 -572,91 +571,68 @@@ impl<T> HrTimer<T>=20
      {
          self.forward(HrTimerInstant::<T>::now(), interval)
      }
+=20
 -    /// Return the time expiry for this [`HrTimer`].
 -    ///
 -    /// This value should only be used as a snapshot, as the actual expir=
y time could change after
 -    /// this function is called.
 -    pub fn expires(&self) -> HrTimerInstant<T>
 -    where
 -        T: HasHrTimer<T>,
 -    {
 -        // SAFETY: `self` is an immutable reference and thus always point=
s to a valid `HrTimer`.
 -        let c_timer_ptr =3D unsafe { HrTimer::raw_get(self) };
 -
 -        // SAFETY:
 -        // - Timers cannot have negative ktime_t values as their expirati=
on time.
 -        // - There's no actual locking here, a racy read is fine and expe=
cted
 -        unsafe {
 -            Instant::from_ktime(
 -                // This `read_volatile` is intended to correspond to a RE=
AD_ONCE call.
 -                // FIXME(read_once): Replace with `read_once` when availa=
ble on the Rust side.
 -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.=
expires)),
 -            )
 -        }
 -    }
 -
+     /// Query the state of the timer.
+     ///
+     /// Returns [`true`] if the timer is in the started or running states.
+     ///
+     /// This method synchronizes internally and does not require exclusiv=
e access to the timer.
+     ///
+     /// The returned value is a snapshot. A concurrent event can change t=
he state of the timer
+     /// right after this method returns, so callers that need the state t=
o be stable must serialize
+     /// against such events by other means.
+     ///
+     /// # Examples
+     ///
+     /// ```
+     /// # use kernel::{
+     /// #     impl_has_hr_timer,
+     /// #     prelude::*,
+     /// #     time::{
+     /// #         hrtimer::{
+     /// #             HasHrTimer, HrTimer, HrTimerCallback, HrTimerCallba=
ckContext,
+     /// #             HrTimerRestart, RelativeMode,
+     /// #         },
+     /// #         Monotonic,
+     /// #     },
+     /// # };
+     /// # use pin_init::stack_pin_init;
+     /// #[pin_data]
+     /// struct ExampleTimer {
+     ///     #[pin]
+     ///     timer: HrTimer<Self>,
+     /// }
+     ///
+     /// impl ExampleTimer {
+     ///     fn new() -> impl PinInit<Self> {
+     ///         pin_init!(Self { timer <- HrTimer::new() })
+     ///     }
+     /// }
+     ///
+     /// impl HrTimerCallback for ExampleTimer {
+     ///     type Pointer<'a> =3D Pin<&'a Self>;
+     ///     fn run(_this: Pin<&Self>, _ctx: HrTimerCallbackContext<'_, Se=
lf>) -> HrTimerRestart {
+     ///         HrTimerRestart::NoRestart
+     ///     }
+     /// }
+     ///
+     /// impl_has_hr_timer! {
+     ///     impl HasHrTimer<Self> for ExampleTimer {
+     ///         mode: RelativeMode<Monotonic>, field: self.timer
+     ///     }
+     /// }
+     ///
+     /// stack_pin_init!(let has_timer =3D ExampleTimer::new());
+     /// assert!(!has_timer.timer.active());
+     /// # Ok::<(), kernel::error::Error>(())
+     /// ```
+     #[inline]
+     pub fn active(&self) -> bool {
+         // SAFETY: By type invariant, `self.timer` is valid. `hrtimer_act=
ive`
+         // synchronizes internally and is safe to call without exclusive
+         // access to the timer.
+         unsafe { bindings::hrtimer_active(self.timer.get()) }
+     }
  }
 =20
  /// Implemented by pointer types that point to structs that contain a [`H=
rTimer`].

--mGE3I+gjgRbtyytS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIOg0ACgkQJNaLcl1U
h9Cybwf+LpHKk0viTFHFbIEAD4drNafRQvbxkdZ+d6Rwa4+s2iujfMFIx0+kv7WQ
5SOvyg/CB2E7YBfyZSwv8AXd6WiK4Zv6aj6m/iiwoBXzBjcVwflyAvSA34azFcAH
pqr1197bTT+vXlSWqwsGIYEvH5DCvFgu7ehdpG2pA/aHm+z5rIIF3P3Wk8nmHeyI
DkHiuX/F/on091790Vq47jI8BzvMqO5WwiAD9CyEIcy/jrl8kL+5U12d4BxP7QkZ
k2LaEBSWNDAJIK6+CvilyTaStXlP1S64UXKMuP5MOOnmcNuYtj8abrDfNA/JcE2C
/C5R6s4LWz8EkBDvGGNqyqdhnZto3A==
=hT70
-----END PGP SIGNATURE-----

--mGE3I+gjgRbtyytS--
