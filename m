Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A89540DFC2;
	Mon, 30 Mar 2026 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887027; cv=none; b=D5xnH99GeVs+PACyfCTZleIp3EVkUUx3WehPzLpErlLyHvKZbJ1GPTcmmDVWaPX6v0YyIdaDiBPv2nkd8czUj0/1f9Hnb1EXi0cWapDZVhzC+q0jTL1202Uof/xoiwUXZcxFUK7aCya6E4ae8ZAKxhN1CRE1/7l0vLlFgJXEt4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887027; c=relaxed/simple;
	bh=yMV0vYN6EHLbUOYDQ3eLLlc+RQt2Qbu7otrTzdFFW1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JAycg5O2ol1v2EF13w6Pp0ATAYHJzoSqVA8B1cVDOtRuMMZo6t5vOkj19R9Bit/vzS64vIjgfJgg8csWzZ0PuuqwcIf/JtXU/C5CLomSYk0J4p3xziL7CvscTGAzMJtppiCUnW2Q1IFaT0gpgsK9DDsr5elLW1P408IshSnOJrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6/Xq8Lv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6/Xq8Lv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867D4C4CEF7;
	Mon, 30 Mar 2026 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774887027;
	bh=yMV0vYN6EHLbUOYDQ3eLLlc+RQt2Qbu7otrTzdFFW1o=;
	h=Date:From:To:Cc:Subject:From;
	b=T6/Xq8LvuK3ZTc4uRxImd2AHAO/4Hgrl2Tpy3AKJE744yJau4mtoJy6dW7H4+M2Lm
	 NIaOkX+i217CS6V317ziaj8jiHe03JyhRZA5yNsqomjB3iC8byJqemc5UoBbtzl2r6
	 qmD9a2uGBKvMzJnO7268pUcN0XaR+t1bqVvgOS0PuR/Rk9rHxp7bj+j80PfGcrDWVi
	 RN2KSeW4UD4eM0Iyo5YuT1wJd77ujrykwcszCubhqIlMGQFCw/KtEX9do2cRfMEp/m
	 vUtmtgitmOgceqw/qP1nlcNEilBnpZLMHaGHxXzb+LKmvD0aeEMN/i2FhJEEfu4Ti/
	 47b2fcsXAH2CQ==
Date: Mon, 30 Mar 2026 17:10:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: linux-next: manual merge of the drm-rust tree with the rust-next tree
Message-ID: <acqgbrNT--j-1wh8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YZcFtL7hj7rj30Wp"
Content-Disposition: inline


--YZcFtL7hj7rj30Wp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-rust tree got a conflict in:

  scripts/Makefile.build

between commits:

  560a7a9b9267f ("rust: add `const_assert!` macro")
  3a2486cc1da5c ("kbuild: rust: provide an option to inline C helpers into =
Rust")

=66rom the rust-next tree and commit:

  3cc319d5f433a ("rust: enable the `generic_arg_infer` feature")

=66rom the drm-rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/Makefile.build
index d2372d15f74c9,010d08472fb2b..0000000000000
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@@ -322,7 -322,7 +323,7 @@@ $(obj)/%.lst: $(obj)/%.c FORC
  #
  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details=
 on
  # the unstable features in use.
- rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,inline=
_const,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_proven=
ance,used_with_arg
 -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,generi=
c_arg_infer,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_p=
rovenance,used_with_arg
++rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,generi=
c_arg_infer,inline_const,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr=
_len,strict_provenance,used_with_arg
 =20
  # `--out-dir` is required to avoid temporaries being created by `rustc` i=
n the
  # current working directory, which may be not accessible in the out-of-tr=
ee

--YZcFtL7hj7rj30Wp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKoG4ACgkQJNaLcl1U
h9B1Pgf9HoYYOptWsLLQpBhVnnaom8E0Mp4f4kTSmtUqtiPKQrjE1LQ5zGYczGZR
e6K36wWaPnud/7sWlIiLLQ/8zRutZGXrat8GIwGFVKHXW0pPzpdBBbnEGiZJPkkT
CKvas+58zT1DA/4qJGp+U6M7BpCEJHOnGX+tTwKYjbt2v57vtKbTfGZT9WaDZEfV
ZgzIpO7oHzPVP5CIJKIMky7iINkx76KiJnvyD3/Cs5f0A6MnWRan4px+VRlWFIvS
GYe/C2KMlPUCvpZCKopmCM7WS4+yiihaEs5UfrI7jQYLTg4WNRU3itI+dDeI4k0W
zfNZT318vvZDGAgnXoEdV4X21EnNUw==
=6LAX
-----END PGP SIGNATURE-----

--YZcFtL7hj7rj30Wp--
