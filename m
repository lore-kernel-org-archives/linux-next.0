Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F5442E8CF;
	Mon, 10 Aug 2026 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786381088; cv=none; b=kVE6fnao29TjSauX5dp85ei/O9WIUo1YV19SKPgJoiSCV+y2ZDcXkvTZgmEXDPOZT0knKLTnFsFNR5cn++KnGv0wR6zOyrNzLgmC7oc3yAwB/krqp7HTmgHPfW7T+GVPFR7yvk0iVDS3tTar06OssXsGHqJqrMErVC/Mwu1aaTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786381088; c=relaxed/simple;
	bh=YEC4Ug+0sMA78pyilPWXEy08oZZX9O+mzJ1cQ3CECS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aDaCUCeW+rFbyj/1IZWlyHAsbh+NOyU8PIm7SSTyVeOoItfbttByTY4lkqMMiHjNkIV4pkMVwi04G+6KGFvR/E2Vs1lYhwfyAGOUn5g7HEj4dIGIQY96C1t3rDD7P/wuUK84kzmBHPxChAHAWq35cI+QYs+6PdrYzT/dKLiUloQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I44FZzqo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I44FZzqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514431F000E9;
	Mon, 10 Aug 2026 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786381087;
	bh=jtwTVLEm3miorIPUzqRZzYfj25Fqz20wDJl7d95QwgU=;
	h=Date:From:To:Cc:Subject;
	b=I44FZzqoV9Gk9q5KbR7OvWdwaM8igPpXq3vNnRbeKUwzPX+75YzMnGb8yxKkslBUz
	 XTQHgdUpomwIrOCYkgWMRGqqeduXE2C/C/OjpppCKmQl6q/1+GoKcDvm57jd0fguav
	 Fh9Wuire8M7ENy+0+si4ESScgWvGYXxi7mBTdSUlgFDMg4qDHfJco9/iAAHjxM0Uv5
	 ieNVYVTgYbzdBuwy+FvZhssq5kNbfE6A/MLdJEDyG+cZaZt1yxQexaJePCjNyhb7px
	 /3WbC9A/67+QM6aP8nBlUK3y2Q2x9jM812qAnUbGUq5XGNeKmEvWHmtBkRrTeoGOFH
	 URXGHqSpFIeMw==
Date: Mon, 10 Aug 2026 17:58:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Philipp Stanner <phasta@kernel.org>
Subject: linux-next: manual merge of the tip tree with the rust tree
Message-ID: <anoDGk0XqfBjHfUn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gGAW67Uhqz8Mj2oS"
Content-Disposition: inline


--gGAW67Uhqz8Mj2oS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  rust/kernel/sync/rcu.rs

between commit:

  d8973c4754437 ("rust: sync: Add abstraction for rcu_barrier()")

=66rom the rust tree and commit:

  1fb92e0625596 ("rust: sync: Add abstraction for synchronize_rcu()")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/sync/rcu.rs
index 42d1b26a21437,d867240be7369..0000000000000
--- a/rust/kernel/sync/rcu.rs
+++ b/rust/kernel/sync/rcu.rs
@@@ -51,22 -51,18 +51,38 @@@ pub fn read_lock() -> Guard=20
      Guard::new()
  }
 =20
 +/// Wait until all in-flight `call_rcu()` callbacks complete.
 +///
 +/// Note that this primitive does not necessarily wait for an RCU grace p=
eriod
 +/// to complete. For example, if there are no RCU callbacks queued anywhe=
re
 +/// in the system, then [`rcu_barrier()`] is within its rights to return
 +/// immediately, without waiting for anything, much less an RCU grace per=
iod.
 +/// In fact, [`rcu_barrier()`] will normally not result in any RCU grace =
periods
 +/// beyond those that were already destined to be executed.
 +///
 +/// In kernels built with `CONFIG_RCU_LAZY=3Dy`, this function also hurri=
es all
 +/// pending lazy RCU callbacks.
 +///
 +/// Note that this is one of the RCU primitives which must not be called =
in
 +/// atomic context.
 +#[inline]
 +pub fn rcu_barrier() {
 +    // SAFETY: `rcu_barrier()` is always safe to be called. It just might=
 wait for a grace period.
 +    unsafe { bindings::rcu_barrier() };
 +}
++
+ /// Wait for one RCU grace period.
+ ///
+ /// Waits for all RCU read-side critical sections (such as those establis=
hed by
+ /// a [`Guard`]) at the moment of the function call to finish.
+ ///
+ /// Does not prevent new read-side critical sections from starting, which=
 may
+ /// begin and run while this call is blocking.
+ ///
+ /// Note that this is one of the RCU primitives which must not be called =
in
+ /// atomic context.
+ #[inline]
+ pub fn synchronize_rcu() {
+     // SAFETY: `synchronize_rcu()` is always safe to be called from proce=
ss context.
+     unsafe { bindings::synchronize_rcu() };
+ }

--gGAW67Uhqz8Mj2oS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp6AxkACgkQJNaLcl1U
h9D0Cwf/ZovE3jFI33IBrBAUxEWXkNSDMskNLTswNtIEjTNjMM+36jkRSkKsLjIs
RgQzcbKIOz43wxZkbgimv9f7jrA8izvFvaqBKYOAb9OsWLb05XlRZh+ACjcutiSE
SxiRByjCiwqzI8CHys+Brb7hUQoGLyHhX0ZyUsHV6w2IEnE0am6ColSwzZyR8PiK
lDzpSt1vg9CAhwj2gIeHoRdzYAoMi0YDHWyhyCfsWjwm2LVnxh4hWdwCsjRi6qDw
QsAOWNEXSPnoCZzH7jn8LUnJ1X8r6+ZCGEgjI54S4fVY22Zzm/9ooOhjLY8W9iNR
mVMCLcwkAF8mR/OT9PgG1T09CCR83A==
=ZWcQ
-----END PGP SIGNATURE-----

--gGAW67Uhqz8Mj2oS--
