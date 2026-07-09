Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2DA25B0A0;
	Thu,  9 Jul 2026 16:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783613809; cv=none; b=fkZlvCQKduv68D82v887XBJtnLJvZ3ojfhES0xZysEdNbPTGzgmAt45m0j7nNxRLa7zCHsL+6Yvn7EmBddMn3T4uZ916YdIWf5aZvDLiEEsn9ucydlVUzAQD1F7NUENl7Of+m9udwh4Y1STuLx2btF9CWNRuzOvfe+qNEG5Nawg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783613809; c=relaxed/simple;
	bh=0zsJVH0XFxergsX4fDMS8JPODp9vGIA7/EXh/2mn72Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l6hEa1UhyyLK8/2srhJM55VadKSX7ZNanC67kpKvzLJpA9fxE1GpUrcpciix9qGcilfijJW/FU7qV64bG7pFZlzz8ltRhU2xkvRSoCvI1kFEXdOgJcWulV+hq0lUIXbYSRoT/HqnkgA/uCuk1lf3sUbGRaH0AXQWlmsb/Y+XrCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXoQxith; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXoQxith"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32CD1F000E9;
	Thu,  9 Jul 2026 16:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783613808;
	bh=rHnh2BWK3M3exuczxx6syb5K0t005FvC7NJnjxa52Tk=;
	h=Date:From:To:Cc:Subject;
	b=bXoQxithkrIBUofh8KxYAp3GDBU+i4g74N2mvpbU4WA0g61/VnmoWoNpjrtl7yrlb
	 npwfJwDSBggRjKnPjJwVmNtB9m+7GljBuMcMbm2OOy8xGRzaBnKoWp+ztUXEP9gdSV
	 X7QFjwlGzn0zCJaUFqmRwhJHT6AinzEGhovlx/gO9/PfGkmoYy5jBy/OawPTeSu5Eo
	 Trocmxh8MElMeRLW1d+Bv7oIl9dYe/hxWBkbkTKlo9z3bDccFUoF7NVdHitRcL0id7
	 SGNtVTqOhIn+FdYjMWC/9eiRBB5AfdMDLjodv+e+bpGdUwlnMCyIhTQWeGAPW4XQfN
	 Lz/sLg7fk4IRQ==
Date: Thu, 9 Jul 2026 17:16:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 9
Message-ID: <ak_JbPbbjCowJe8V@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iPWbOKtdWJLh5E0T"
Content-Disposition: inline


--iPWbOKtdWJLh5E0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260708:

The ext3 tree lost it's build failure.

The drivers-memory tree acquired a conflict with the origin tree.

The bluetooth tree acquired a conflict with the net tree.

The qcom tree acquired a build failure, I used the version from
next-20260708 instead.

Non-merge commits (relative to Linus' tree): 4531
 4522 files changed, 159016 insertions(+), 78452 deletions(-)

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

I am currently merging 427 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--iPWbOKtdWJLh5E0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPyWwACgkQJNaLcl1U
h9AjEQf/RHQ7tSm/zEV1WKCVzb9Xr5FAkTElDAaNjnl74CLwzOlQmgmkj8VFZm5E
ffQ4StB9GpbioTOxG8o38CdjsTNIo5q+AUQzuFDl6QGzeYT15heNMJorGZzF4j6D
Y+XlP+e9nsSSmf/X0LoQ3GRolBQFmweCJOp+ZBP4QvLMvsLX0bSQ08aAfvp4ThdM
0Py34p+hbXF/p74qxivMeLOfElwEOC0N2BxLFBNQIhE7vtXhO/uRqsnAwlMvOLfM
w+jWMTbJ1YFuEy7BZplhrYc+oj+MVFOQv/3lfSw+VwE9HvV+O2n0mgj3dvza+4hx
XIqX6bO+rcQFgviWbK9Mp4e38gps2Q==
=jGuq
-----END PGP SIGNATURE-----

--iPWbOKtdWJLh5E0T--
