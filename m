Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD21FECCD;
	Tue,  7 Apr 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570500; cv=none; b=S/k60fd9DhanMGR5QwpYAvRGRoaR07newDWip6oDRs7yxUeBMyzjsFkWBGd+PFE89gYkAtiOhG0vKrdTNbvQ4B3+09iPOJ5vkDqBGXmNHQU5MCRqGgPjovbB9xECXoKVlmmgceGKOiy6lH4ap7ScJSqEIOPf4NdMY8PHPtVHQaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570500; c=relaxed/simple;
	bh=V3tFxd6wgAhtgrFdsYYtfuw5n8/K7SM54fzpZ0RE9rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpyEHeXLV9rdXQmGXwCEOWtElFpvXEWTCSlJX551mvaB1QKzbrjv8I0FMn4THR0x15wMBE1ECetnQmWVOHpZ0vXSBwfrUoojLPVVA3AYAXZI/i54XAfqEDqZUIYZteAMJ8gZKOz3T8yOopaHsdtPhpwkApNDNkAEQyhcWUs9u9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEYIdKAS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEYIdKAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625C8C116C6;
	Tue,  7 Apr 2026 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775570500;
	bh=V3tFxd6wgAhtgrFdsYYtfuw5n8/K7SM54fzpZ0RE9rg=;
	h=Date:From:To:Cc:Subject:From;
	b=JEYIdKASRsrudhih3iOzQp8AznBA7aaylkAOZTLBSD3lVd60p2SdVYgocM3ciRxDW
	 MSxindZJhhBbIzc1cgv1vO6d5zhZKjjbIoET85216ojY4Z76BhvAfb6sxa6PPGShxY
	 8P89r2eaVI6xTpXGZIhoB/vzXTbDTz0eEye0FDx1VDkZYS32tBkrDdu7PCK60grxcu
	 RKd1Tt9snUl2aVih8YQbOH6MuNR0T3FNBcXgdheFBfXo7zFZ3LYf4n1FBfZ/VFdViD
	 eEUTdCWpxTa7ZgBQByGs/msuYuptsbsmG5Qe/AktjB5VfKHMT9St5wDmPWFmt7fSQP
	 Alx2BZWbLtAyg==
Date: Tue, 7 Apr 2026 15:01:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 7
Message-ID: <adUOQPNaZ15fWpWp@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fZ2mYGkNa/YqSpYK"
Content-Disposition: inline


--fZ2mYGkNa/YqSpYK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260406:

The bpf-next tree acquired a conflict with the powerpc tree.

Non-merge commits (relative to Linus' tree): 11373
 10640 files changed, 620998 insertions(+), 211898 deletions(-)

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

--fZ2mYGkNa/YqSpYK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnVDj8ACgkQJNaLcl1U
h9DVlAf+N4/2Mjcsxs+7PMNKtOHqJKPs6muQonvhOxbHl4poSQ2CLwvDNoNej5V1
9Q9C0kqwnEIk5RFiP+4qQoD+DhM9Bep0PNNQLWjFwE0vRgriP4h9+lTd6AETiV+e
94qnAX44oXej049ewFj/K3RUFhQESmGZCJcsNtEnMCcQBZbp5sMSgJ8mSaY1e14/
nXfrFY7uVVfVQ5MFSNob+vkBKAtwT4iTKZyE8NMZT+I98T/KYwu6LI29mBChox2n
V7dYwb+gi2Gr1V/7k5rpJj/lKY5uToKRD9P1HwHDZnUD9YfuRAeiZtB9cHOgavMP
Yk9XBxm2Be9CbbHf36tC4Z20kKod8g==
=jaDn
-----END PGP SIGNATURE-----

--fZ2mYGkNa/YqSpYK--
