Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6313EFD31;
	Thu, 28 May 2026 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972193; cv=none; b=MNpEszdANpTRtCN8TnLXJT2iwn81d2hyNUMp/nZbike5deZPoLt4p32ngh6GpnLZ944HwcDnX8EkmZGa6a1k1Lq/JMVvG4g//M6t83e3nI8h0KqMiChLn/IqSBJ7pCkn5yM9VDRZ6yzzWa7bFDQ8M0CcFMzMulILKwD8J1clxAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972193; c=relaxed/simple;
	bh=chrA3v/82e2i7BfwElV1n0hz5k1nsISPx2rSyhFWkZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EaQiBNx2ZtTcap88Kfh3he0t6pCcZ4bGehkqNoB943lDq4K8AJ+xDpQTwPSVxgkH6UzgcrirpCsup+MkmEHdqGHLiRdESFZ/NyKVDYmAb20XDkQsh2YoxzUoOElcyZTJK3w/vxh1yFuX4U96bItDyydJVOLpJx759wfbqy3SGnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNzKNuEM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNzKNuEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA031F00A3D;
	Thu, 28 May 2026 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779972192;
	bh=sUEHSHU6GNcjur5oL6xkKo3jQy0XAgXzKrk2zyFjYoQ=;
	h=Date:From:To:Cc:Subject;
	b=UNzKNuEMMyHDUpYZSWrqs7ysSmItBbk3oMOjbJl2TIGFW2mWnMfDebwrSKBZB4wmI
	 WPSeqogh6fIQwZEl+sNPTzy9cT1oRUEwkMNZpKlaIb3z/VqGuHFWaWQ0ToSjUUgjwQ
	 nNX3MuVZ9m0fZbiE1wV+Clxcq4dT0wqTorsb4+xpqtgCtnXofsGr+Br5QCeMSxWbT8
	 Cd8DTYTDWw2RzDCGbeDyFg34Lt42GhryDsXBO80FCnCu0pyoDMlqmZ8t58zSD3ae2C
	 H5pxZlDCO8/7zgy1LSJQPQsgUVzQJWx4H4QzB+HC4NHdizgkl/fmOwIIwZ1GcmoNXq
	 IKjnUCsKoM9bA==
Date: Thu, 28 May 2026 13:43:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <ahg4XDoVOR7LD63p@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0x5QxqZJ/p7mLIIo"
Content-Disposition: inline


--0x5QxqZJ/p7mLIIo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Trying to build Linus' tree, today's linux-next build (arm64 kunit)
failed like this:

ERROR:root:Inconsistent kallsyms data=20
Try "make KALLSYMS_EXTRA_PASS=3D1" as a workaround

I didn't diagnose which commit started triggering this, it's a known
kallsyms random error AIUI.  I'm running the build with:

=2E/tools/testing/kunit/kunit.py run --make_options LLVM=3D1 --failed --all=
tests --kconfig_add CONFIG_KASAN=3Dy --kconfig_add CONFIG_RUST=3Dy --build_=
dir ../arm64_kunit --arch arm64

Dropping Rust and LLVM (LLVM is needed for rust+KASAN) avoids the issue
so I'm doing that.

--0x5QxqZJ/p7mLIIo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYOFsACgkQJNaLcl1U
h9DO0Qf+P+mHE7ZsR7N4KudhO3aUZ1E0msXH0cfAkjLDleI1CcPUkEi+f8f0ze0O
CjL/TTki3IvVBfLSP1cxLPxoeecOS7JAWUcEkaR9RbpsxRhjMUas+tW8xRmlt1Pz
RfbvWl/JSO04JkQfJTsmWK9O2y6lzqTPen3f91LqweROmTxFsrny9V6ziGvnH6bz
izm/oKiCv4TeHFJXAotXqRTQ983kcecim5/rgPkPwN0DpF/miScD1GB3Y7bJ/Sw3
G6owigh7bX0IUodL4O+jboXPJP1LpYEpul0M7+kVUZw6egWVZ+xK1Iq9V5WGze6p
MBSXYs9T6zbbNlZ3/gSOROGj4a375w==
=BuYX
-----END PGP SIGNATURE-----

--0x5QxqZJ/p7mLIIo--
