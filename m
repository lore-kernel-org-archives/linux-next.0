Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B045423B62B;
	Mon, 20 Jul 2026 23:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784591744; cv=none; b=XHH7eYKjGIeFPUxQJh++3qgXxOLlWtL86TX7qoCx/9ubdBX3gknzfiYiTNelb23TzlPZryN+YBKiwju8nSHlA65NL89goZx1dcKR4drn1F+dKVTFh+1QaTf8LqZ+BhrCQ+xPuBNW5Wxmn3feyJIMOYYbsegICGrHqC/TBEsdIZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784591744; c=relaxed/simple;
	bh=kU39otQbs6m2SQJ6AN3g6sCTs8b/07ZC1PlBvSzNkJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNej0ZHGgVoaBzUG1RGfDDWph2iMuCbG+psl+Ey0xDhKpEOrNlrBJu1UegNyj+PqvKu0zXugOCjmAhLGbIwHbc4Xt/NArUpKLey3xttX9BPwrPviEm2sP/Uj45ufdQaR+MAZN4RVPT5nPy6h0FZhtalmiLv/sOR+P56X5xagEn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMFpX+VX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMFpX+VX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C741F000E9;
	Mon, 20 Jul 2026 23:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784591743;
	bh=IdyX2jkscW9GQgzeUxmzbl/wo9IV493YfeJcVRDzQts=;
	h=Date:From:To:Cc:Subject;
	b=nMFpX+VXD9juADKO3U3fWy2/KkLUPfzM/w6+ocyDRNt8r8GkKBVkksL0SQ8e5o/bJ
	 GS4gwiEBb0m2g99mqQREWaNzI3jSNazVxkRo1NuP+dvMHC7qBbLCC49OxKpsQApR1t
	 6a1Ihm55I1+Q0tpb+Xm1dW9nOh9mBqI/LrNc2S3mCzf+80WO3r8WezuTNiZsZRnw8Z
	 zuwADkoh0BRa7qFjOV3keXIeJ4TVRn9ACvnzKkj2aWXyjx1JuulD12ENPHn3HAMS1m
	 kleDV7w72OXGMg1DsczqTqKwmd2QnR0QJTn43Xum9sPSFh/WQHEnpPsWaGzS2m2IQK
	 6usxAsxVmBmJg==
Date: Tue, 21 Jul 2026 00:55:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 20
Message-ID: <al61e_I2kCF7cYdj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6FQToafTZXJhv3E"
Content-Disposition: inline


--p6FQToafTZXJhv3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260717:

The mm-unstable tree acquired a conflict with the drm-misc-fixes tree.

The qcom tree lost it's build failure.

The rdma tree acquired a conflict with the origin tree.

The drm tree acquired multiple conflicts with the origin tree.

The drm-xe tree acquired a conflict with the origin tree.

The char-misc tree acquired multiple conflicts with the char-misc.current tree.

The char-misc tree acquired a conflict with the security tree.

The nvmem tree acquired a conflict with the char-misc tree.

Non-merge commits (relative to Linus' tree): 7105
 6767 files changed, 287833 insertions(+), 107538 deletions(-)

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

I am currently merging 429 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--p6FQToafTZXJhv3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpetXoACgkQJNaLcl1U
h9DH/wf/Y6OBZlUpqsshCz4jroZLvTqMfLwIXFkPPgF5syS9ZQNtVAvdOotrtrSK
NN8hYPl391q8ELd0F4kIRrwsHM4PzYKV/EaWrETOHDbgmIBwQzGQml3EA6YmxUk0
ZxZVAQ9zctx691vvV12ufxEb4vzMCmC/rBDSD826zjP7oaTZVMssi7mJPv4Uv6ig
FlrXnPktmrbipdUx1SkSHrRUEwKKuuDjGFrLg501KT3pco7Oj1DlKmezU4FZHvFB
Ea049vYfbSTRd1KG69GLHmIHCZT7KemQ/rEogMxu9Gf3H6Z7vXVr6cRqoO6RSso0
Cb/CMftYR2KX93wBNB7IHwM8woLHHg==
=a0RD
-----END PGP SIGNATURE-----

--p6FQToafTZXJhv3E--
