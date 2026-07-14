Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD292480974;
	Tue, 14 Jul 2026 15:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041587; cv=none; b=Zpnn1v2lNxdaTL6IZdsF6rKwi24WVnTvZ5QIQiC4XLDBEp+dLZEwXOGtIvNJMn0e45zynpFBYOGs5763ysZhwPZ+o/Ah+Bm/j4Ae5atzFJznXw/+2W+ugg2C3jdQd22EJ+cFiDYFXnVXkiM+hn9kgeb8LavoXGvWsY9JuLVlrfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041587; c=relaxed/simple;
	bh=LcP2UnwKgwwW6Rx2pcf+9SQmj0MCqzWjxdelvc3FcVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8HLmbrRGir+Ya0DcEo2ePeq/cU7bKQDblJ9NWFQMD3pIXjPe48Kg07gX+ymLqnMSXhffV9w2q4P3TIKSMcveiKmXTxiKjlstaDSzD96QlxrwSHtexttrLsrkGapZZmDr8upgaLbQcPGNPFlZ0AYdHhnng5Y6QRR39p48yYZfDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EU4kyCl6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EU4kyCl6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8921F000E9;
	Tue, 14 Jul 2026 15:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784041585;
	bh=FKERsfHUCjEL8mTnNgUrUcEeJCC9EIwMuVfL5H5Q9rk=;
	h=Date:From:To:Cc:Subject;
	b=EU4kyCl6nffsHh6Zi7nhtwyHC0MCJ09B8f9WfjAXTiXRSgindVoaJ6VNYfnaOKp/Z
	 lBZcQsVMM3DkJVTdFy0gdwhg0ObX9N9k9mkURi0U+zbUZuH82Yh93/l1sjWJz3O6Cn
	 P+xZMi9d5JFsCwTzHhBdcHL9rRKVchfCMxGbfmGU3/AeywRn9DfzXdYAtghuKhNste
	 M1X4HuHVmZIaZt4vLLySpa50ftI8bEGuTnhPMVVY3KdiLmbnYi6XyJThNZXoQkJMQQ
	 wBqu6fdNCWCCqfA6gPZNoPkOaWNmWAwpuDZHFA6q2c1Tk3YTySGEVq8XHvJSfXxQKl
	 li7QW0C6Wo9Aw==
Date: Tue, 14 Jul 2026 16:06:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 14
Message-ID: <alZQbhuQPygK9Puj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/niws0HSpwaYtdMq"
Content-Disposition: inline


--/niws0HSpwaYtdMq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260713:

The realtek-fixes tree was added.

The mm-nonmm-unstable tree acquired a conflict with the risc-v-fixes tree.

The jc_docs tree acquired a conflict with the mm-unstable tree.

Non-merge commits (relative to Linus' tree): 5610
 5578 files changed, 224849 insertions(+), 92145 deletions(-)

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

I am currently merging 428 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--/niws0HSpwaYtdMq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWUG0ACgkQJNaLcl1U
h9DnNQf7BKlfTMf3IoxX3Z0C7TEGPQLLRaKWgfQvp2WtD0CzMNv0isLKRyb8yE58
o2BDz+vSaj9lXWLS3AQIiUe3AlQp+uZH3YkCR4jpzlUYdeoLtNY4Ukk8m5n1E1lQ
wCHvV2gPBUJxkYSXQTuy1TIGahqvCw86bO83xfeBrc559IbMrCz9Ekqaovlky51J
T1IqZop2rpTTEKO1caktqrtc3NDzfH0j2aJp8fKwlQUjdxyuOQJHRPyTInCPR+ia
bDBrRchOln/mGeb9zqYv2eZuRnfLpCPjZCLkeo/7YGE55Lnb5Y/32eOTsRVU8t9l
YxDt/ezttNhyoB/asqhh6gfRp+GQwQ==
=793D
-----END PGP SIGNATURE-----

--/niws0HSpwaYtdMq--
