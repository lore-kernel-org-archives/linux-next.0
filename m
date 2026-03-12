Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9123D281;
	Thu, 12 Mar 2026 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325617; cv=none; b=BqfHfkySe+ij/T975scTovs35pMICFSiW5DlzBvTI/buKhsweVNzkW9e1W36JsU+uMqD4OY15Cc2MegA6JeijA9YRMHYZkLi4yjxSQA0Z+ONAxniIYlrIPtOhSiAwaG0XNK87XpiJ/MtgDyev6fVe91k9IsauK9vl8FNbIESlCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325617; c=relaxed/simple;
	bh=pFIycD2h9kuZzhfWtTrr3WvzGycntn6WbnjX/JR8ijY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U2w6dO6VAJqSqe1vEPHh12Twg8YzRmSO9aIjW+Rt2460Lz2fMXpU0NvMHDW2VWhJIPj14CUyGj98PDXACcxx3CeXWgo9Yf5omG55Al/IGZ3rBMnpciA0iUdcP6jvnZkfjGkIkK7TGtCLk53g3AOzmIJxWcxwWWRKmuhll/yjfGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SROaxN4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SROaxN4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867C2C4CEF7;
	Thu, 12 Mar 2026 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773325617;
	bh=pFIycD2h9kuZzhfWtTrr3WvzGycntn6WbnjX/JR8ijY=;
	h=Date:From:To:Cc:Subject:From;
	b=SROaxN4rXibiO+e/g8sIWxhfYxwINfDPBl1dxIsB+xGzj/YbTesqV799NLTV8TXW7
	 2MGwvL1/j0duMiXGPa8+mjIyVNc0e8QOnRUreZJ1g+3BjMA7LbM8KO6PUbOL/q9XAE
	 JU1UjbIZneUkyoe3X05KOv8T2ueKyiPPstk4RiF9vjP8PQrjGRAgiciXABeF4Ot+F/
	 yZTWpIadlxEJ7HkaUcZucc3TVTiiqgCJk3YlQmr1DZqScMB+a2Yws5kOVRV2DleJJE
	 Wl6DVAqd4ULgQBNUeDCn2guyEovVy37LJw/G9rp7tZk3bOohEZTwpre8sKJFTZjd1I
	 I6oh8OIvxjhrg==
Date: Thu, 12 Mar 2026 14:26:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tim Kovalenko <tim.kovalenko@proton.me>
Subject: linux-next: manual merge of the drm-rust tree with the
 drm-rust-fixes tree
Message-ID: <abLNLEf0TMz3ytmX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LlT4UTfoMVosdU6R"
Content-Disposition: inline


--LlT4UTfoMVosdU6R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-rust tree got conflicts in:

  drivers/gpu/nova-core/gsp/cmdq.rs
  drivers/gpu/nova-core/gsp/fw.rs

