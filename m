Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A995D42048;
	Mon, 25 May 2026 17:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779729257; cv=none; b=H7g2vVfbD+cmBJw3S4YhSb3zWBZg+gzreiidCGKeSsNeG9wm+nimTVR+fgv1ndNzVXhmX9yJ+SeorSdduik2hkqIf9DHms9iUSX5hOsqhJbeIfN+V3jpOjAkvkVPH/G7IvOkqL7fDEJmhVGUwkX62aaurdZgTffYVIoYmaoGx5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779729257; c=relaxed/simple;
	bh=9SI3p9zHkFM5Y3CIb/H0rtt6Nw6u3cuz4JF+A2DrUoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rs7h2Cpur7UpR2JJ1i9EogEQ5kcIO9p1U0PYM4GGS2fvyEqiBAxC7AopiBDr2KeeUsF+bwrbnhtpMMGqwTa8xsrwCfJb8VwqR/+FMtNJ08Zn/FqCP9ka9PwCBfcB8iO8d17pu5amIM9c4IDtv8mL4mwrr2ML+0Cl1LM4UideCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axyr5Ywm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axyr5Ywm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56041F000E9;
	Mon, 25 May 2026 17:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779729256;
	bh=mK1uu4ONoSJ1BAExA3aem/4XXVCDGR2VkWuyHiwkqsk=;
	h=Date:From:To:Cc:Subject;
	b=axyr5YwmR/oHI7BO8TU/vFCYE0UWfWi0Iizmb1P3ntbjZ7qEnY/dO0mFTF1EcdMjR
	 cc5A3ti1rmOBHl6Rh/b3ayakaw1xWJJYQljTufspZ/IRGhvOAoLVy1K0hfc0pDRVPY
	 cnBvySehmjjAKnFMh8WShGF6UkRJCfolENthTfvmLtqILWMiHSZv/togLkEGL8Gzhq
	 uyf6WY5PJ0YBQR48fljacK4COue6sh647w1FnNb8CcAJ8l/NRaXnYLVFnWX+VuD22Z
	 +4BhOEmkIaV0f5Is6lGQxWNajnFBo3L8MD49EWl2fstcAAfoEh9Iu9hAL0M93zueQh
	 vN7UXFU5ou5Lg==
Date: Mon, 25 May 2026 18:14:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 25
Message-ID: <ahSDZV9eR6zJ1pxG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FksEXsGwxgtqdLFK"
Content-Disposition: inline


--FksEXsGwxgtqdLFK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260522:

The nfsd tree acquired a conflict with the exfat tree.

The nfsd tree acquired a build failure, I used the version from
next-20260522 instead.

The vfs-brauner tree acquired a build failure, I used the version from
next-20260522 instead.

The btrfs tree acquired a conflict with the mm-unstable tree.

The drm-misc tree acquired a build failure, I used the version from
next-202605022 instead.

The tip tree acquired a conflict with the pm tree.

The char-misc tree acquired a conflict with the char-misc.current tree.

Non-merge commits (relative to Linus' tree): 7258
 8265 files changed, 442632 insertions(+), 167862 deletions(-)

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

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--FksEXsGwxgtqdLFK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUg2QACgkQJNaLcl1U
h9D8xggAgh6AUUQREo9Do60LAvVeweQXpFRu5G9mBuCrJonhy8PBJ12t5twvPB4z
HQQUsmDC8Us68+RKn7z3USlqGxFGiDtWuxVqC48ReY/LQSpqTT0IwnjsEF6pelxd
Z6dctab3lh6GkccQmXIuIEK8S6+aG7/LDTJ5PT3aOmvr9DiOlTMejo974wZ2LliF
YZ8rtIpm3+To2hksntTKGw0228LH8pfe63l55PIDU7uuije7nCZPRmngJDesyik7
TaQYw7Q0KJ1nM8UY4Fv9PwYLnKista30/usZrqKRCWnW0rPJfUKOaDY04D+IDV5+
4Sd9Mf8hjPLUcApiQywRe3pfozhpgQ==
=QFGQ
-----END PGP SIGNATURE-----

--FksEXsGwxgtqdLFK--
