Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C0D459AF1;
	Fri, 31 Jul 2026 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515169; cv=none; b=JMCQj7LDubKWRK4eHXJfb56iJlwNvAytI/qzQsFRBNHtwfuIQ9Vq7VfsxWuoTBuxNIlUcNYoucSbHJ3k8dXpABCFQYaxl1rZSMup/BV8d6v+p5rpXPfaaLt1tGljSKyafLNt7HAGxVIq7fNH9FOC3Fm38UXb7IAaO8FxmAHp4MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515169; c=relaxed/simple;
	bh=gI7QBsvkYqMPleO0F1pGVBsLITDipepsEN6lcu3BCiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I5bNaNfdtzFgE7kR5kMPqRpqWtJ2/8CT/OZ6foCuAa152Rrkat7ZkWBtv9Gv+zPnBCuYzbQVNOIR88Is9W3sOyDCi2SKp+bElkJPuE+jG++u7GTEwDeRidxvRPNRsh059i0Zgp5bwxBcP2TZ9Q8iUE3PZpKk1AHm+bhGflJZPx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqM/RiPC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqM/RiPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671861F00ACA;
	Fri, 31 Jul 2026 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785515166;
	bh=YLIKMlhttnbrhi0lzd/ksMhUQ0UIgDlI+5CnJxKG0hQ=;
	h=Date:From:To:Cc:Subject;
	b=FqM/RiPCNKiXEeQkWzk269iK0AXvh8z7ih8Yx/tNkPxJZDOcLc3zDZXRuMfIl8fCY
	 GBcwfCAfA/2QADw3I8GKPi3x94AZsvtexe6ahmdl9hh8p7zWDYkmY6QeJVlv/G1YFB
	 EpqIJi9hUGG+TfMhoDgT9NksBU87JNtrRLZPH9aEujymYgUaL3dA13By9sgJpVngR/
	 gcmmv13Xw3lHh5q8qMvFjQjQVY6CfHciSHM3fGpIKk2wc0x6Z422x9DPQgLb8+O5Va
	 7HYq1TEKzCZxSaxw8NXa6z7UDIoAKPRC9lZ6cbfntz4iZumMl1MHuTSNWU7XRW5w+D
	 BMgfWFfs/KKIw==
Date: Fri, 31 Jul 2026 17:26:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 31
Message-ID: <amzMmuasKAVRLZyP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vbpllFSmFL5rd0ha"
Content-Disposition: inline


--vbpllFSmFL5rd0ha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260730:

The nfts tree acquired a build failure, I used the version from
next-20260730 instead.

The s390 tree acquired a conflict with the dma-mapping tree.

The drm tree acquired a conflict with the origin tree.

The drm tree acquired a conflict with the drm-fixes tree.

The amdgpu tree acquired a conflict with the drm-fixes tree.

The spi tree acquired a conflict with the qcom tree.

The paulmck tree acquired a conflict with the tip tree.

The paulmck tree acquired a build failure, I used the version from
next-20260730 instead.

The nvmem tree acquired a conflict with the char-misc tree.

The nvmem tree acquired a conflict with the char-misc.current tree.

Non-merge commits (relative to Linus' tree): 10228
 9137 files changed, 469593 insertions(+), 146408 deletions(-)

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

--vbpllFSmFL5rd0ha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpszJoACgkQJNaLcl1U
h9BGdQf7BzLtWuNyeWMBSw14TEmU+ub6jJcf1NCGd73PJKiCObpLxv76CWgEiPBK
msz6tS2sHpM3G2+VgriSU3wBVYHQyEVZPv3kD+ZCN3/MGr+hn8Wq5EmPfa05Z80o
oJUUUieNYKSzKTqHtCWT91GlQ2ufFsMG/+LLZxRzZrYuNfot4i4ZhLk6jbBRTGAp
f2kCbZmzHl7E1q3EjXovmQVH8q9czjdhtU3nPKhN4LCJr23MVzoHZ2FQDJ6Qo0vC
mUUv+T+OdqeO2RcqiI0iQsMHDCsIq+rdNDotNZNjIXYX3HkQT0SK7yX7cBIUEhQX
qqmkwCeAEPukahD/rgcvHQCKr1aCFQ==
=j7ZB
-----END PGP SIGNATURE-----

--vbpllFSmFL5rd0ha--
