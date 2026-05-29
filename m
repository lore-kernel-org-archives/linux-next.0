Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCD63403E4;
	Fri, 29 May 2026 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780098153; cv=none; b=DMQI4r8sWhbn195CuFjWb8k55mazzhGvALeOPWaC7YDKWdzRXJamICo3+peebf03hoNxt7o11zKDZMH7H6GbhfJgk+7Yf/Hg5uxICdlOkZ2EwWMrMTfo1bde0S0kICT0y0Fv+k1aOH6xggvk+dBCvblvdxdOitZ7mahQSH/Q3nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780098153; c=relaxed/simple;
	bh=ZlYd++42RxNYQBFfAKXqIM/60lPbWIWJzx2rGxstTVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kHJbAk4SHcrkPHj8aVpzoEGwH3VixE5pLKbkFw2A5la+vuwcsxsS8yvL44z1dBNqQ+RfexhbxgdOoWClUpoq5ODBt9D7VgK/qLunhQdqEGFhuq1O5B3px4XkUOobULWz9hAvUf8C3mq3IZ3DR0cOyhJPmji5899C17DG6k3TOFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhCWl1v1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhCWl1v1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C04A1F00893;
	Fri, 29 May 2026 23:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780098151;
	bh=gpnFR09LpNXUmdPm920HvlKMuc59zmHN1ANepVfJvVA=;
	h=Date:From:To:Cc:Subject;
	b=YhCWl1v1tMbacm4NXAlnzxysD+Ew1wQSiqggHBfkvfoAR+wSFH4xSO7dKTi9ya4Xi
	 146iImEkhEkWCHLA3Fmcb8GzCl/69WUg02H3WJ2g9K3sXkh+At9aGpLBkvKuBMRIF/
	 MZZpKx08Z9uM3uYcapJCuWf+/hQ9UIQXb5g/Mpf33jxNQGkzDrKFJkdLdthdefSH62
	 KXLtLG4E3LxffyN5nqPlTVornDJFsU/Z6Fqae0zwiCEdO66sAlbKHRIKutzUMPX86+
	 UemKRr+re+ucksMD1zPkuBtQi6Mv78rHf8ubrN+enGuqrSWOjPTPYhcMKC+kZPKp3c
	 NJr/fQRnQ6IrA==
Date: Sat, 30 May 2026 00:42:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 29
Message-ID: <ahokZCYcsMTSzvLG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j0K8j/3cT5NQucVM"
Content-Disposition: inline


--j0K8j/3cT5NQucVM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260528:

The ext4 tree acquired a build failure, I used the version from
next-20260528 instead.

The nfsd tree lost it's build failure.

The ntfs3 tree acquired a conflict with the nfsd and vfs-brauner trees.

The net-next tree acquired a conflict with the net tree.

The bpf-next tree lost it's build failure.

The amdgpu tree acquired a conflict with the drm-fixes tree.

The spi tree acquired a conflict with the i2c-host tree.

The slab tree acquired a conflict with the drm-misc tree.

Non-merge commits (relative to Linus' tree): 8784
 9753 files changed, 500607 insertions(+), 193090 deletions(-)

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

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--j0K8j/3cT5NQucVM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoaJGMACgkQJNaLcl1U
h9BxxAf+OaaSnPLY3jdOi9iXMEyGGpR5KQI+Too2VBq1ZltVu/p7c2EwynPLGzqj
n6B7gddZB6D9WwNqmaZiuidOA0A1wWqlheE81p6lvRWZQUQBzE/LzAga82Qpjqln
CMiIgu3n2TamZq+n3hp8CXsPF+R56T7x7N/lRkFg1CLYsncuFmrLIiwKzUQzUzAe
NFO0aEjVXyx3l6JcZDFxNNt22UNX+n1j2P2Ngn0uNkg6cNwrkEf6ZPT0y5jahrza
85oscPhLGUuwsn1+WXmrxCCboCLQMb3U2agHv53XZEWZAPDPVvffYBv5FwluGBC2
lbZ0C26B2F9E8VLvqmnQ8ETFRnGwmw==
=pFxh
-----END PGP SIGNATURE-----

--j0K8j/3cT5NQucVM--
