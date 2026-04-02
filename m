Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70448313298;
	Thu,  2 Apr 2026 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139111; cv=none; b=EcDA5fBI69JFW5GJEC73Xsl+Anr/XwwNVHnXoRXVb2rF4Y/AH8yRhMjsrCB0ZAVQoHllkTX0r3bkWmLXz2CwwgI3aS23AMqdpUmrWkNqBa9Zeu7OKXPi/2wcJkga3RGPjhFaUN/DGhvNVdj5TINeJbO+blAJSq2JjXck902Zvxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139111; c=relaxed/simple;
	bh=veZuXTVREu57XMz+Zd7NCBlJ7Wt8tcGXDNCsWSqVAT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avcCIuEuveVqG0w/JS5A3UTRnwSudnErsSBLPe4uJj1Xv3qyrUENJdGU2N6LEn8vc2N45Pp7s6BOuAHGiQ2yczkzp0deughIuXXfVk+cJFVe0+DBbYu+JHiigpJTjcsCtxchQWq/Z9FQmolZkOYawQWA0iY75M1BXHaml128C/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUKGYw7A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUKGYw7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669ADC116C6;
	Thu,  2 Apr 2026 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775139111;
	bh=veZuXTVREu57XMz+Zd7NCBlJ7Wt8tcGXDNCsWSqVAT8=;
	h=Date:From:To:Cc:Subject:From;
	b=oUKGYw7AHXb8faoAdjrvG8HS8QqhS/mFDJvIMtvf/WB/k0/TDKOzP2WQKdzYBLaeU
	 NVW69wMRoIFxLzDMy9VkeSh/qoRBz5iydco5aeJueqOirK2EbYlhZtM6pfGe9Qi1E5
	 3GACn/n0yG9j05fqHwZuPQWP12jiegN6+njP1FCQPUwX5gm7A8S+6N1A+No6wgpxAz
	 i5WQDr489fzrPVOS92YCTuvXTxAgf1O71++nYCj/4fuYE6FBdqpys1NjVy21HUjrhy
	 GEesHoLTpOMI3T/70d1dZ6oiRkqJ4uIubJSDq3LdwIAr8jSE7BxJeboXVJWUdy/Ger
	 DPaMzYzW0hn4A==
Date: Thu, 2 Apr 2026 15:11:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 2
Message-ID: <ac55I2LuxCmowc6M@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nEaI90CDO0l/XbvU"
Content-Disposition: inline


--nEaI90CDO0l/XbvU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260401:

The nocache-cleanup branch was added.

The vfs-brauner lost it's build failure.

The amdgpu tree acquired a conflict with the drm-next tree.

Non-merge commits (relative to Linus' tree): 10534
 9936 files changed, 592446 insertions(+), 193544 deletions(-)

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

I am currently merging 414 trees (counting Linus' and 125 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--nEaI90CDO0l/XbvU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOeSIACgkQJNaLcl1U
h9AJpQgAhK4WiLY4EWm/WJrRX6thHWUFeR7rLFrIcNMSpf00fvsMr9Tw3XcoaOBK
Jdmt1jhvUfe/FRLNm4Vbddm/ufMWNfwSbMkEeICVJ96AVARDC2QWHzHmsByHVvE1
FvuAIFrVnAAKTx1TucqcngzLC9VbJzGdAw8EHeBgcdEeHFWp0XpOkjniLb64IMQy
rCVu/JFwXACKS7S3u6gVf322f/CUd2DG2KcH7rErFvXyF80DJEsTzx7sbzCDuhuP
VDgxWHF37l5YBrG654Rttq/5RMZ4i5X52YFpb3eVZTDQAxvB9Vf7o9+gNoNwl0+w
xRJDNGElT8Gv0uuLHwLVXFPXQquN9g==
=8MDO
-----END PGP SIGNATURE-----

--nEaI90CDO0l/XbvU--
