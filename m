Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8AA3A4F32;
	Wed, 21 Jan 2026 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014781; cv=none; b=ONa9MFLV/J9vVKfAljkxQSOQrPy0bwXLlscyVCfw7JYTYxLF+uTpC4VGfv3i3BPXFB2QDR73U//nQgf1dmYvyZ1n1/90AgBNi6DNlzZLk/+j/hp5sEYADYVvyVSM3nH6G1YLNsVQjvdbLXALfWCo+RJkFXky4oLo6CiHe/EXrfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014781; c=relaxed/simple;
	bh=9hvnqkbII96Lrsi614pIptc4vuN4S3AvU9vB1Y+Us48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RbHPMnt2ka/JHCjYPOkF3jBNYojw5Y9hitO+9/v1YMUq5bxAAc0lLUIJis62vxbvr4BMVIerf+CbVBcEV1sfaVMXH6OfWQzj3TQXj5xHlxMWK/i11N1ZDZFwolzZDvQX1/b0VBPbPL/yLcSrUgfUZAEPDRLU7hcFWkLlBCLkzbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTzKqxq2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTzKqxq2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B331AC4CEF1;
	Wed, 21 Jan 2026 16:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769014780;
	bh=9hvnqkbII96Lrsi614pIptc4vuN4S3AvU9vB1Y+Us48=;
	h=Date:From:To:Cc:Subject:From;
	b=WTzKqxq2Po7vbqje367nyAtyYLzRfzg604CRB2e3CQhszz4bg4L1FtPdoyloiG7Bs
	 cWTlNvjlOkuXnOUbC9940ipo1+PqfPK4tMrPU/34+Ig3q5NUvc3tGHcsFiKb6Sfgns
	 eqI1hPFAiyix/d8Me6M+DEvPaEpugOX0bIXeOdv5SHDHnmjnxWpzlYF+eWcJ5IoAYE
	 Bd0psi7bIfEzYLgazpvsyc04ivqZpcQBQcRpsJ941FsK8fRlA0eOpha1XrisxjJ5AV
	 nl/8+mZkH+7vB88WEQGuU2JKJ+iZtKrTc/DrWruFRovCnI024rtM9vmLwE0MVOkM9i
	 IGBDTZhvIa0Zw==
Date: Wed, 21 Jan 2026 16:59:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-rust tree with the drm-misc tree
Message-ID: <aXEF-ESjd5ouyXRq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xa6EAKvnQuX+LG2Q"
Content-Disposition: inline


--xa6EAKvnQuX+LG2Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-rust tree got a conflict in:

  drivers/gpu/drm/tyr/gpu.rs

between commit:

  e005fd94e2e58 ("drm/tyr: rename pad0 to selected_coherency")

=66rom the drm-misc tree and commit:

  8304c44631c37 ("drm/tyr: use generated bindings for GpuInfo")

=66rom the drm-rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index fb7ef71454021..6395ffcfdc57c 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -1,12 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
=20
+use core::ops::Deref;
+use core::ops::DerefMut;
 use kernel::bits::genmask_u32;
 use kernel::device::Bound;
 use kernel::device::Device;
 use kernel::devres::Devres;
+use kernel::io::poll;
 use kernel::platform;
 use kernel::prelude::*;
-use kernel::time;
+use kernel::time::Delta;
 use kernel::transmute::AsBytes;
 use kernel::uapi;
=20
@@ -19,29 +22,9 @@
 /// # Invariants
 ///
 /// - The layout of this struct identical to the C `struct drm_panthor_gpu=
