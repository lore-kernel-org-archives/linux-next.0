Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615C03FBB72;
	Thu, 28 May 2026 17:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989424; cv=none; b=sr+VX1PuYVut6wdRBBMqFsHT3WmtzB7GJ2vEitQeGP6OB8TdRFhYwyepEJvNF7bbit1lHj5vV8MihwYMWVWRZn4/HvU2SrKKJiYlFVWwc2jj3bZwN5Tu69Xn9pIDmgtZfHdO/AHLxjSw2osjhnBFTyi36OQquy2PaKVBc9ATKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989424; c=relaxed/simple;
	bh=ZPEwXmTtE6wpQt3Vmr1WWkkCT+Gsia3MDSm2r/GRAmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ul3cNyH86v+cVQwSiMFoSwFpszxFJhalTJnkw4ALtYGV0ijBkEfCPEiakWBKSydVKIAJBcY0SbUd6xE1YpgbSLWks5IXblegkg9jCBNYZ7vYhR7BN12CnD/Pv6WEvVBLCGZN2S4DYZzNb5ip8OY8FVe/EhelvvDZNoHh9ddpu2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwbmgxyU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwbmgxyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C551F000E9;
	Thu, 28 May 2026 17:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779989423;
	bh=IOAVFiT+K7350kRO9YlSwHa8c2W1hDoTREMl53ld5AE=;
	h=Date:From:To:Cc:Subject;
	b=jwbmgxyUfg+6T8OkVwJ9cMD7psQkqD0mj04AJQ5QZQ7/1e/pw6qJmmmR5vdnaN61Q
	 hhDohA2xEVLuReDGFUSRj8V64pR86E7nTVK1t3RHQVra41LF+ye5UfdXOtg4QOwftw
	 SPuYPpoXfhCTBMNYC4p7UBBPnI/0DC5sp8AfhqpnDP/prbOIY+3lFPewEc6gHJjOKz
	 9i71wobPPIEPvmF+ZrrZ+Bb8n+a31sO2arZSbqsYWScnEmAawmiMTLL24pn7WL2L7+
	 MQ7LfR2cD16JhgTfJaC7YtHFH++BooRQe44msZPg0FlWzNerE4+9OfdtuSOyX33xNK
	 YGsJXN/aQS5YQ==
Date: Thu, 28 May 2026 18:30:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 28
Message-ID: <ahh7q_wJ8Ukctoja@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hE69Ikz23E4mpUhG"
Content-Disposition: inline


--hE69Ikz23E4mpUhG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260527:

The origin tree developed a kallsyms problem running KUnit, I dropped
the Rust and LLVM usage there.

The vfs-brauner tree acquired a conflict with the nfsd tree.

The net-next tree acquired a conflict with the net tree.

The block tree lost it's build failure.

The sched-ext tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 8270
 9230 files changed, 483061 insertions(+), 182474 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
https:://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--hE69Ikz23E4mpUhG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYe6sACgkQJNaLcl1U
h9CSwAf/YPOz6k/N5tiCIPrkmDk8BPAU2al0xAzv5J+pXrwKDOoDcOnxNekap0Vt
UJyzGggjRT0QoP9inn/htUeI6IhMU5RdmRgJC0b9qrDXiaJjkD8lBEeMYxQOxf7b
oapbpei8ZUrfpicEuuJhav9VBp9tVEYdY8W3Yl2RIGK12AeT7UDsEJMRFSRmdK/f
YhbwUbOLqh0FZaV1EBM1Zyzw1CdHkv3pU4/syZR1h6w+lB/u9zXGbOnocbL9pJm2
cEUpEj3SKFXR1NrCBnXz2u943yTNWO6n1t3AogqaZn/2Fm06cLuAXuGC4z5ypX4E
p8qs6dYbzKPiiY+QfRdYpwgpl708gg==
=AC0b
-----END PGP SIGNATURE-----

--hE69Ikz23E4mpUhG--
