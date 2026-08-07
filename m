Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C738E121;
	Fri,  7 Aug 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112935; cv=none; b=Q67OlkiV6FcQBcWuKxlBGqTwqe8yoL8kAGwg5nTmuOy2CJ2Z0yWM/966clcCxB4iTqFFGlZfJqmU7BmUNGXp918RU/766qWIRuYuqFvZSGKiDkDwQEIFRpP6cqgGyBVQ3OSRr7LXteR1IBH9dsR9ze7ER+djLkIrc70/9f1ijQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112935; c=relaxed/simple;
	bh=xr6B4U+4PXmKUr6dGxxs7KXHblOYdTU/ojzNda6O/LI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ty/ydaASvhsZPLLwDap9ua2/qb6Ks7fFyuiwXGzCPBO8GKT2Rn0ilPm29um9Hn/JdWGlR9/yw2NLckdd04YZ4D/cI/DFbNunPKj/XqvQ3s/q4P6gOoFo3Qc5fj2npCUFne9lqlc3Pokc4Z6Dsua/lS9KyMHXELhueUTtVFfgDSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d34cRvSi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d34cRvSi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C115B1F000E9;
	Fri,  7 Aug 2026 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786112931;
	bh=bY9jtQ9OJ/ytLhvtPA3xIsOBqQZXybZEjiJtY9epSo4=;
	h=Date:From:To:Cc:Subject;
	b=d34cRvSi3TdnDGlcAdtryJ/d0/rmApgR5dJCsU8j7C0FtqDn1g+FXgi9zT/lMy0y7
	 coGJV3Cob7RkNSNXeVZzvQs+gnQgAWSbDldcTWuWC8RXHByY8XsvhiUq1N+DdhugX/
	 bFwJjqQO0N+T9Qy/PNLuFi6N0L/KREriv69IaX19ad2/tlC0jv0svWUyNMvd5AKrZ7
	 fMhmKQ6p2i5t4eEwEkxV1nx39ziJPSJhU3r6wjJtK5m8Ji42hEHgSiGQffclzq9PTY
	 63rZs4vuh2m5q4FlsGBl2kYG0jqqNzkR3DhQ8w5jXkQy4/L0ck6AK7Dosz39JHaXua
	 4bxiHSvUzjRpw==
Date: Fri, 7 Aug 2026 15:28:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 6
Message-ID: <anXroAGzzyXhA1Kn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lElSAGDoE3LTWjPP"
Content-Disposition: inline


--lElSAGDoE3LTWjPP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260805:

The pm tree acquired a conflict with the risc-v tree.

The char-misc tree acquired a conflict with the mm-stable tree.

Non-merge commits (relative to Linus' tree): 12277
 10945 files changed, 574456 insertions(+), 194127 deletions(-)

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

I am currently merging 429 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--lElSAGDoE3LTWjPP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp1658ACgkQJNaLcl1U
h9ArPAf+LSKXB+RFoMYVzD1n6/it5f3TeLipz0Ib0Mu7MLbIfwOITzMPPWXjFcn7
JRvK1Y+o1gDCRM/gzV+zet/N2EqpPoGXBUFieQDtERk0JmV8rMjlT6TtT0Pd3QQI
ZYVbybvDmQq0CTu5vLUSUjDlwOwa+LgQz6o275Ty8qgqk8opSH5x5qc+fI9sifvx
3BJrVgBLQHFELYgcmEKbkHs9vg3qNsR/briYUGLUdwvKQKFiWpYWLAlXZ9+heZQY
e3ic80wHBvVXEHqzWHf2a2Vc2H7eV0QuyRuZeo2yhx4JonvneWfAA1OVmC09zICv
7XOHdfX5s1aavzV2DbW9YFMMFU2XgQ==
=qvVj
-----END PGP SIGNATURE-----

--lElSAGDoE3LTWjPP--
