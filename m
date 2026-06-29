Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1E13C81B6;
	Mon, 29 Jun 2026 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752986; cv=none; b=Ln+3APuLKKXWosejNzF5UKXN182iN5/crFUhuxtq5H8G1RfX7rgkFYfGI+ft2PPztsD2ZAf+fcM0CAPzBaayhKiLamQ6WtNhXHm027Lv9gHnNI+ca7BetjFvbhEhoYQmzFwuXDMDRzqzc2famJdg7h4q3bTFoD5vhV248pc8P74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752986; c=relaxed/simple;
	bh=wc1zXM59Y34oKcQ6q2PMIHkepNZUOoTC+QVuXCiSoa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQf2OdSXYsRcXjmYZJOivUv9jmb24nTpy7Br+bKzkoidrJT7wSXNWF590OgywKRmsEr71QvzeoC1sT7BJCJBmM0CUePHzrdOTRDpELL/Xtw8PDZzKrpo1cFFugvX8z6azmNFp8MQ68ERraQt5BYaOFyaPmqZOJbX8Ae2E/9ar0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTnrYdJK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTnrYdJK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCDF1F000E9;
	Mon, 29 Jun 2026 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782752985;
	bh=0ZP6g7sETDZJvdZ/RjN9kjP4duFMFDM1s6/oS3G5Kxg=;
	h=Date:From:To:Cc:Subject;
	b=hTnrYdJKAeeisUzQjBDxhFJ4p0Tq4LsqWE7LO3HMpJUjfOpB7okLb0y149c6DIGLc
	 ky9JTEsmre8FP5bkINafQxGMifKDNLl9Bgf16jVHkKtQ/obU1qsGkBpPmm4GwygSub
	 hS5ZSpa5jWDCJFZmexsELzfANzEEj14pn0LK0t82oBBEs7RlGtBQX3PzYmv/YOwad5
	 0NsckGWPLHa/4BA5sYCt/1bIRKTO0h/yjAUYxitl7uYj87MVPCM0MMJttCDyKsLXMk
	 AexHhXs3AQg8tueJkLXkKZBKlnIKwjjGC+VeB+UCdGJOE+SZ0KT/3/4RjiahJeBw/P
	 u3taw0q4aX7Wg==
Date: Mon, 29 Jun 2026 18:09:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: -next status as at v7.2-rc1
Message-ID: <6c17d343-8313-4823-b2d2-44a14f95cc84@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ECoNK2iLZpIOzG4"
Content-Disposition: inline


--1ECoNK2iLZpIOzG4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The end of the merge window was quite quiet, and with -rc1 there's very
little else going on immediately.  Looking at the trees with commits
that didn't get merged some of them do look to have bugfixes that are
just waiting for whatever reason, I've gone through and annotated the
list a bit.

No trees are held at old versions

No trees have signoff problems

Non-merge commits relative to Linus' tree: 1007
 2678 files changed, 51769 insertions(+), 22781 deletions(-)

Top trees adding commits to -next:

  193	amdgpu
  67	drm-xe
  58	btrfs
  55	kvm
  51	mm-unstable
  32	drm-rust
  27	arm-soc
  25	usb.current
  22	mm-hotfixes
  21	perf

Top trees with commits in next-20260626 that didn't get merged:

  193	amdgpu
  66	drm-xe			(a lot but not all looks like fixes)
  58	btrfs
  55	kvm
  27	arm-soc			(almost all internal stuff not for their split PRs)
  24	usb.current		(fixes)
  21	perf
  21	kvm-arm-fixes		(fixes)
  21	bluetooth		(fixes and device IDs)

There's fixes in some of the other trees but mixed in with other stuff.

Thanks,
Mark

--1ECoNK2iLZpIOzG4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCptQACgkQJNaLcl1U
h9D+oAf/cmKs5g/ISLzzgCY1DosVWs0rbs6ZkVyNY0xmFPe63RSjMcuNl/6UDeGq
Yv3jt+A5lLTv62baowD0+G4oPD5szXtPOpoqpqlxyUtslaJJ5YvJA/+KxRlQytKS
Y12HliURBYQJQjExfDpkPhILzdUkar/G7que123kkCBeoQ0dvhPjf17f8HvT2Nl4
Fah5LYC4YpqyiWLILJzSTi77Z7p5gp9mN+jppYW2VsmwS7/Tv1GXNR0Bfk/oCZ43
h9sICnLB1XuSmyPJoT2RZgBDArASRd944I1rVgiNhU17Wv9BNNT3OsMfIRt482YC
uo2xzB7fNZfaI7HEVCbjiNfWdufmpg==
=kY/k
-----END PGP SIGNATURE-----

--1ECoNK2iLZpIOzG4--
