Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82E438C418;
	Thu, 12 Mar 2026 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773339874; cv=none; b=GF/NmGqBn04a6l/hKxr5/fhQN/tCezLifF1PlD2xwMg9H0hkVydCMSaNukM5O/vlGht9tRCp0GFi2I7NCr/DZ7Doab6ST3wD8e3kF+JqmHSR3UTA/bb8SeU0nkY5LDMMgImufACzNxmpfMT6QQuckaZnG8yqdMMDjsg0oBgltfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773339874; c=relaxed/simple;
	bh=LGGeKH7MUc2XlQOraVFadqSzHtMKjR/8P1kAOTPy8LA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZ2mJTMnJxPoXgAoXfZfLwGvNMbgsum9aW4YqtEwHyv48B56nEvqkaq+jGPK3MebPzGr1o6ngZ0gPvcOJQ7dNaa+8RZo7A88/LhT6RjaXBgTBSaqn84Uo3a3pxq0GNXmHjdrGt6n/Afu3y/oMBNJu59m1itAxMcFUqjEu7XrxKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSzpm4So; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSzpm4So"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFE4C116C6;
	Thu, 12 Mar 2026 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773339874;
	bh=LGGeKH7MUc2XlQOraVFadqSzHtMKjR/8P1kAOTPy8LA=;
	h=Date:From:To:Cc:Subject:From;
	b=HSzpm4SoQTgIPj97TDQL+Oqmi22m1pqGIihuzzq3F8xnwwBmVpGlXxvek6UhhVnAQ
	 Wy8zbIx1vZ78DsQHcF5hLI1felwxZ9q01rL5l0194274AzIjgFp2twFJz7g2Pklm+B
	 P0KAx230Jn00SHGfJU9+K/Qfd8I6LsJz6uG5TSD2NsFI2XKOtK1YemWL2qbtwsMBbU
	 8/sCeWBI7Nkb47X2o/frArOOfbanIIily98G0XKKS1mbC0AlSkDoIJa/TAqAnMTwX4
	 htX5N9QJ14dQf2Rx1Y4NJGeG+zzSxnfePk3Al2fouyD5iSf3rQB8eQfrIT06MR6Yru
	 TAMjnRaSA7UHA==
Date: Thu, 12 Mar 2026 18:24:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 12
Message-ID: <abME35HVb9QI0VsZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J7DVpdiNCjT20+oN"
Content-Disposition: inline


--J7DVpdiNCjT20+oN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260311:

The net-next tree acquired a conflict with the net tree.

The bluetooth tree acquired a conflict with the origin tree.

The mtd tree acquired a build failure, I used the version from 20260311
instead.

The drm-rust tree acquired a conflict with the drm-rust-fixes tree.

The tip tree acquired a conflict with the mm-unstable tree.

The kvm-x86 tree acquired multiple conflicts with the kvm-fixes tree.

Non-merge commits (relative to Linus' tree): 5412
 5680 files changed, 354180 insertions(+), 97244 deletions(-)

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

I am currently merging 411 trees (counting Linus' and 123 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--J7DVpdiNCjT20+oN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmzBN4ACgkQJNaLcl1U
h9DmkAf/XdwV5wwdNy5CkuKW5WeaeFsbYeldr+bLtJaCm+/1zHzYvPXoXWULyazv
wq7hVRrGk1geZ0sedhJx62kqgaZmCMT3cOYQqTyCzCmDIhJ40Ed5sEibC6iN2g5O
tP+yw2UPwMfteslVurIUqEIaFscjzFhgBP2fuEiqORGH0gbVHvv2sWM84d3M01qA
euT+9XawosNKFiQf771800j2UnZB3l7zJYSUujD98VVmkEBd+01GIZBm0vp7SXUb
gMVJyG/El2YOByAsM/20h+COQhdg3Fhv4QjWehgadtt05u/Hxj2sh/0k06+tWerL
qgLhkuhpYYbgBLEUgEUwBevNOxctDA==
=8ZHV
-----END PGP SIGNATURE-----

--J7DVpdiNCjT20+oN--
