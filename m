Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FD02D0C9D;
	Wed, 18 Feb 2026 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421061; cv=none; b=jlEfcyxSSiwhd6o+qPVFUkCcemoPde6lZMl/YRUdqqwrM7tN8vmgtJ4XlxkufMkDr/3hrcFJYgS67DXD5jVhPymZ1Kc8nJAwTKAGQHvFCQcKfKMnjIS1d87gH0bMD89qonqwZZ0YIQhruI2EoBE8XLW+snaEyRjCOx+Hb8ZO4hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421061; c=relaxed/simple;
	bh=/4KIKf78VMlPjw3SRIYWKdMBZ7bFuSKAqr50J8M79sE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cwi7AbY0zQCuB6EYxPIBTQawzg/piNao0cYHW/qfztYF70v0Km72v6EtuL1c2mYdBwyne2cMPS99F9/W9VGy2ETwQIKyYXHXMtYbjDJcvxy6pNazqq+1GxXvlwWaowZ6KPFMActli+iIM2/in0BLUXZYsDxBh8LrJxIOaF37v1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tULg9E0e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tULg9E0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15B0C19421;
	Wed, 18 Feb 2026 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771421061;
	bh=/4KIKf78VMlPjw3SRIYWKdMBZ7bFuSKAqr50J8M79sE=;
	h=Date:From:To:Cc:Subject:From;
	b=tULg9E0egVm31bgiFuQ/PrnVWJW/de9Dl//vwaYUi7ZmMKC6WIgniokfsOjYfajBg
	 J17P8StU6mnNvXyOTgPCnpYPAzi4Xby7w6oxgxbRyMASyjcUHJCuIQoiWIutYUKl1Y
	 1Nz9aXIwgCTodwcujRLyyibypIoMJJgKWO5v7feLajGph0vNG0A2mG6pi+gC14eLZK
	 3IJlobLYTk0J3ysroajh0Ypzno3MeSIhlM/T7y5E8zswvWjZqttOHZS3WG6ZtfSYZm
	 YLF7+d8MFnjEgQourNscXYtVgj+yF/n+s8ydUWEidYj6AyFeBxu//d7vEioruymETG
	 JgacHWeXTR76g==
Date: Wed, 18 Feb 2026 13:24:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 18
Message-ID: <aZW9gPWFSUqsDBBD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wVih2hb4vXqGrrbt"
Content-Disposition: inline


--wVih2hb4vXqGrrbt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260217:

None.

Non-merge commits (relative to Linus' tree): 1312
 1271 files changed, 41748 insertions(+), 20456 deletions(-)

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

I am currently merging 405 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--wVih2hb4vXqGrrbt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmVvYAACgkQJNaLcl1U
h9CsOgf/Uc19JQ8IwhjP0VSnFGwzsrWrwdZGfgXbFOQu85qPsn8mN1u3bKjedl2F
eXjl71Q+CmJZJuZwTOAoIJyfqGwYv4srkaEmFmB+0TRM6FTcYuOygjgV+Iq2nvb2
/IojRDu13ACMGmkx8dRdtCPFadm2XyQj3GmlqwifMvSfZEY2OYSB4B2NJuCcOtAp
oe++Ug8hlJGKSiMWc32SgJJ0zsfLdyRfqE3DrTqgMDQrbKZekru6x7cPM9lDIeyQ
2I7TYjDVEL4bXsHDEI4XzDhs8mDJUQGQ49NJb94HlaIgvVa+QFQRbueLcDS73jp4
rGb6cWeUc30ZF6hbY6YUUvZOseElrw==
=yw9w
-----END PGP SIGNATURE-----

--wVih2hb4vXqGrrbt--
