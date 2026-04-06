Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0BB3093DD;
	Mon,  6 Apr 2026 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488758; cv=none; b=EP4yzutbol6Hm/lLy0x5VpB13ecbKnLQv0IH5xfvpGjy2guhCdIn5Yo5YoP1KA9Xng056nLS2nYqmwiTsV5ZKLeUOhm3Q1MsKwKMkchIuLscGW6OnelmYb5g8AJmMNaw3h+qbG/vmX/F5Yy7vjFJECVT67lTLa4phpVUqAeHgiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488758; c=relaxed/simple;
	bh=PM80SLfOB4R0cFCpn1ZCbPxDTO79q25Wo+l6EeSHZKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LhIVLCl81qicXQ+61YvmBVpBXy2xnUnJ6zmx3kPVT5cTWz3/ckxuBOJMY6U7VR8Jtbhuz0XVILf8lIqNOcHzBA3kIBRamiXlY/9cV4m9mslbtCPS+VqMBcAzOx8ZohMM1pgZDwykg11SCxqq4ad4c3g2mwcMWI0KAzCN7DjAgaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbB2uuYY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbB2uuYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E97C4CEF7;
	Mon,  6 Apr 2026 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488758;
	bh=PM80SLfOB4R0cFCpn1ZCbPxDTO79q25Wo+l6EeSHZKA=;
	h=Date:From:To:Cc:Subject:From;
	b=qbB2uuYYXr+ZuLE7Y+I749mZ1mn/WK0PqnhPF6aFIiYrDWnFaEpk/EgkWjY8ba8FV
	 PLRmhKhe0SgRvea/dxivmRPCgT6pCsDPqf0wno3UU+T9Wiw6WN+Vprtqc/5bHWkb70
	 dXU6mAUm/YCMhMXQQn52AsHgCbQ4XBsAUVpX87oOF65mVLr81rMoaNOvRp+aap6Kz4
	 txSK2vayUJTNLGduFpjsbvYw64GfCGe3DT0NmpJ/QOs2RojZRMs/mL10xTK9ffTlLZ
	 fNTcqnNVRF8P8zUvMwauPUYTmWkD4SEMBhytm32GmiJnmQaQgUoZBDXcUzeZzh7Mjs
	 j5UXh3m1bkQQw==
Date: Mon, 6 Apr 2026 16:19:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 6
Message-ID: <adPO8uGX6H3A5TeR@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PGYL41Cv9eOd5VG8"
Content-Disposition: inline


--PGYL41Cv9eOd5VG8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260403:

The rust tree acquired multiple conflicts with the origin tree.

The tegra tree acquired a conflict with the arm-soc tree.

The fs-next tree acquired a conflict with the mm-nonmm-unstable tree.

The jc_docs tree acquired a conflict with the rust tree.

The net-next tree acquired a conflict with the net tree.

The drm tree acquired a conflict with the rust tree.

The security tree acquired a conflict with the vfs-brauner tree.

The ipmi lost it's build failure.

Non-merge commits (relative to Linus' tree): 11181
 10381 files changed, 612553 insertions(+), 205276 deletions(-)

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

I am currently merging 414 trees (counting Linus' and 125 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--PGYL41Cv9eOd5VG8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnTzvIACgkQJNaLcl1U
h9CtHAf9GQwHeIwZ4YgJ8VEkDP3owvCKli61AoRHcZVArJtBeUI5B2Ebzw8RmETv
yHUXI1K2A8ZUrVDwVHc/ykHdCWLnOWJTLFgHPB9Q7H2Swirgmb6HgH00wp0DVylg
k4iEoX8XRc72pitGssUhY1QCCbTc9L2noaA8hNHr63oV4HjBc6PIq+sr072gSj7z
Mq+ODQNp1sK1YephJOe2V1Gnw+zjvMv6LGfH+8HIlTZe3JRsLwjnRM06v+L/feaY
HX4H7EqTDAM6qN0di9Qy0JcuD9IbPofvFlv50GNisJghp3csiOkNWq/VqwwMcDRw
Qt0/hpdLcyesHuzSXRfZEoSMbowO3w==
=zHe+
-----END PGP SIGNATURE-----

--PGYL41Cv9eOd5VG8--
