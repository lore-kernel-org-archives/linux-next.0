Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F707313E18;
	Mon, 16 Mar 2026 19:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687781; cv=none; b=BKDCEWKXWUSBCfzHfFftPqI8mzf4anLm/r3b9tBeJ9fP8KyyGcDb55x1I5NQsMKhPtG50dgBjcwArmrrv5wppu3Eu693RXplZSrJT/J1gxda75IxpxiGbTY+L0u7BCbU6F2mB+ZJ6hQaxBCciwPYX2nMN1tnR1S5jOZQqbtppG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687781; c=relaxed/simple;
	bh=u/6tgDFGzxP+xMF2PTO2Q4WK+p1ipuiYVd4Ia8cJ/QA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fA7dQlN/D6K857iD4r4TF8mdh0IpL4IoYjmdibDzQCgRly4/h1FbqIwqUd5cIs6cI50mVEkUP26o5JrvS3nASdHTTkWJcAlB++LMQtn+/wVBjQvEnHuC8S7UE48U+biFlnrafyp5R/hy2wl/9NjDubeel1mxFYOgkuVh5roeJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2KXydcZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2KXydcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A233AC19421;
	Mon, 16 Mar 2026 19:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773687781;
	bh=u/6tgDFGzxP+xMF2PTO2Q4WK+p1ipuiYVd4Ia8cJ/QA=;
	h=Date:From:To:Cc:Subject:From;
	b=Y2KXydcZ5zwzdKZT/0LqAii1lDrWkeWkpz/Eq4fF/gT/VWwUllwF9QUoRu0LHDvNl
	 RJyXSfZGs40X0o8/LTwg5Ol564Yfk38KC+4emn5jGhy+87upSzXYf+b1sYJ+tWHV80
	 Q1xHJiShU/ZkYsqZ10BKJ7HsYA3UeqxkqVBwx0saZaERd7mYsVgYnIw6+LGeRsJytx
	 OVndiIxlpb0ZP1HgxU2K0eMByNk6WeJLmMCsg8Nygr510cYEQg8jE26c3UvrD/pbrc
	 /ozpGKw1iGHHWKnLwJXv/wQK6nW4ganNqhMNfvvoH5cplbUOQ38w69Hw9qY43RzbPG
	 N0ydqxn66SvxA==
Date: Mon, 16 Mar 2026 19:02:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 16
Message-ID: <abhT4QLK9ta8459G@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0/y1Y1ITQatstcpN"
Content-Disposition: inline


--0/y1Y1ITQatstcpN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260313:

The drbd tree was added.

The kbuild tree acquired a build failure, I used the version from
next-20260313 instead.

The net-next tree acquired a conflict with the net tree.

The bluetooth tree acquired a conflict with the net tree.

The drm-intel tree acquired a build failure due to the breakage that has
been affecting the drm-xe tree propagating around for which I
reluctantly applied a revert.

The drm-xe lost it's build failure.

Non-merge commits (relative to Linus' tree): 5901
 6084 files changed, 417387 insertions(+), 125394 deletions(-)

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

I am currently merging 412 trees (counting Linus' and 123 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--0/y1Y1ITQatstcpN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4U+AACgkQJNaLcl1U
h9Cn3gf/Un+K+eNPoZWf+XhUykQXYp11+WLV05wKxRcJgA/ffMVxt/493MRDqGKq
PUxw2wLoplpiAhPaGZn8OnkimrCKciQPrPtIF7Ia/rvpuPn9QmsCBnfuM44OC0sq
4XfFi+JFqvHHU1QUpuTu2pyRFAVFja3A4AaIFBhCMFWkFSWblApfltxEQPznunID
838XyuQDQiBx6TszmykC0RltV7bw6X0ycfzZplCb/yUY9s57AHKmyv8oe01TGVI2
nO2H3ZXtcjn8O4hKDXKZVVKcXM0DaoSdgYW34wp5L69v1nBiVHErJPEtDmwQvaTu
ze2KyrXFwK1gVl7h2X1neJ2ICgwBSg==
=hmHl
-----END PGP SIGNATURE-----

--0/y1Y1ITQatstcpN--
