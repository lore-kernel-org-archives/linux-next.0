Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB533D1CD5;
	Mon, 30 Mar 2026 13:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876677; cv=none; b=bemk+mu9ahR/T2GcbUt5/f8NBtIQZ/mlY7JPwsb1HBaR+rrdtyNynV6Wfr3IUVZjF/bdmnhMLMKyeQgO75nUpQBBTyybCIi+gwIcKVQyUIP1aXMX6Q5qEtwS5YilpQ/dqQLF1KlKh3Xp4mHkTHJtHpO5FpZLrdXPVJyf0e9oXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876677; c=relaxed/simple;
	bh=yfM3h0JYdLVpgPtY6DotCckQ5QpGZWGKAKvtDbLIGdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VM3oOMn68roQyIsUnS+pJd32Thb19SXITcV2XpQgYNOMPoGuwChEpmx9QKA83kVAQoL55IkiKhZIYja0MgXm85+758NJsiYb8vNoJzZgKuJvlEKXq0IZXQ83O9Aq3Mizf7oOUjSLUe8TJxHGxS09Tzsjbqmt23L+QPzr6NM+UDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0TcdvX8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0TcdvX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96964C2BCB1;
	Mon, 30 Mar 2026 13:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774876676;
	bh=yfM3h0JYdLVpgPtY6DotCckQ5QpGZWGKAKvtDbLIGdo=;
	h=Date:From:To:Cc:Subject:From;
	b=T0TcdvX8tmjCo2axCA9jH2mfV50aAfDiZGTzamctdgF8RB1DpEau2PHY9fFI5KX+Y
	 IHAvw6y/A0XhsNbcTmeXOUyQ+aR1Gsba8H14HpxDD9Z9ISF4fXbhrriYSsTrSi4y5B
	 056jzS3KE65UBiEStne547l74ZSku5eE42220/baTtCMOhpKqXtJqj0J7NL55Eb7Wp
	 zeW+HAqatTgm1uFR1m2iNNfuL325vC23ndYPVQo/OieJGt8e4YofHOcltj/9Utkn5B
	 1e1NaaDQsS8KRcG5anehVK9tmEQXuPxJkGhNtEIfG+bQWcawiJGHXC/NWNuo8/Xoaf
	 pdAAzXaNMq9Bw==
Date: Mon, 30 Mar 2026 14:17:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the origin tree
Message-ID: <acp4AY8W5_jOo56Z@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L6aatmk7CatRGyWR"
Content-Disposition: inline


--L6aatmk7CatRGyWR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  scripts/Makefile.build

between commit:

  f41941aab3acd ("rust: ptr: add projection infrastructure")

=66rom the origin tree and commit:

  560a7a9b9267f ("rust: add `const_assert!` macro")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc scripts/Makefile.build
index 3652b85be5459,a6d1a2b210aaa..0000000000000
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@@ -310,7 -310,7 +310,8 @@@ $(obj)/%.lst: $(obj)/%.c FORC
 =20
  # The features in this list are the ones allowed for non-`rust/` code.
  #
 +#   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`.
+ #   - Stable since Rust 1.79.0: `feature(inline_const)`.
  #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
  #   - Stable since Rust 1.82.0: `feature(asm_const)`,
  #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
@@@ -321,7 -320,7 +322,7 @@@
  #
  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details=
 on
  # the unstable features in use.
- rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_r=
easons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_wit=
h_arg
 -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,inline=
_const,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
++rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,inline=
_const,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_lenstrict_provena=
nce,used_with_arg
 =20
  # `--out-dir` is required to avoid temporaries being created by `rustc` i=
n the
  # current working directory, which may be not accessible in the out-of-tr=
ee

--L6aatmk7CatRGyWR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKeAAACgkQJNaLcl1U
h9CuDwf+OpRzCjM4ZBAMtYOmtvQEa9by82CO5VpZuNe19GTDCu3hIUfqJwlqwLwp
x+zOWTUE3Ef//b/Ta/6Lm/3xaJiYcz6gsZlkzNd04uuvzhig9lJiQYsSlHYxGwuB
lm6AquFcJbYUa9c6mas1EmrKgIwPxM54cP033iugx1sU/GQ0ucGFLHhtQxzvgMxl
8C9RQowpiWjqviZSsOWJLdUG+yL0Ujk7lT6xs2bfabtfV56NTUO7rdJVImWGZHvu
S5YBtBA5m6EeSJkDtakDcIFazQcmHS5uw0EuQSQO6h3UFxAV3QLc8vXu2auZGlaQ
Ol8FXITJM/KfrRg7qxA+EsV5TeQ5eA==
=/Voi
-----END PGP SIGNATURE-----

--L6aatmk7CatRGyWR--
