Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A938CFF1;
	Tue, 24 Mar 2026 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367893; cv=none; b=r2abkxZlgyQoCGyDaMUfGJQDGA/BELiPRBiHs5+ZCqU6MgH2KZzYrX89j0qLl2dOPmmhXnWVAZOO+etVTLqvJu10Trce9XG9yZpLojCrvd48LvMAvln3sUMGGnsNExzjCF1GUzMPqhsvMRMuaAclhAHH+mYSYvOmhr4H5s500nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367893; c=relaxed/simple;
	bh=nfvT7C3boUea9Lgsel3AgYnobBRnYb4pzdyapS8q7yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJvMfG9w4d7Ppkok385xvTHNI8+FxCJbug3ADDuoENs3+RfvmeU3CYsWJFjK+mXerOapZfaSLHPFSi3UxN9GPgWKlwRLK1RMrWjT6LQZ7jTbh16uUB95uyzUQfV8soLd+CZ8M/nqVQ4npa3ycsoF/VMqA5VNjR8PxdM5xg5t7lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIHzeR0f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIHzeR0f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB6EC19424;
	Tue, 24 Mar 2026 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774367892;
	bh=nfvT7C3boUea9Lgsel3AgYnobBRnYb4pzdyapS8q7yQ=;
	h=Date:From:To:Cc:Subject:From;
	b=NIHzeR0fSO66+CAgXWLH8V3YvNePaix74ulGlhsugavnss4RYxClInMAnBYkO9qto
	 lvyez2zgBzvq421ehcC4vIP+4WXtraq9Ae6PbvIEASIXJ99VTLhG6QS4yD0lGZ93jS
	 AOKvYyrBwzxa7zlpZTIbCK67gHXVqrrrHBZEqr8yb8fiT0GrovuXm4a9unGiq1iRgH
	 jYSoJmb+eVt+jAhtgDMQokzXUvc6oi5HTuQVdK5ooLKJXsEgIbHhE0rL3GBCesz5Ro
	 XV0dJBgg4wNfCMoZW7FCCX/d8z1Qkdc5yExIhCVPdcjgGICGvQ6lidbgkvybkKV2I0
	 I2+jtTB8injdQ==
Date: Tue, 24 Mar 2026 15:58:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 24
Message-ID: <acK0kdnGj8-vT0Vd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FDkqIwXvqWJSrDdT"
Content-Disposition: inline


--FDkqIwXvqWJSrDdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260323:

The btrfs tree acquired multiple conflicts with the btrfs-fixes tree.

The bitmap tree acquired a build failure, I used the version from
next-20260323 instead.

Non-merge commits (relative to Linus' tree): 7866
 7810 files changed, 513548 insertions(+), 154944 deletions(-)

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

--FDkqIwXvqWJSrDdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCtJAACgkQJNaLcl1U
h9BmIwf7BIjs04rtDxJHPOaAATbE8mEwGtyAxq6FIqVI+YyGkAMpKEf77IjVEJmE
SbMljx5VhdI0iFs3w7NMHpfU1mH0vBxdkFuP65TlsHT4VMr2xRghc5lsRkbM0p8e
EChFu9S/aLG2hqLJukt6ccGwia3mrCAiHB1t/Wv3kVMFEesXLu4iZdAvIlkbBmh1
LmTPawlBF8pgigVDPgOYLwbkwws3iYqIHZyxIq1orVh2qXtMiyBmA20FlFSI5vKe
rKBokT/4ycQaJQP1SpUq9PmP9CRJMxoRzPITkmxQKcguYsHcRz8KA5xaS7KPAc4o
3eyTM5lEKSKpKiAq+vTK88hfzxR2lA==
=0ARZ
-----END PGP SIGNATURE-----

--FDkqIwXvqWJSrDdT--