between commits:

  c7940c8bf215b ("gpu: nova-core: fix stack overflow in GSP memory allocati=
on")
  0073a17b46668 ("gpu: nova-core: gsp: fix UB in DmaGspMem pointer accessor=
s")

=66rom the drm-rust-fixes tree and commit:

  e8f4f9ae86a46 ("gpu: nova-core: gsp: support large RPCs via continuation =
record")

=66rom the drm-rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/nova-core/gsp/cmdq.rs
index 03a4f35998498,e0b096546d233..0000000000000
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@@ -1,9 -1,14 +1,8 @@@
  // SPDX-License-Identifier: GPL-2.0
 =20
- use core::{
-     cmp,
-     mem, //
- };
+ mod continuation;
+=20
 -use core::{
 -    mem,
 -    sync::atomic::{
 -        fence,
 -        Ordering, //
 -    }, //
 -};
++use core::mem;
 =20
  use kernel::{
      device,
@@@ -154,24 -170,21 +165,26 @@@ pub(super) struct Msgq=20
 =20
  /// Structure shared between the driver and the GSP and containing the co=
mmand and message queues.
  #[repr(C)]
 -struct GspMem {
 +// TODO: Revert to private once `IoView` projections replace the `gsp_mem=
` module.
 +pub(super) struct GspMem {
      /// Self-mapping page table entries.
 -    ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
 +    ptes: PteArray<{ Self::PTE_ARRAY_SIZE }>,
      /// CPU queue: the driver writes commands here, and the GSP reads the=
m. It also contains the
-     /// write and read pointers that the CPU updates.
+     /// write and read pointers that the CPU updates. This means that the=
 read pointer here is an
+     /// index into the GSP queue.
      ///
      /// This member is read-only for the GSP.
 -    cpuq: Msgq,
 +    pub(super) cpuq: Msgq,
      /// GSP queue: the GSP writes messages here, and the driver reads the=
m. It also contains the
-     /// write and read pointers that the GSP updates.
+     /// write and read pointers that the GSP updates. This means that the=
 read pointer here is an
+     /// index into the CPU queue.
      ///
      /// This member is read-only for the driver.
 -    gspq: Msgq,
 +    pub(super) gspq: Msgq,
 +}
 +
 +impl GspMem {
 +    const PTE_ARRAY_SIZE: usize =3D GSP_PAGE_SIZE / size_of::<u64>();
  }
 =20
  // SAFETY: These structs don't meet the no-padding requirements of AsByte=
s but
@@@ -327,27 -359,42 +369,27 @@@ impl DmaGspMem=20
      //
      // # Invariants
      //
-     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+     // - The returned value is within `0..MSGQ_NUM_PAGES`.
      fn gsp_write_ptr(&self) -> u32 {
 -        let gsp_mem =3D self.0.start_ptr();
 -
 -        // SAFETY:
 -        //  - The 'CoherentAllocation' contains at least one object.
 -        //  - By the invariants of `CoherentAllocation` the pointer is va=
lid.
 -        (unsafe { (*gsp_mem).gspq.tx.write_ptr() } % MSGQ_NUM_PAGES)
 +        super::fw::gsp_mem::gsp_write_ptr(&self.0)
      }
 =20
      // Returns the index of the memory page the GSP will read the next co=
mmand from.
      //
      // # Invariants
      //
-     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+     // - The returned value is within `0..MSGQ_NUM_PAGES`.
      fn gsp_read_ptr(&self) -> u32 {
 -        let gsp_mem =3D self.0.start_ptr();
 -
 -        // SAFETY:
 -        //  - The 'CoherentAllocation' contains at least one object.
 -        //  - By the invariants of `CoherentAllocation` the pointer is va=
lid.
 -        (unsafe { (*gsp_mem).gspq.rx.read_ptr() } % MSGQ_NUM_PAGES)
 +        super::fw::gsp_mem::gsp_read_ptr(&self.0)
      }
 =20
      // Returns the index of the memory page the CPU can read the next mes=
sage from.
      //
      // # Invariants
      //
-     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+     // - The returned value is within `0..MSGQ_NUM_PAGES`.
      fn cpu_read_ptr(&self) -> u32 {
 -        let gsp_mem =3D self.0.start_ptr();
 -
 -        // SAFETY:
 -        //  - The ['CoherentAllocation'] contains at least one object.
 -        //  - By the invariants of CoherentAllocation the pointer is vali=
d.
 -        (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
 +        super::fw::gsp_mem::cpu_read_ptr(&self.0)
      }
 =20
      // Informs the GSP that it can send `elem_count` new pages into the m=
essage queue.
@@@ -359,9 -416,14 +401,9 @@@
      //
      // # Invariants
      //
-     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
+     // - The returned value is within `0..MSGQ_NUM_PAGES`.
      fn cpu_write_ptr(&self) -> u32 {
 -        let gsp_mem =3D self.0.start_ptr();
 -
 -        // SAFETY:
 -        //  - The 'CoherentAllocation' contains at least one object.
 -        //  - By the invariants of `CoherentAllocation` the pointer is va=
lid.
 -        (unsafe { (*gsp_mem).cpuq.tx.write_ptr() } % MSGQ_NUM_PAGES)
 +        super::fw::gsp_mem::cpu_write_ptr(&self.0)
      }
 =20
      // Informs the GSP that it can process `elem_count` new pages from th=
e command queue.
diff --cc drivers/gpu/nova-core/gsp/fw.rs
index 040b30ec3089b,25fca1f6db2c8..0000000000000
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@@ -40,75 -39,10 +39,79 @@@ use crate::
      },
  };
 =20
 +// TODO: Replace with `IoView` projections once available; the `unwrap()`=
 calls go away once we
 +// switch to the new `dma::Coherent` API.
 +pub(super) mod gsp_mem {
 +    use core::sync::atomic::{
 +        fence,
 +        Ordering, //
 +    };
 +
 +    use kernel::{
 +        dma::CoherentAllocation,
 +        dma_read,
 +        dma_write,
 +        prelude::*, //
 +    };
 +
 +    use crate::gsp::cmdq::{
 +        GspMem,
 +        MSGQ_NUM_PAGES, //
 +    };
 +
 +    pub(in crate::gsp) fn gsp_write_ptr(qs: &CoherentAllocation<GspMem>) =
-> u32 {
 +        // PANIC: A `dma::CoherentAllocation` always contains at least on=
e element.
 +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.tx.0.writePtr) % M=
SGQ_NUM_PAGES) }().unwrap()
 +    }
 +
 +    pub(in crate::gsp) fn gsp_read_ptr(qs: &CoherentAllocation<GspMem>) -=
> u32 {
 +        // PANIC: A `dma::CoherentAllocation` always contains at least on=
e element.
 +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.rx.0.readPtr) % MS=
GQ_NUM_PAGES) }().unwrap()
 +    }
 +
 +    pub(in crate::gsp) fn cpu_read_ptr(qs: &CoherentAllocation<GspMem>) -=
> u32 {
 +        // PANIC: A `dma::CoherentAllocation` always contains at least on=
e element.
 +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.cpuq.rx.0.readPtr) % MS=
GQ_NUM_PAGES) }().unwrap()
 +    }
 +
 +    pub(in crate::gsp) fn advance_cpu_read_ptr(qs: &CoherentAllocation<Gs=
pMem>, count: u32) {
 +        let rptr =3D cpu_read_ptr(qs).wrapping_add(count) % MSGQ_NUM_PAGE=
S;
 +
 +        // Ensure read pointer is properly ordered.
 +        fence(Ordering::SeqCst);
 +
 +        // PANIC: A `dma::CoherentAllocation` always contains at least on=
e element.
 +        || -> Result {
 +            dma_write!(qs, [0]?.cpuq.rx.0.readPtr, rptr);
 +            Ok(())
 +        }()
 +        .unwrap()
 +    }
 +
 +    pub(in crate::gsp) fn cpu_write_ptr(qs: &CoherentAllocation<GspMem>) =
-> u32 {
 +        // PANIC: A `dma::CoherentAllocation` always contains at least on=
e element.
 +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.cpuq.tx.0.writePtr) % M=
SGQ_NUM_PAGES) }().unwrap()
 +    }
 +
 +    pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &CoherentAllocation<G=
spMem>, count: u32) {
 +        let wptr =3D cpu_write_ptr(qs).wrapping_add(count) % MSGQ_NUM_PAG=
ES;
 +
 +        // PANIC: A `dma::CoherentAllocation` always contains at least on=
e element.
 +        || -> Result {
 +            dma_write!(qs, [0]?.cpuq.tx.0.writePtr, wptr);
 +            Ok(())
 +        }()
 +        .unwrap();
 +
 +        // Ensure all command data is visible before triggering the GSP r=
ead.
 +        fence(Ordering::SeqCst);
 +    }
 +}
 +
+ /// Maximum size of a single GSP message queue element in bytes.
+ pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =3D
+     num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
+=20
  /// Empty type to group methods related to heap parameters for running th=
e GSP firmware.
  enum GspFwHeapParams {}
 =20

--LlT4UTfoMVosdU6R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyzSwACgkQJNaLcl1U
h9AlGwf+OPw6Ia8ePF3OcG6W379B8GTAKqU1evt8q9Yh8snaRIpUF/kwZ+RfPC3X
e3i0SPsv34z867HNKUHCpkNSYSZphAoTEvIyB9trcCVS1aiCe308Ov737j/b8z1F
nwKP4xJobN9r78Y0lLDjYhGK63LNwTzYHTCG15iNpJc1CUt708pEKPXTjB+OtcOq
r5onik7F/cW5jDZlRz7W7OwWjIZqjo6Ez+iAtVcFwJrf57xYJqRD5W0j7dKoPqsW
rf06yIo7Cy/oh6JDtgUVyGo+PwV8zcnDdU6QPDv+KKTLRJ4fhXGUzTagP2gN7TFe
yr9TbQWJ2uadEWDF7n3DLDgUK86ryg==
=iIoZ
-----END PGP SIGNATURE-----

--LlT4UTfoMVosdU6R--
