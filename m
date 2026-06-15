Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066F3F1AD3;
	Mon, 15 Jun 2026 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528405; cv=none; b=MMaFQRuGs7yixxhPMugs9+wxkCsxPp6PQ2z3A/ldaU98xGmfdNpBEHUxLuNao6DECRb4y4x+5x29NALeLOZuu/myuw3I8MSJQUjE7XMS/TCRLlBPO1WhCnp69t4OCt6xh01SDPPVhBP1h+JXWqUVXJNuOO05ds1NG8ILnmWuXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528405; c=relaxed/simple;
	bh=7znUddP/raoyhald5lpbAam4OksvkZIO41kxHM8QMtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sMGHJtkB5XpRKg3Z6AxqOi/zO8cNkzyOYvJ+TVlnpzEILzREAgqno/Ioxd1qzDrY+1RjO/jyI51Pw8wqS0qN6Gpv+0bUUIeQNdpHePFRMUEwX/49hEYHrgDjZZd/ZGprhsMQQgmMkCZyaQOsDZgLcZMel26fYNX5NXfRzFPv3CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGTmf7+v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGTmf7+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5751E1F000E9;
	Mon, 15 Jun 2026 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781528404;
	bh=vPaxvR5J7A5GaBjCu0/NpgUO+xiUoX4Lj8xll6AFIMw=;
	h=Date:From:To:Cc:Subject;
	b=HGTmf7+vaVtyKSM5a3BVKS7hX+ZzK+tqpmJE8eY7Z84pk1W1ijs/GALgMEa/aU770
	 DEPIb/MHi18pobHQCU2pkIszRgr9LtkwyqlWSMTVL0EKDmYvQbDIxTNB4hS7doDwDU
	 Ls/nmmOr5QLkAYwmJ0RjHVD6YK7KsPmlnzcO9x57moE3+hvOO2nk8U3KusGvmQNkHD
	 E0EhXDjpW2m+qfkcn8gySs7G52R2TVZCMwmtJmGzZ+UaDMXXg+t2XUQy5QonLU8gec
	 xQel2NnMZMHW5LCGNmxja2MGAROHAXrvyNHTRm+t7s/n0J2CVDr5A4gDFJyzqO/9pL
	 5dm9/Yb/+oAQA==
Date: Mon, 15 Jun 2026 14:00:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the sparc tree
Message-ID: <ai_3UFF9HfEyRW0C@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rDseeG23+mjne6ka"
Content-Disposition: inline


--rDseeG23+mjne6ka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Andrew Mortons' tree as a different commit
(but the same patch):

   1919c0e50000e (sparc: add _mcount() prototype)

--rDseeG23+mjne6ka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmov908ACgkQJNaLcl1U
h9Ah+ggAgCklPzoDmAxtnLc09NMXlOKW8j8QPcGbhVfzrWXFhTNK999SSouv/q4o
zPpyNLmNI1+r2Xpgd9kd3r3qMTnb2sS/nyZUMdIlTL57pZQB0578cpzwy5e2omlV
jAOZ/d0p+BxXXn0ZVD06/3Vrat6H7JfUzrKgqRzmAVyFB5GB/zk+FgMX0tNpZ188
zihzPB77zaSbYIC5Cltna7/5G4fSnNtyRiwA6PSQ74HMXN/8iXWXhdxnEsI5J2Sw
jblwWsG+iakxOTvMkvgvV2T+ExPLR+jCGPrsA8gTGG8qMIMOPfi+ijjqPKOvjfGA
+z2yrze3VZXelpGGcxu6o0C74y/JsA==
=S4T6
-----END PGP SIGNATURE-----

--rDseeG23+mjne6ka--
