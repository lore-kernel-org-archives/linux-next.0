Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5C936C9D0;
	Tue,  9 Jun 2026 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781029354; cv=none; b=NVdkVqstpoUyid6gfO/1G3mZmCzfFBYUOowEqQ1qjEu6A5kBX3XYqSakPDKXyg8cSO8asHwGKlMmFi6mV//cpsa0xtToGDXkuRKcGBofhTJcJdlkmxe2MqJPIH6hDuGMJp2KSCubYLekrVytSMXsZ4txosIeG0ZtmM47gnCYfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781029354; c=relaxed/simple;
	bh=QGTFSlS5uXRQhzg9ry2G6fWURvIZJ8eD7ulk63LAFYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2gIwr1BzfMyWI1wT3meRNo2P/2Q2WiUlejRMY6saQK7VUwXolCLnHe4wISYvzOX+iW77M0vK209wWUlBY53hOB3mTKcwnPhYtCN/8y4z0YVbSaWzJ2jFlRmIBHn/1CqPqQS7yNTxzK8VzW15Nf4HHZYkd9c/00UtafGxoPRqMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrLhsrfC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrLhsrfC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6111F00893;
	Tue,  9 Jun 2026 18:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781029353;
	bh=TWEe5IMO1MOd/sPS0JKiBorVst5iLFH/pF5e1ulu1yE=;
	h=Date:From:To:Cc:Subject;
	b=KrLhsrfCB8ruMrObdEp8Jjj703gBCxAIi0YcXff3mxJUp7I+43ewvq0Ghb+irZ8/S
	 CPK6X8JlNj1+I3sYAqRiGwjx8pjEj13GZJNWI9fQKgEo7VzE/3NJJEHJUf4p4FCxcb
	 0GCODtMVPhT3Qlh7mND/J5kBkFq688u8nDOc0drsIzkfuoPCsEStbVeH7MbHMpKv+Y
	 kAJfaJFenfK+GQbPIh+tb5MVKsWvFfYgTnqf9liXSjixfTK/7lUlShNGGcN3MdXT+D
	 ssmQ1nQlA2y37GE6G/WkW29zn2VmBBnpI2Zp0JNs3OWemVIKD+mRrGPuRcQnlEXtR1
	 wizFJ48QL8mIg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 108441AC56B8; Tue, 09 Jun 2026 19:22:31 +0100 (BST)
Date: Tue, 9 Jun 2026 19:22:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 9
Message-ID: <aihZ51Nt2sh_1Je-@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WkEF2bPdseJUeCjO"
Content-Disposition: inline


--WkEF2bPdseJUeCjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260608:

The vfs-brauner tree acquired a conflict with the xfs tree.

The i2c tree acquired a conflict with the i2c-host-fixes tree.

The drm tree acquired a conflict with the origin tree.

The drm-xe tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 11532
 12449 files changed, 774310 insertions(+), 232823 deletions(-)

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

I am currently merging 425 trees (counting Linus' and 131 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--WkEF2bPdseJUeCjO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmooWeYACgkQJNaLcl1U
h9AaLAf+IJLuPRREAHzcK4vKOpfutHIEDTP06kB3qGs+/W/KNZlwrIjJMFY2M8iC
uzGrA7psCCgk+2k8z/GSR0plMu26scXlCFrWZy9KFdrlGw+RnrMO6P8Z+08GYk5b
77wwD5DeCg5RAR5mxtKRnR1zszZOzwi88/nt6Bvou83eQ/9DuT40UEt/RkGWUs8B
98iZwowZHdBZtVxRCbblzTkuTbrIiPaT7EyI8bRem3I0yvMDx8m6xqbfXwA0P8ea
Oa2kRO6Gej23YmwaZOXLTzLBuUCt3nLIZaOX19t2RMa28yBO3xAm4kHW/Xe3OPyF
pEV+PJVOh36Q1VSIUlzyMsiqUBH7ng==
=8wJD
-----END PGP SIGNATURE-----

--WkEF2bPdseJUeCjO--
