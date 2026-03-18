Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3411233121E;
	Wed, 18 Mar 2026 16:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773852752; cv=none; b=he+KVjxez30QX6KnbJJcMNxMDMgr4Xb7wNM2VQb1AYxtS8tZf1JbAknwNUQeyd5uV1BhMam3qN/tQF0VGAILy0hD+gjLX0u68XgjN0OpJsQq4SQA0ylsNSuMeOFfViNJQHR1ymftNSvavmZFQdTctiBNIkmL9Jaokuybv3aFDws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773852752; c=relaxed/simple;
	bh=S4v5CoD5UGRpmsPi1+3MmGk+jI5EHbzuGSDsYkwS05I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=am0l9HweW+TjPOOaMxJR+sEe/Ew8HcbQldp+GkpTG9NDsc8NiuBokQb3lKBWGzyQ9E7Bwht8lij0aub56bhIbf7h6RGq8RXLowY2OMCq5AyDygcn9w574HIGfNg/CpMeGWPKPmbxmN2Qh5KSmEjrpYC1FASDyeS7/Lw7XVknwn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+4yXeD6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+4yXeD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3813FC19421;
	Wed, 18 Mar 2026 16:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773852751;
	bh=S4v5CoD5UGRpmsPi1+3MmGk+jI5EHbzuGSDsYkwS05I=;
	h=Date:From:To:Cc:Subject:From;
	b=Y+4yXeD6BXsEBaPQoUl7fMc5XaDe4VPBLmIu1Snp6pYJwTlnyZHatdhBJeM8nWDIY
	 i4s2aEwIsvmGN8h8wihoUpW9XR94uv18+r8JkKRtfJ7zY1cnsrcN5eSSo973uEvCRK
	 I/2FBaHHNODNrJLXGjJq8Y6YeoBTuJsZUlbTUri6mb/QCE8i5qCxl/6P+T2dWCcsWK
	 oAz5NNolyKyiYgBWt4V97kFMZNs3KxzXFz5AQmbVX17IZt7q1nqFNxJU3CJty1G5aH
	 kTPOzPWmzAZ0UA0pMjdLQWdzhYHrHDR4JCYAdIhnwc98m5bl3i1Iiju0R5kwSlhgQ/
	 hNrV6W4jy7IfA==
Date: Wed, 18 Mar 2026 16:52:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 18
Message-ID: <abrYTGOZRH9oP2GQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kkUcvvRUADQSaTtT"
Content-Disposition: inline


--kkUcvvRUADQSaTtT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260317:

The mm-unstable tree gained a build failure, I used the version from
next-20260318 instead.

The bluetooth tree acquired a conflict with the net tree.

The drm tree acquired a conflict with the drm-misc-fixes tree.

The sound-asoc lost it's build failure.

Non-merge commits (relative to Linus' tree): 6514
 6652 files changed, 440309 insertions(+), 133980 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
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

I am currently merging 412 trees (counting Linus' and 123 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--kkUcvvRUADQSaTtT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm62EsACgkQJNaLcl1U
h9C0aQf+MD1s4rQz20JW3BivINLc8LrPcBCknKeEQ2cdh9kJyvQTZGXiSgYfoNkI
IuqVUhZ5nGIMmy+brCB4n96qDUjAkMCLyMQI6BPZayDfU2CHjEcyDTlqSQswb9xz
5432+8Epaspwqr5R072APCCHyXr0PcvJVogrAWZBw4DmwNCk2fOsak/6TPqYWFPB
0xsee6gQ98gzcpq+y669Wk9RywLzYJlfzN9zN13d0JxI0m/9iKNwei3t9ieaxbOJ
P34f1gnmim0dOS1JI2qH+moNlPZstIGdCZl62JdpWdOWlFkJM3evi/QhoibwYn8z
Vx9ncW4ziIO5cUCYdHnwPak77pxjuw==
=AFWN
-----END PGP SIGNATURE-----

--kkUcvvRUADQSaTtT--