_info`.
-#[repr(C)]
-pub(crate) struct GpuInfo {
-    pub(crate) gpu_id: u32,
-    pub(crate) gpu_rev: u32,
-    pub(crate) csf_id: u32,
-    pub(crate) l2_features: u32,
-    pub(crate) tiler_features: u32,
-    pub(crate) mem_features: u32,
-    pub(crate) mmu_features: u32,
-    pub(crate) thread_features: u32,
-    pub(crate) max_threads: u32,
-    pub(crate) thread_max_workgroup_size: u32,
-    pub(crate) thread_max_barrier_size: u32,
-    pub(crate) coherency_features: u32,
-    pub(crate) texture_features: [u32; 4],
-    pub(crate) as_present: u32,
-    pub(crate) selected_coherency: u32,
-    pub(crate) shader_present: u64,
-    pub(crate) l2_present: u64,
-    pub(crate) tiler_present: u64,
-    pub(crate) core_features: u32,
-    pub(crate) pad: u32,
-}
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);
=20
 impl GpuInfo {
     pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Resul=
t<Self> {
@@ -74,7 +57,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoM=
em>) -> Result<Self> {
         let l2_present =3D u64::from(regs::GPU_L2_PRESENT_LO.read(dev, iom=
em)?);
         let l2_present =3D l2_present | u64::from(regs::GPU_L2_PRESENT_HI.=
read(dev, iomem)?) << 32;
=20
-        Ok(Self {
+        Ok(Self(uapi::drm_panthor_gpu_info {
             gpu_id,
             gpu_rev,
             csf_id,
@@ -96,7 +79,8 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoM=
em>) -> Result<Self> {
             tiler_present,
             core_features,
             pad: 0,
-        })
+            gpu_features: 0,
+        }))
     }
=20
     pub(crate) fn log(&self, pdev: &platform::Device) {
@@ -155,6 +139,20 @@ pub(crate) fn pa_bits(&self) -> u32 {
     }
 }
=20
+impl Deref for GpuInfo {
+    type Target =3D uapi::drm_panthor_gpu_info;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl DerefMut for GpuInfo {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.0
+    }
+}
+
 // SAFETY: `GpuInfo`'s invariant guarantees that it is the same type that =
is
 // already exposed to userspace by the C driver. This implies that it fulf=
ills
 // the requirements for `AsBytes`.
@@ -207,14 +205,13 @@ fn from(value: u32) -> Self {
 pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> R=
esult {
     regs::L2_PWRON_LO.write(dev, iomem, 1)?;
=20
-    // TODO: We cannot poll, as there is no support in Rust currently, so =
we
-    // sleep. Change this when read_poll_timeout() is implemented in Rust.
-    kernel::time::delay::fsleep(time::Delta::from_millis(100));
-
-    if regs::L2_READY_LO.read(dev, iomem)? !=3D 1 {
-        dev_err!(dev, "Failed to power on the GPU\n");
-        return Err(EIO);
-    }
+    poll::read_poll_timeout(
+        || regs::L2_READY_LO.read(dev, iomem),
+        |status| *status =3D=3D 1,
+        Delta::from_millis(1),
+        Delta::from_millis(100),
+    )
+    .inspect_err(|_| dev_err!(dev, "Failed to power on the GPU."))?;
=20
     Ok(())
 }

--xa6EAKvnQuX+LG2Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlxBfgACgkQJNaLcl1U
h9Dv2wf9HSWjjIjwGs1n2+92/3L/Vb1C8eYoN9h4l9DAASZCXCHDyvyTf/FeKQcA
VV/JABjNXM2oRraTx3Tv+eaKG6idllH/FYhtxgBv7hoZfiSMlHROqMBWF1dRNs4g
CJwP1iCM2UYO6e4oGX3yGXpghcxR6DqocxhS019VBmSRbbmDDcYsQ02PbkyCECyo
q3ZHOkYeobWnY4qF/lLWbnhMPfuTag/4A+0EabccmFHOg3BK7hP2vr3OTLKr8Mhr
7HVTyNNDANR3DVZ9zBiBRp6SxaDb59eLAAsHMUNgLWfIdLPtT3x3eMIg8l1io4Ug
z2J5Q1LFwaV+LXDqK+wX1ycsiWX52A==
=U3wa
-----END PGP SIGNATURE-----

--xa6EAKvnQuX+LG2Q--
