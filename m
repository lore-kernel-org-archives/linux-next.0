Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489F12D9ED1;
	Mon,  6 Apr 2026 13:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775482756; cv=none; b=OrnaWkpACKdKFHX3RaeQCnm2Nj8cRFxcsoxCSUPYpvmMM9BDTu7Rximn2pXitQjBZQWOY+tK3GAkcQE1v/i60b0YdqOXf+QNVowqoTPRE3TctogesbQqSSIHiQ2JyeXLOnTctaHNgT4NM5JButaM+6pmHIkHs3FH7CXrZxyQCB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775482756; c=relaxed/simple;
	bh=GswinvEtewuqUQnn9wq3CkURu8m8dU2exGe8H4DajmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8Z8aEq9ZRzmFvHnP9cggBkQoOnfibfHzu9dv5kM+vdnMDd6PMyDtiHDEqIYmG/+cpmyY5EnZUfZiiUItFYTJfKSM4ybMNw7qJtTMNEl0CH022R9nG5tF+iN36LGcenJZ7hUpyIXGi4dFPTmC+yu6RzV50wn/5xG5uz9H58yqLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mD3whoDk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mD3whoDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C0AC4CEF7;
	Mon,  6 Apr 2026 13:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775482756;
	bh=GswinvEtewuqUQnn9wq3CkURu8m8dU2exGe8H4DajmQ=;
	h=Date:From:To:Cc:Subject:From;
	b=mD3whoDkAOZFIEkYDkdos49rFFc7xDdQB5UXkTsz6b2DKDfCmVZGdC77gxY/uztwT
	 BkI+PrVqpHCJYGmYEgTnWHSPcbbXEFNFkcO+hCLfztXf1Jpcy+djYfXtXF1Q7xM5wz
	 i65sqDBjDYkPHHXYZRqYBY+i4x2lcWrySjVzQy2E4IriLXRT5RwGJgiJMGORYgsR4Y
	 07hYtBl4Fa46Y3JbROT5sdF+6pF6WfjP5xvLlrDRhQ7E05D5nBTJ560zN1w+i5pyMa
	 m2fTyZtMCw3c7cwPUk0vhfCIJLAT+NuSkCgZ4Dpzn2+Jz4ENJOJI7VuoWrDuRZ2ap5
	 JO+5q76cf1UGA==
Date: Mon, 6 Apr 2026 14:39:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: linux-next: manual merge of the drm tree with the rust tree
Message-ID: <adO3fzHT81hnO2B4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CoZXfMuzItMiQZUy"
Content-Disposition: inline


--CoZXfMuzItMiQZUy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in:

  rust/kernel/lib.rs
  scripts/Makefile.build

between commit:

  7fa2b092b1ff8 ("rust: kbuild: remove `feature(...)`s that are now stable")

=66rom the rust tree and commits:

  80df573af9ef3 ("rust: drm: gem: shmem: Add DRM shmem helper abstraction")
  3cc319d5f433a ("rust: enable the `generic_arg_infer` feature")
  f9f0b4a1f35d3 ("rust: interop: Add list module for C linked list interfac=
e")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/lib.rs
index 9c2468ed94d8d,40de00ce4f971..0000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -16,8 -16,35 +16,9 @@@
  // Please see https://github.com/Rust-for-Linux/linux/issues/2 for detail=
s on
  // the unstable features in use.
  //
 -// Stable since Rust 1.79.0.
 -#![feature(generic_nonzero)]
 -#![feature(inline_const)]
 -#![feature(pointer_is_aligned)]
 -#![feature(slice_ptr_len)]
 -//
 -// Stable since Rust 1.80.0.
 -#![feature(slice_flatten)]
 -//
 -// Stable since Rust 1.81.0.
 -#![feature(lint_reasons)]
 -//
 -// Stable since Rust 1.82.0.
 -#![feature(offset_of_nested)]
 -#![feature(raw_ref_op)]
 -//
 -// Stable since Rust 1.83.0.
 -#![feature(const_maybe_uninit_as_mut_ptr)]
 -#![feature(const_mut_refs)]
 -#![feature(const_option)]
 -#![feature(const_ptr_write)]
 -#![feature(const_refs_to_cell)]
 -#![feature(const_refs_to_static)]
 -//
--// Stable since Rust 1.84.0.
--#![feature(strict_provenance)]
+ //
+ // Stable since Rust 1.89.0.
+ #![feature(generic_arg_infer)]
  //
  // Expected to become stable.
  #![feature(arbitrary_self_types)]
diff --cc scripts/Makefile.build
index 9a87a7edbc871,010d08472fb2b..0000000000000
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@@ -310,14 -310,19 +310,14 @@@ $(obj)/%.lst: $(obj)/%.c FORC
 =20
  # The features in this list are the ones allowed for non-`rust/` code.
  #
 -#   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`.
 -#   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
 -#   - Stable since Rust 1.82.0: `feature(asm_const)`,
 -#     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
--#   - Stable since Rust 1.84.0: `feature(strict_provenance)`.
  #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
+ #   - Stable since Rust 1.89.0: `feature(generic_arg_infer)`.
  #   - Expected to become stable: `feature(arbitrary_self_types)`.
  #   - To be determined: `feature(used_with_arg)`.
  #
  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details=
 on
  # the unstable features in use.
- rust_allowed_features :=3D arbitrary_self_types,asm_goto,slice_ptr_len,st=
rict_provenance,used_with_arg
 -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,generi=
c_arg_infer,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_p=
rovenance,used_with_arg
++rust_allowed_features :=3D arbitrary_self_types,asm_goto,generic_arg_infe=
r,used_with_arg
 =20
  # `--out-dir` is required to avoid temporaries being created by `rustc` i=
n the
  # current working directory, which may be not accessible in the out-of-tr=
ee

--CoZXfMuzItMiQZUy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTt34ACgkQJNaLcl1U
h9DexQf/S3toEdOJHFgBcVRQrdX3/S1TPu+QOkfeQ3btSZpGTZ2fNNSuec38H2Oz
HfahSXg5cdtcIVuESpNmwM9s6nL2L25tTddmsv68sEIjXd3kiyU7C9yd5kgiOEnO
a6MVFd/iuhlAEvteh+guLNmuPop1nrYgs4nbX4Fw/vaGw3BO0V3Jyekap4t56/0Z
NTkxDpVCsTEIqXGG5OMQkY8a9BH9teQS3M93tGqRkrklg9MHnK4MnPv4hyypFUXU
P1LK5aYORINzwUOwhDoQ3zL1e4luHct4czsFaDVqjkWe/JhQeXYDr9z9E0kjx6j7
Ly+XkGZL8HHd6ff5LAHd80yHzagGFA==
=koeE
-----END PGP SIGNATURE-----

--CoZXfMuzItMiQZUy--
