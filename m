Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7A64279FC;
	Wed, 10 Jun 2026 15:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106806; cv=none; b=pw+Q34CVgFmZOcHXaz373vXpzPnaT+raN0j97mXDcIfGQ1NO/oiaQ07Y1BsODfTKR8LwJK235yjpELeiyyzrvxLD5CMjadFr6VQF3E2G7WiPcr6wpngkoixstXykxgmN/S0WRFOVlm+v/a2lcJvkQut6bYAR8Uk07x5kGrvdmSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106806; c=relaxed/simple;
	bh=1JiDX6OyRajony2IoH/g7dSb3Z6RCFNx6Aj5tUu07yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbySAJBTdWptqAOWb9TqgGlgGJ5rmkwtwgd/VZne3IOENxSoJnUTpi2ItyYGEwG38YacqYIV/4dca07mqSH+fdxNQQer5GawJDlaiM676U9gWjeNYXmpZU3aXSoRn35bifpfJHgEdPzQIvEQqByokJYSbR607BhSbZW9yDfZSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXcSeFyl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXcSeFyl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C391F00893;
	Wed, 10 Jun 2026 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781106805;
	bh=3CN1W+tnzBTN4tzJUh0Ini5TRVkKO5PeQ/av3hBQO/I=;
	h=Date:From:To:Cc:Subject;
	b=SXcSeFylRIFSyUgXnuxSZ/O1cgGmGysxpqW0GdUINBuVUqeZu6etVppyzlQf12DaU
	 SGV9nK/Kylkql6+31VQ0tXydRChi+XcDSBMC9reG7Gp9hSMmJxpGRqQ/ObPoEmN5gU
	 cRjPS0TzDv35G+7JZ2LBxVmk2JI6zRHm/gMVGfEbpTV61ebpURUa1Js1BNJopgg5U0
	 y5XxSdfctvbLLt8HjF9AfVDLbfKPBY8yNuQyKkiFbk/Hpu1ctnOevzeVlPj78Z/cYa
	 pK1/xVyzRQKQI6n6V4W2RPkaRmKwdveHy6CWQqYxaaNABG9ijGAFQO42akiizz62ph
	 WJDMutMhs25wQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 60F221AC56C5; Wed, 10 Jun 2026 16:53:23 +0100 (BST)
Date: Wed, 10 Jun 2026 16:53:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 10
Message-ID: <aimIc7ciEUrhXV23@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ZlU+9cQBd+cqGiz"
Content-Disposition: inline


--2ZlU+9cQBd+cqGiz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260609:

The hwmon-staging tree gained a build failure, I used the version from
next-20260609 instead.

The ftrace tree acquired a conflict with the tip-fixes tree.

The pinctrl tree introduced a failure in the final build.

Non-merge commits (relative to Linus' tree): 11798
 12748 files changed, 785763 insertions(+), 238876 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
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

I am currently merging 425 trees (counting Linus' and 131 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--2ZlU+9cQBd+cqGiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopiHIACgkQJNaLcl1U
h9BaOAgAhGmD41R0BT8YcsjGdNASTzlTbxmXCEhW0VzXVJK1v2jq4y8AnT/Mwlrc
hA4YpNSXDSxVW/dCnhNzLS5U4culNVCrwkn8SgQFnjPaulBCVFitU8r/6sqCTySg
SS3ymXpMXr6HXvcLXh5F0/51/B1ZZ+EkUMJMJb96q6bpZNK+DCiV3jVPee+grbUk
TdQLmqaH9tkmK+4SjIg2NkWZiBHK9WaVOLKDfdATDGFy3ukC3loVZ5Co4iUPu14F
/DUJk+qwEn0umDk1rbMzBtseq8i/0fJCEdepzGGRI93WRE30EIfcihwb2gL1BKa3
oUABy9Ux0+2oTJdNLzYlbGCqLcD1ug==
=R2Iu
-----END PGP SIGNATURE-----

--2ZlU+9cQBd+cqGiz--
