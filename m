Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6812DC76A;
	Wed, 19 Aug 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144315; cv=none; b=gmw3Q0ASUM15GcFFdBYoH8RQsisEo0HxYXo8TFM/rAcrYXmlTjtCjyiTe6tR4v0kPmZnHGU02g0MKYm0RHZ3Wjx8Ux2GVKiXC56YnUBOascHekPRo7eQpzD9R1W10huaYDnAAHaodYm6+VdnBB9Lw6egk8qCJZUCRokHhpxzSd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144315; c=relaxed/simple;
	bh=F4GQxRcKE6H5dh6LeZ+y5SncoZMNBIz1X0nL0ra9Pyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AsYxu0Sh5pCcZiWB8qUIvzHew7n4L6NFXcUxh0rOOdbXpfApvkIwW4wD8qWfhDb0ogXAtl5KssMgkGfaa36+3jx1PybD85FK6y2obN7kuriE7z/0fhM/KiHAcg2SjEIYyQk1YAH0AVhZy5mDsyPO4dShpDV55TTKlB5O4dgVyWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5j0dzgf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5j0dzgf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7F11F000E9;
	Wed, 19 Aug 2026 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787144314;
	bh=P5IaIXDL/x6xX6snl1IHHidHxpE5mixAobpShtkyOrE=;
	h=Date:From:To:Cc:Subject;
	b=Z5j0dzgfjhztLFxs62y1kvelLgqRaZwyH2Syk84mCmeB+ChpYRzGqqRJy96ERc8y1
	 mm4dgNCaAe0psve3/PB1S70Shw87lBBGFvT7sgtXUXzewq132z6O5L2ShgLlRGIIUF
	 xFX5QDd0Mqe+rdZkwjfHJtQWYADVGHhpDjrQ57dh/BLw6XN3PLqU/ysM9mH35JUF6M
	 1Eop5o113K7weSSGabbPGBbzrj48FhV6z1nzcmXBp7WFCtodGixpaB63hUFMaP+9SB
	 jEBZXuejhySG2obrJSzfmnydNLzTJSYW3NZtz6HvwuIXnvUBrct+e3Hm5wke43wtWb
	 kWeaRai4TSVSw==
Date: Wed, 19 Aug 2026 13:58:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 19
Message-ID: <aoWodvxVk6dIyRhp@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7zuj7y651cVJlQzs"
Content-Disposition: inline


--7zuj7y651cVJlQzs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260818:

The block tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 12653
 10802 files changed, 769521 insertions(+), 234794 deletions(-)

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

--7zuj7y651cVJlQzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqFqHYACgkQJNaLcl1U
h9BoRQf/Vj158TJlrzW8+mLZDx5pm1QDSF9qHqlGte9qkUueb4BEG8XOwbskwsdv
1TOWXjRmztLYIlPQmI98S3yBiJ87PtosmalqI2oZKPrSf9ap+CpEm+9/8a8Y/8CN
VVsofy1cLy76XSfPDpbJSCywueUCKJDRqp78PQpRjQBkk403H6XWj33mLua04UR8
IT2h4kUurTepif1Eqw+ai1tBWwbKnnPw9ejk8NhmhcnzzUNK8uOdMMy+34gtYFhM
a8swJZxehfGuHnH/sRO33ArfMa723bUWqOFAIjIZWHpj+3Os6YSQFq9uPFfRkXys
Kb3cuKBa8aEawSF91SW/SWV6afpwDA==
=uPH+
-----END PGP SIGNATURE-----

--7zuj7y651cVJlQzs--
