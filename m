Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576CA3AE193;
	Fri,  3 Apr 2026 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223248; cv=none; b=MhKHa9FhtMXwqcYFL7zM7eROs9Mbr5kfm34/7lhXO9WQbdwKounKz6+y9Wc0FTVkNKeAN8UrnFHI63OaxMwRItejZQcj1pIz+CT9pNDl3CNKpTSwfaoeIS/lRuR/rrnKKB1UymJIvr2fmXir9JW9Ah0F63bDrkE0z4Fcyd0IZpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223248; c=relaxed/simple;
	bh=IcHv4oOfMBrBSIng/zNOaemGUvnfIlHm5aAp787qRuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O7JLvmlGeKs9xrZ3sf6g36SPFoBfuYgbzRXTKNef1d32TQBQNojQnOj2Yj/BSE2qm0ye5X39atuOWhUIE7KEsEoeAQQgsHryPoqDslV8mmYeIVXbOIM2lw+qiCvuKf6ilsG3jT4piz78ZrYZm5A7bFchuXmBjgjp3vfuhP29VLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjTAtIwr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjTAtIwr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C262C19423;
	Fri,  3 Apr 2026 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775223247;
	bh=IcHv4oOfMBrBSIng/zNOaemGUvnfIlHm5aAp787qRuw=;
	h=Date:From:To:Cc:Subject:From;
	b=WjTAtIwrlAtPuz1JUTlr/zssZbNujrCkZ5UIf7b420Q6pnjxrVY+0UcnjSxoFv2zD
	 RFgwmMi7axnU+dqUT1F80GqIrvmw9LbNzX4RIpyz3QTHYDADcNrC0IIm9e2XOO4xpv
	 GQswqMM7I7AEfVKREIxwcH0yYoTtTyCUQdCLdpfRAhYjROdNyiHfZM5U2mRbO9jGKV
	 jCb1ritcZdr/wJEv74jW535d3hGPIKmud6PTa5CK6VhFlQNSb2CcNnz+gxys5ka7vl
	 pMqBM/EUD/A/HtWLi01uM6lrzQSTwRJ8rOWV9EgBattQNt5AWeRaaXeuuEbKGeQfdD
	 niiWstDqjFyYg==
Date: Fri, 3 Apr 2026 14:34:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Deborah Brouwer <deborah.brouwer@collabora.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: linux-next: manual merge of the drm tree with the rust tree
Message-ID: <ac_Byw5cYys_lJ1a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UfQu2MS+g0QBbQaD"
Content-Disposition: inline


--UfQu2MS+g0QBbQaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/tyr/driver.rs

between commit:

  ef90b103e8f76 ("tyr: remove impl Send/Sync for TyrData")

=66rom the rust tree and commit:

  15da5bc9f3ada ("drm/tyr: Clarify driver/device type names")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/tyr/driver.rs
index e833e9f537b02,6114346415805..0000000000000
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@@ -1,44 -1,56 +1,56 @@@
  // SPDX-License-Identifier: GPL-2.0 or MIT
 =20
- use kernel::clk::Clk;
- use kernel::clk::OptionalClk;
- use kernel::device::Bound;
- use kernel::device::Core;
- use kernel::device::Device;
- use kernel::devres::Devres;
- use kernel::drm;
- use kernel::drm::ioctl;
- use kernel::io::poll;
- use kernel::new_mutex;
- use kernel::of;
- use kernel::platform;
- use kernel::prelude::*;
- use kernel::regulator;
- use kernel::regulator::Regulator;
- use kernel::sizes::SZ_2M;
- use kernel::sync::aref::ARef;
- use kernel::sync::Arc;
- use kernel::sync::Mutex;
- use kernel::time;
+ use kernel::{
+     clk::{
+         Clk,
+         OptionalClk, //
+     },
+     device::{
+         Bound,
+         Core,
+         Device, //
+     },
+     devres::Devres,
+     drm,
+     drm::ioctl,
+     io::poll,
+     new_mutex,
+     of,
+     platform,
+     prelude::*,
+     regulator,
+     regulator::Regulator,
+     sizes::SZ_2M,
+     sync::{
+         aref::ARef,
+         Arc,
+         Mutex, //
+     },
+     time, //
+ };
 =20
- use crate::file::File;
- use crate::gem::TyrObject;
- use crate::gpu;
- use crate::gpu::GpuInfo;
- use crate::regs;
+ use crate::{
+     file::TyrDrmFileData,
+     gem::TyrObject,
+     gpu,
+     gpu::GpuInfo,
+     regs, //
+ };
 =20
  pub(crate) type IoMem =3D kernel::io::mem::IoMem<SZ_2M>;
 =20
+ pub(crate) struct TyrDrmDriver;
+=20
  /// Convenience type alias for the DRM device type for this driver.
- pub(crate) type TyrDevice =3D drm::Device<TyrDriver>;
+ pub(crate) type TyrDrmDevice =3D drm::Device<TyrDrmDriver>;
 =20
  #[pin_data(PinnedDrop)]
