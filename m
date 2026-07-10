Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A144499A4;
	Fri, 10 Jul 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692358; cv=none; b=N3ejFJ1JtBfUhFNBhdsrhVRuNG2QTx17ElI76x0iTwVRy0CX9u8Vk5IkYcrwXOL3QqEVBDExZxB60bvWhdpEOGiJYaEMwx4hGdxYPtZ1mAcH3p0rYFmeephPs94L9dX1AFOS0v4vmGRp9D1L7Trne9xD00hP6+9o2DAPimDSDgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692358; c=relaxed/simple;
	bh=frx+FuyUDZcwe7awWRt/6bl6kwbyTQLM1m4BVMoq/sE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AkUd+Kq4m2UbgkkklBkjvIwCBzpB13M1KvM87jtKRcwm81zHHdm8Bbyfn36M04T+6JpIik1M32PRW7jt4yjn+xisTFsiB5o97+GmnepviNpjdqcfPJDPs6P+leOxRUNLrhZd/vbnIPB/7FfQVbR2kAYGe5HR2eUNIjS/VD6sVgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ez74B24G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ez74B24G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EDD1F00A3A;
	Fri, 10 Jul 2026 14:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783692357;
	bh=Hb4s3BC9+SIhza8i8OtY9cyjlu69sgBxR0JgSotFYLs=;
	h=Date:From:To:Cc:Subject;
	b=ez74B24GNwCo0RL9qc0lxqZtkysVTqF9ViMbqJpELPYLyuEvSEJc8EMoR6NLkO2H0
	 1/aLMt59NFKELlnJ7LglBwM8tTEvzy5/1yhPe6nVTbDpUtSJs9d/ZOmXbgvyDiYRpO
	 TMK4dqYV+oegp1Zm2T6ljk6xcjv82PA+YhIPyk+C2uUM95fY0IBlWaVAve4e1oe3vO
	 Rc5Q3+F6N9UPbxSAkaZTHEWSUKF0sAZhQgNOvjQVYRie+kR7DgvW+KfDERM4LrP5rB
	 On3bLtu8h8pmnpwvY17vwASPcIfAulndkvYK3BJVN4OiHjNXm4hgBVuKy82vKGhwP7
	 caJBqZ1fbSS6g==
Date: Fri, 10 Jul 2026 15:05:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 10
Message-ID: <alD8QYL0Qw9CvhUW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gPngizqHNAO0//bt"
Content-Disposition: inline
Feom: Mark Brown <broonie@kernel.org>


--gPngizqHNAO0//bt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260709:

The fsl tree acquired a build failure, I used the version from
next-20260709 instead.

The qcom tree lost it's build failure.

The drm tree acquired a conflict with the drm-fixes tree.

Non-merge commits (relative to Linus' tree): 4908
 4871 files changed, 189282 insertions(+), 82980 deletions(-)

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

--gPngizqHNAO0//bt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpQ/EEACgkQJNaLcl1U
h9AgsAf9FFeogtE0q0aoE3fXn5Lp/o/iOi2yi4ng0hX6mJtEOM7rqpn3buNdQEpL
lBmES18F/V9jhrvptI622S8djLHsyrwWrVvtmrWMXjX+vc+Ox81pIIYzpiidzdBf
iL5tD3qjGCN7Yuz5ovvTHGgcIWiEjFpRQmEWesDAIWgM0WYHUCT9JMcbF4OoIqQD
o4k+20BoHbpdiXpN7VNf2EgQIEC6rqxgqDNK7TgckXLjLSTPAL1uvwr69jhNasrl
VRKp1AAV4dEtdSPwi4n2vvsDuLMhfXvMALEg6/Flnq9YmZ0+xT//gBUlbLAPd8Pz
P3EoFu+MKFD86X/QdKUy7VELYg5qlQ==
=nC7t
-----END PGP SIGNATURE-----

--gPngizqHNAO0//bt--
