Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D9A1DDC2B;
	Thu, 11 Jun 2026 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781188397; cv=none; b=b2/qEoEDV87M6bcPZ9aYatG0jxW9CEa2uzCP7/JwTVEtoinHxWIfENd0D6WUozVQgWiprxYQiSIIFDhl/NSnCaRj7qt2mkFP3ACHeJWU47iPNYJHplrMZ5eV/rzsgR6PbxQrqxrHsZ8pbJo8hZjLJk0P19Wr6mWlCTQ+RCRwUUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781188397; c=relaxed/simple;
	bh=cauElteqHWydy8YXldOF4Kc1Tvdl3hSzNgimD+PkpiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=laRv2v8XqLLEsYu923VWFVQWfkgeC6R0pDa3IoFFC1CpQ+AfvSO2UzFBoM3FtCbuJ5B9kKlYsWKF1U5nARhEYASLeu185Hps5an+t/gq+ijdDm3lelvzI1Wj3CpyxlY6nMtC+M0M3qmXgEmtdrRPTsSLFXB5b4GorEGOzrA/St0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3b0vInC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3b0vInC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6171F1F00893;
	Thu, 11 Jun 2026 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781188395;
	bh=rU6qahIQRnBTn8CB7Ay/SA7zoQ6eLSFrWxTr59GJm0o=;
	h=Date:From:To:Cc:Subject;
	b=S3b0vInCS90YyFB+s5Nyftjev4GmGz9FQYzsKEm0vNpyqxm5nbzIF6Jqm7mMPnPwN
	 /wIbCt4lVCF5O/IdBFVLhZPUPT6MFDaPGfEUr76Wy31BfqZzwD++H1h/GzKWA/oljK
	 QNvU41lMbzLsALQ1+NtkZoFcxKenXHczojofhfjlFODAy2OvOFlM0xJpX/DaSt7l32
	 8s6E25UqVh07UTHq6UjxMElJtwCk7RH7pIv5ujzco98V6zCTCAYSy9mVUNt0NnQZoK
	 oGy9WrqxD1aeJkp3wR04w9HSt66Unyuzxa3OQAsSwehZtEueBizgVBdTPZ2020yKM0
	 5dOzs9z8HSIzA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BF17A1AC56C6; Thu, 11 Jun 2026 15:33:12 +0100 (BST)
Date: Thu, 11 Jun 2026 15:33:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 11
Message-ID: <airHKHVILKSiKTVM@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qSJcFoiOFujaL8PW"
Content-Disposition: inline


--qSJcFoiOFujaL8PW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260610:

The vfs-brauner tree acquired a conflict with the ext4 tree.

The hwmon-staging tree lost it's build failure.

The net-next tree acquired a conflict with the net tree.

The ipvs-next tree acquired a conflict with the origin tree.

The drm tree acquired a conflict with the drm-misc-fixes tree.

Non-merge commits (relative to Linus' tree): 12101
 13030 files changed, 799506 insertions(+), 243839 deletions(-)

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

--qSJcFoiOFujaL8PW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoqxycACgkQJNaLcl1U
h9BwZQf8DukO393OSYIlWQN2l4HpDmLJjhvhMlXNcKDIZt4UXBcWSrXAr3B4R7xa
1UKujc2+BXwNeUi0LxVgv1bKEITVKgBXQm8G7FkgNd8GAJq/PnbhIEuNnDK8kqhl
2Xqw4+FKOpmqaL46clTAg+JB53HP8N0E3HhQMIYVoliD+nbbniOo4IjNsW7/igPB
DGvyDIoAONz2Hr45kE8Bk2KLXC1L89GjbNQSiP1mnQlEEcFAS2ugwE0UfDrd2cxg
qVDeDcAZDmWO6YUIEbR1GWteFKjiyjQo51R7otEtQ9riHbd5a8vezm5zhXIYCdKC
iKgguUHqxJt7nJHfCPE2UiaPy95eHQ==
=GadJ
-----END PGP SIGNATURE-----

--qSJcFoiOFujaL8PW--