- pub(crate) struct TyrDriver {
-     _device: ARef<TyrDevice>,
+ pub(crate) struct TyrPlatformDriverData {
+     _device: ARef<TyrDrmDevice>,
  }
 =20
  #[pin_data(PinnedDrop)]
- pub(crate) struct TyrData {
+ pub(crate) struct TyrDrmDeviceData {
      pub(crate) pdev: ARef<platform::Device>,
 =20
      #[pin]
@@@ -53,6 -65,18 +65,6 @@@
      pub(crate) gpu_info: GpuInfo,
  }
 =20
 -// Both `Clk` and `Regulator` do not implement `Send` or `Sync`, but they
 -// should. There are patches on the mailing list to address this, but the=
y have
 -// not landed yet.
 -//
 -// For now, add this workaround so that this patch compiles with the prom=
ise
 -// that it will be removed in a future patch.
 -//
 -// SAFETY: This will be removed in a future patch.
 -unsafe impl Send for TyrDrmDeviceData {}
 -// SAFETY: This will be removed in a future patch.
 -unsafe impl Sync for TyrDrmDeviceData {}
 -
  fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result=
 {
      regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
 =20
@@@ -70,14 -94,14 +82,14 @@@
  kernel::of_device_table!(
      OF_TABLE,
      MODULE_OF_TABLE,
-     <TyrDriver as platform::Driver>::IdInfo,
+     <TyrPlatformDriverData as platform::Driver>::IdInfo,
      [
          (of::DeviceId::new(c"rockchip,rk3588-mali"), ()),
          (of::DeviceId::new(c"arm,mali-valhall-csf"), ())
      ]
  );
 =20
- impl platform::Driver for TyrDriver {
+ impl platform::Driver for TyrPlatformDriverData {
      type IdInfo =3D ();
      const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D Some(&OF_TAB=
LE);
 =20
@@@ -107,7 -131,7 +119,7 @@@
 =20
          let platform: ARef<platform::Device> =3D pdev.into();
 =20
-         let data =3D try_pin_init!(TyrData {
+         let data =3D try_pin_init!(TyrDrmDeviceData {
                  pdev: platform.clone(),
                  clks <- new_mutex!(Clocks {
                      core: core_clk,
@@@ -121,10 -145,10 +133,10 @@@
                  gpu_info,
          });
 =20
-         let tdev: ARef<TyrDevice> =3D drm::Device::new(pdev.as_ref(), dat=
a)?;
-         drm::driver::Registration::new_foreign_owned(&tdev, pdev.as_ref()=
, 0)?;
+         let ddev: ARef<TyrDrmDevice> =3D drm::Device::new(pdev.as_ref(), =
data)?;
+         drm::driver::Registration::new_foreign_owned(&ddev, pdev.as_ref()=
, 0)?;
 =20
-         let driver =3D TyrDriver { _device: tdev };
+         let driver =3D TyrPlatformDriverData { _device: ddev };
 =20
          // We need this to be dev_info!() because dev_dbg!() does not wor=
k at
          // all in Rust for now, and we need to see whether probe succeede=
d.
@@@ -134,12 -158,12 +146,12 @@@
  }
 =20
  #[pinned_drop]
- impl PinnedDrop for TyrDriver {
+ impl PinnedDrop for TyrPlatformDriverData {
      fn drop(self: Pin<&mut Self>) {}
  }
 =20
  #[pinned_drop]
- impl PinnedDrop for TyrData {
+ impl PinnedDrop for TyrDrmDeviceData {
      fn drop(self: Pin<&mut Self>) {
          // TODO: the type-state pattern for Clks will fix this.
          let clks =3D self.clks.lock();
@@@ -160,15 -184,15 +172,15 @@@ const INFO: drm::DriverInfo =3D drm::Driv
  };
 =20
  #[vtable]
- impl drm::Driver for TyrDriver {
-     type Data =3D TyrData;
-     type File =3D File;
+ impl drm::Driver for TyrDrmDriver {
+     type Data =3D TyrDrmDeviceData;
+     type File =3D TyrDrmFileData;
      type Object =3D drm::gem::Object<TyrObject>;
 =20
      const INFO: drm::DriverInfo =3D INFO;
 =20
      kernel::declare_drm_ioctls! {
-         (PANTHOR_DEV_QUERY, drm_panthor_dev_query, ioctl::RENDER_ALLOW, F=
ile::dev_query),
+         (PANTHOR_DEV_QUERY, drm_panthor_dev_query, ioctl::RENDER_ALLOW, T=
yrDrmFileData::dev_query),
      }
  }
 =20

--UfQu2MS+g0QBbQaD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPwcoACgkQJNaLcl1U
h9AKgAf9HJbs/MjCX3nXV51fwQjfMt5yx74Y8C5tZxBSZX0FhYn5kAfIJID6ngwp
JZQC1eA+pOn8hAy11Wx1aDpBDXcIfGEagcb6XsX1q93xhGfken5uC/u04NVqQ1gs
mYifgnX4gDG0FZxnp/b8RGEHyW519AYfOkMsAwda62MEq9T5Ev5Ohaf5i+8Te8Ru
02DEUVE9FWCB6KSC66Zgs9UiHj1kBwkwg06NFPhPd1Ls5kythMogVQMLxS25u62z
dAZr73DFWM4ujekzeWtKL9ahLzkgTbv4FheNXbgyrLG2BzTX98N5bLQLajYNH0XK
zlHmLn8LW6U2lZpTMhWSTXpoCVd5Qg==
=9QXD
-----END PGP SIGNATURE-----

--UfQu2MS+g0QBbQaD--
