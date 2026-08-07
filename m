Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBB1306B3D;
	Fri,  7 Aug 2026 14:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113765; cv=none; b=T8zUrmI/jlX7GbB8bzPLnhdSiEngOs1eSF6xG03swyXCzHYTjRe+AB2Bje2AIFYVgCVCoIMpM22Z3u4pl1fl7eHMd4aJ2Q7Fx6YElzsJJ3HM5N51xxeoB+jGV3xS9Z0h1szrGXS85swPOpFkNIyMDXkj2wyiBQivX0GlKpVPOFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113765; c=relaxed/simple;
	bh=R1AgV9my29YUCB4SCAatvG/i5CV7xobF7ZIsIkWZ9LI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cdr/tHZ/QBw7/gNg4wCacb2yGH9Y7RpoCcByBG33Z3zRqdH9S5chVBFPfOSVLELS0Kkld897PMDF1cpQoLtaBv6J4Lmwj3JMjCARPc4dYxFLGCsd85MWjaLyd1CdbgbM3EQzPX2+nPDk6ljagb/5QVQWeII5hKbw6cqaARKl4vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qv4xBqrV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qv4xBqrV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9721F00ADE;
	Fri,  7 Aug 2026 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786113753;
	bh=rB4q/78dFKqcvJJUoBC0pj2Qd5uo6Y6M2f24vIDPlWs=;
	h=Date:From:To:Cc:Subject;
	b=Qv4xBqrVOhMyuIKrYLAQbCCThmIsrpAuLwUcYC5vizaJMMEby84DOo68tFkfNQcpA
	 NmTYH+A0W2CBDJlnrDLQMDB68w3cvOaWI6QXVsgaDPyQnpKo3W9TJpaHfKiI0EMO7q
	 eV7ZXsM08tqjB4F+d5xSsTMpjrLg1kDOG/6ZMEpfugzB6/QBhaaJ/SDJj9WV5kHCEN
	 tmIkS7uLEyhRU5peL4aIF8pLj1UHJh4KiGLEXjUNKA+jqHLy74Nam8zf/gXiW/J50X
	 61dKssfOOx8yAiTIVE/nLrfuF7+utrVlebJTdTSDf55SJHhQwwDucjuV+y/b/Qli63
	 WngvDQBmdtpAQ==
Date: Fri, 7 Aug 2026 15:42:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Linu Cherian <linu.cherian@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Will Deacon <will@kernel.org>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <anXu1CnuHQo-fKId@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B073ScwDdTjtsKjI"
Content-Disposition: inline


--B073ScwDdTjtsKjI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/tools/cpucaps

between commits:

  94104e3cfa803 ("arm64: cpufeature: Rename BBML2_NOABORT as BBML3")
  12aab25ca56ee ("arm64: errata: work around NVIDIA Olympus device store/lo=
ad ordering")

=66rom the arm64 tree and commits:

  27a263e1a0fa2 ("KVM: arm64: Move GICv3 broken SEIS implementation detecti=
on to a CPU errrata")
  0dbb49dcdbbe9 ("arm64: Add ARM64_HAS_NV2P1 capability")
  5be1b8de27dce ("arm64: Add ARM64_HAS_NV3 capability")

=66rom the kvm-arm tree.  (Only the arm64 tree touches this file one of
the other commits says!)

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/tools/cpucaps
index 0ee42b0cc8d34,f88d7898489f9..0000000000000
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@@ -52,6 -51,9 +52,8 @@@ HAS_LS64_
  HAS_LSUI
  HAS_MOPS
  HAS_NESTED_VIRT
+ HAS_NV2P1
+ HAS_NV3
 -HAS_BBML2_NOABORT
  HAS_PAN
  HAS_PMUV3
  HAS_S1PIE
@@@ -121,7 -123,7 +123,8 @@@ WORKAROUND_CAVIUM_TX2_219_TV
  WORKAROUND_CLEAN_CACHE
  WORKAROUND_DEVICE_LOAD_ACQUIRE
  WORKAROUND_DISABLE_CNP
+ WORKAROUND_GICv3_BROKEN_SEIS
 +WORKAROUND_NVIDIA_OLYMPUS_1027
  WORKAROUND_PMUV3_IMPDEF_TRAPS
  WORKAROUND_QCOM_FALKOR_E1003
  WORKAROUND_QCOM_ORYON_CNTVOFF

--B073ScwDdTjtsKjI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp17tQACgkQJNaLcl1U
h9DrTgf+Mq369FXAPL2yITFnZSj+zYCGy93i7syHULj8iwgghEOVcipYTcvhxqjd
M3OSsPMqU7cc7psPpuqQaRGh94D4GIMquh29DQ5gHmSDcltn8lFQLqWB/Uhg3ZEP
ySiZBhDQJ5oUkTcMNSSPp1FOTA6VFuZPrehYMuXgelJhVaNXboPIBCiepBk588yT
LLye1CrYYQYzeHcKzJWcBrRklgYLnOi9p1Bm6w5J5w2rJOM5gve6zd7EEVchkeI5
JP4zLOGxBpsoThL5KJaSIOgidokEhT9RevEW41qw4YH3Urn+Ig+B4KRQ8odfbGNS
ae2O8H+g7ksHA9zUYw7l8LxSsQuo4Q==
=2p0D
-----END PGP SIGNATURE-----

--B073ScwDdTjtsKjI--
