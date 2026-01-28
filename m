Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D32417C6;
	Wed, 28 Jan 2026 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617329; cv=none; b=LRmmomXOK9ezu/YUnxjaacSRcVk5SW66uYR5iVDHkNoYSjx99kL4N6WkV9b7yFHjStIixyvlRv0IUaEc2oD31C4CMl3j6IitQ+DzgJmG9BuOJjDf4xC4X/BnmooYRSxgBRiYLsfqwbDBmnOWUvgHzMPcpUn91Ni0CVPqud88M9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617329; c=relaxed/simple;
	bh=HfpbPlVNljTNVSvv/JJDsB3QOrqGqsjl8rNAngK6E74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E6gCYCPldQ6Vy779Dv2dsyaVjnof2YFtJibAYu/yznZzY7N+eZN+hMQGtySkH6D15cpCBdeP3ly/P7VE8+BN+EDzKs2FrnfUPcUK3KN6d1N0O0EdBkcH6JX3x3kD7tmC1r5NRlpd1jU0z3bu7HrymOEHB0iM/IVGx+AghsXN4+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1evmEiA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1evmEiA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF574C116C6;
	Wed, 28 Jan 2026 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769617328;
	bh=HfpbPlVNljTNVSvv/JJDsB3QOrqGqsjl8rNAngK6E74=;
	h=Date:From:To:Cc:Subject:From;
	b=p1evmEiAoP1nzepdjt4CYQ2ehBZM8ewh8gtM2bhwycHA5j19aqkcVBL3YHqlO/Bc2
	 G1fuLSb8Jy8S3l7g0HMtVuO2Lk8L+hsjfgesbKX2Ou10w/SyNKPhEBuNojmdLrvrzD
	 tVbN2ZYnUTe7+y9G5D5Jl2gTUT1V6sw02//wvVAKUIrEwEQ9FFG3+8REvPpxNYAYlv
	 bZRd6H1tB3BDFWE9rU60iE/cmrqiB+4YIC5BDn/OB7xICUS+pYblwhboENFTkPxMl4
	 IR65KfBto4R6WBbTncqeXA8xnLqCBhXkZzKkH3tfmuDkFFaaPjxx6/jVkSlDoLaDRG
	 DgPzhHITiyUJA==
Date: Wed, 28 Jan 2026 16:22:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 28
Message-ID: <aXo3rd8M1aolrJX-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TLXZNWM3YPyE1Lxu"
Content-Disposition: inline


--TLXZNWM3YPyE1Lxu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260127:

The mm-stable tree acquired a conflict with the dma-mapping-fixes tree

The perf lost it's build failure.

The block tree gained a build failure due to a semantic conflict with
the btrfs tree for which I applied a revert.

The dma-mapping-fixes gained a build failure for which I applied a fix.

Non-merge commits (relative to Linus' tree): 9445
 9359 files changed, 540658 insertions(+), 191300 deletions(-)

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
an arm64 build of various kselftests and a native build of tools/perf.
After the final fixups (if any), I do an x86_64 modules_install followed
by builds for x86_64 allnoconfig, arm64 allyesconfig, powerpc
allnoconfig (32 and 64 bit), ppc44x_defconfig and pseries_le_defconfig
and i386, s390, sparc and sparc64 defconfig and htmldocs. And finally, a
simple boot test of the powerpc pseries_le_defconfig kernel in qemu
(with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 404 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--TLXZNWM3YPyE1Lxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6N6wACgkQJNaLcl1U
h9CQegf/RHfsNxOpbd3YASAdq48Tjr7NZXMV9E13ZLWHZvAoCekMmb81N4dxfmya
ox6HgI+5Q/hyLwrJdR1YxJHuR9UQqxiSEnb3Xh/iydfY8fNHjUjqNBeBsHxc9wWz
DrTm4UQvIabofJ2bMyqTxtzO14R1YtHNyn5395c7dtXb7a2kSW7yXlc1TZxgFeo5
U8dn74vTymUs13I214LeKkS+E30vz6fnb4Ip++4lzYzGjpE6Rn3MRBW5WbQx1VGx
kG9bs5Up+nrF+ZSyysI/UvLoXNDEjVLDkMZD+fwH6xYDuQj2hEfl9Mx2zqp6oypf
h97NcbCgcDL79m8aC6QEQdZ9nLQnvw==
=eJKt
-----END PGP SIGNATURE-----

--TLXZNWM3YPyE1Lxu--
