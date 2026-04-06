Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44B037267B;
	Mon,  6 Apr 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481155; cv=none; b=qkOtbNmB3401eEzLIp4eYjqRx0k9FyGI7VvYLb/zKPHGFyfJ30U7BqY4W0eW3SfNhYw3bjLrbRHHvJQXhvqLkU3t2mQEa3kCN1mxTWZRPFXRHGkotu9pL15Ubc1SGMiArkQruAN5W8FwtSfq+wYI6ceQKVzJYeIMilUYrf5VK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481155; c=relaxed/simple;
	bh=Cf3OqK5dhus2lnbIqnndVfDbveVe8j0f/FUEcfKYJ8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MW1/j4MNVShFE3M+rV2z0LMtDnJ30e9EMJc3fWv/hpEI7kIYoFXbVNsTkK7aC6sJpHEbd+magx7Opn0qDE1w6MwG29k0+GK+0V8tp71NZ6NWdZL6OepMM3dxPHuln0VdfJCx3lb2u5BbHXKmEx7hxqwXiTRsIXP0F7xPXfiyTfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2tEG1uZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2tEG1uZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D14BC4CEF7;
	Mon,  6 Apr 2026 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775481155;
	bh=Cf3OqK5dhus2lnbIqnndVfDbveVe8j0f/FUEcfKYJ8I=;
	h=Date:From:To:Cc:Subject:From;
	b=m2tEG1uZYQTuJygsmAmVzvqGWCvY+JCrtVmpZ+6A5VTxHxyqXYTtHzC3xkPjl3AxJ
	 eW1w/97Q30G7oJJhJN6a/lhzmmynAeHqPCFhOVjChs1YQu0o/XEKYyWQ5DEUAH308e
	 TyGAmtYWq2XiS30NTCvSpUMVsrgJA6RjAlBP8aZHav9zfZ5oHf2YrW3HcVeEjwFC2t
	 x7TMsQAonD+FmHk9fiTtn0QHwbM1ObPUtT8NnR4uUq4Vi2c9qEs8OOpY/7n93VVuJm
	 G2Ypoh81/o6taMqKzddZA9gdE3esR+/klDGIDBIiNWuohagsb8bBxx8YKn6MF9yccz
	 LjcVnDimZFVlA==
Date: Mon, 6 Apr 2026 14:12:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the origin tree
Message-ID: <adOxP2EZn8V0RmPZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R4ijibj2EszzY20l"
Content-Disposition: inline


--R4ijibj2EszzY20l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  scripts/Makefile.build

between commit:

  f41941aab3acd ("rust: ptr: add projection infrastructure")

=66rom the origin tree and commit:

  7fa2b092b1ff8 ("rust: kbuild: remove `feature(...)`s that are now stable")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/Makefile.build
index 3652b85be5459,57cff77c28973..0000000000000
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@@ -310,18 -310,13 +310,14 @@@ $(obj)/%.lst: $(obj)/%.c FORC
 =20
  # The features in this list are the ones allowed for non-`rust/` code.
  #
- #   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`.
- #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
- #   - Stable since Rust 1.82.0: `feature(asm_const)`,
- #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
 +#   - Stable since Rust 1.84.0: `feature(strict_provenance)`.
  #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
  #   - Expected to become stable: `feature(arbitrary_self_types)`.
  #   - To be determined: `feature(used_with_arg)`.
  #
  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details=
 on
  # the unstable features in use.
- rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_r=
easons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_wit=
h_arg
 -rust_allowed_features :=3D arbitrary_self_types,asm_goto,used_with_arg
++rust_allowed_features :=3D arbitrary_self_types,asm_goto,slice_ptr_len,st=
rict_provenance,used_with_arg
 =20
  # `--out-dir` is required to avoid temporaries being created by `rustc` i=
n the
  # current working directory, which may be not accessible in the out-of-tr=
ee

--R4ijibj2EszzY20l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTsT4ACgkQJNaLcl1U
h9B7jQf/XKKwxjzHoOesnOKO8ed1TyAS0RjVt3vuRku8k5NWrusU7wDfp+nNEpm1
talW2fyExIIcolHlygB3nG2qEtTBAEMJhWczRn65QvPuNWPVtuvUJM76/RblE5M6
+/r4vFEsD0UCuYTfZ8ffydFDC5J5gX56fE0FGyy9ZmAyi+9xK6TcoR+IUUDhUVwK
V4ll8yvz+YY8T1K75VSIZROXJ9T5SCmfBBL3NAdUBjdXYun6R4hxsxsWB7PnXRTR
ydPjLkzHUznbDrGXXwmeY3bvQniDU/UrXPvjmUWR86D8yt4d/uWhoU1qoFJK/BKR
dk84QiG6kV9yluws2v3ZQkqc0wcwpw==
=ty40
-----END PGP SIGNATURE-----

--R4ijibj2EszzY20l--
