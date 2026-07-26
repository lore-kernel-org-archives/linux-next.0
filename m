Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9D5189F43;
	Sun, 26 Jul 2026 21:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785103034; cv=none; b=lM9w7sYQF58VKWotSQDErmIRM8hcI7uJkz/2Y9Cw2wrMmgQVMyTeSksJiDgAqfO6DwA9I13H22UzCVbIZKTsWiRCyqILc4dtFISLpbXfY4dxnCXM9y7BXAjgcEcRTGHlT4lKNMhHr+ppIr3ffEoRBNC/jUF4a9nRk+p4zwj9xmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785103034; c=relaxed/simple;
	bh=WG5H2vnxvU6PhAxktvb2HVowdjZCC03RWRNPkCCIhwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1aoZot0DwwO/eenVwKRS3E9yilVeU6yMp8KktS+GUtp0bWi+K0VCss4Zr8MZFdQvBDFi3yYPCrshEh20WHFRaOMC20QxXwZC1cg70vuvcRY45Ge8jhwD2HyfqUxGAy9umEpwAZC970diZcG5+psa8gy+iAvMOgaGZobCQT7IX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHTn6vXs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHTn6vXs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F091F000E9;
	Sun, 26 Jul 2026 21:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785103033;
	bh=7L1DGsKIziDkSrD8mkuFKVlNJFRtUjwEbwtCQVFnC6Y=;
	h=Date:From:To:Cc:Subject;
	b=IHTn6vXsVyxjjI3BSQFhuiLaJNTgh8HBwh5oR2T+LyC2TKlDGfRjy0fSUergSqnN7
	 p1noultk1LeWmWPd3XXz9MrROUime2CCnAexGifZpEAk7TFjFTvULwkuxxBdBeLViu
	 DQPaVr4U0813YFv8IU1ohmMNaEi9yKyv/hIMcHG20j5oLTGlfJY/xdcaA09rE4ps0a
	 h5cBZItlSNgmv/2LRd/g4y1fihsZ0We+kUbizfgXZEzbkrlqAAaCCXsUyvOmub2cuJ
	 8ScIeEG8Rlxhs+LdZeW8kSiq36J1Hhncl4CjPJ+bFIibfajF7bEXwrhgNAuiffAmSC
	 1YhM2bgudJeFg==
Date: Sun, 26 Jul 2026 22:57:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the driver-core tree with the drm-rust
 tree
Message-ID: <amaCtUBUZZ400yf3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="40rHxaAZdzrjbUEj"
Content-Disposition: inline


--40rHxaAZdzrjbUEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/gpu/nova-core/gpu.rs

between commit:

  f1aab4b1ab829 ("gpu: nova-core: avoid repeated calls to pci::Device::as_r=
ef")

=66rom the drm-rust tree and commit:

  f7acb19abcd86 ("rust: device: make lifetime on `Core` and `CoreInternal` =
invariant")

=66rom the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/nova-core/gpu.rs
index 42a4cd7971fa1,b603b0bd2692b..0000000000000
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@@ -277,61 -284,15 +277,61 @@@ struct GspResources<'gpu>=20
      unload_bundle: Option<gsp::UnloadBundle>,
  }
 =20
 +/// Structure holding the resources required to operate the GPU.
 +#[pin_data]
 +pub(crate) struct Gpu<'gpu> {
 +    spec: Spec,
 +    /// Static GPU information as provided by the GSP.
 +    gsp_static_info: GetGspStaticInfoReply,
 +    /// GSP and its resources.
 +    #[pin]
 +    gsp_resources: GspResources<'gpu>,
 +    /// System memory page required for flushing all pending GPU-side mem=
ory writes done through
 +    /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory=
-barrier operation).
 +    ///
 +    /// Must be kept declared *after* `gsp_resources`, as the latter's `P=
innedDrop` implementation
 +    /// requires the sysmem flush page to be in place.
 +    sysmem_flush: SysmemFlush<'gpu>,
 +}
 +
 +#[pinned_drop]
 +impl PinnedDrop for GspResources<'_> {
 +    fn drop(self: Pin<&mut Self>) {
 +        let this =3D self.project();
 +        let device =3D *this.device;
 +        let bar =3D *this.bar;
 +        let bundle =3D this.unload_bundle.take();
 +
 +        let _ =3D this
 +            .gsp
 +            .as_ref()
 +            .get_ref()
 +            .unload(
 +                GspBootContext {
 +                    pdev: device,
 +                    bar,
 +                    chipset: this.spec.chipset,
 +                    gsp_falcon: &*this.gsp_falcon,
 +                    sec2_falcon: &*this.sec2_falcon,
 +                    fsp: this.fsp.as_mut(),
 +                    vgpu: &*this.vgpu,
 +                },
 +                bundle,
 +            )
 +            .inspect_err(|e| dev_err!(device, "failed to unload GSP: {:?}=
\n", e));
 +    }
 +}
 +
  impl<'gpu> Gpu<'gpu> {
-     pub(crate) fn new(
-         pdev: &'gpu pci::Device<device::Core<'_>>,
+     pub(crate) fn new<'a>(
+         pdev: &'gpu pci::Device<device::Core<'a>>,
          bar: Bar0<'gpu>,
-     ) -> impl PinInit<Self, Error> + 'gpu {
+     ) -> impl PinInit<Self, Error> + use<'gpu, 'a> {
 +        let dev =3D pdev.as_ref();
 +
          try_pin_init!(Self {
 -            device: pdev.as_ref(),
 -            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
 -                dev_info!(pdev,"NVIDIA ({})\n", spec);
 +            spec: Spec::new(dev, bar).inspect(|spec| {
 +                dev_info!(dev,"NVIDIA ({})\n", spec);
              })?,
 =20
              // We must wait for GFW_BOOT completion before doing any sign=
ificant setup on the GPU.

--40rHxaAZdzrjbUEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmgrQACgkQJNaLcl1U
h9AN8Af9Emkl6ChY7h/+QJ1DFDDPMZ+sGEYC0Hd08Aaez54exYlRVplaxZhVUNtT
upIIIQyvHXfiJbFYJBmTlt4byPfgH55HDBap2HFExmr64EGUJ1FLX/qR5J+5r8U7
Ha0MDz0czqCy0X8i1fLuicwWQvGBjuhc7/e/mIAHGnmY+wFwoylXFcWJlCpZVeXA
ZItDoDHySr5pi2nVMe0fTjGf7l/jXSITB/Z9mNMHH5MvnMZcJXY+WW547uoDl6q+
i4jcH5dUNF4lJEE7jIAmcbuYQUCIDKDxFt//L2ZXqd8+RBdQw3b1VwVLF6uJbPuA
EaIAlPqlUk+71aoqxTo2PUx+hN4bVw==
=BxyC
-----END PGP SIGNATURE-----

--40rHxaAZdzrjbUEj--
