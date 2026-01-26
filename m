Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E20F2E54DE;
	Mon, 26 Jan 2026 23:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769471813; cv=none; b=GWxznWsjdi8jiJzdsJky8F7RMvOIVN7xw58sCDotQwWMc2QX/1s1xsr31s1bVl62hudomy7rZaK+DBwxQlB8i13PgKp5dKnkoovreOtMU57amh/yw3/N+5XpOJT/FQRP6Yes/ITdCA50WZ7kHQzrzCRBMnYEFoHaqBXoV5nMdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769471813; c=relaxed/simple;
	bh=AT/vZyIz6F3+0iVc0cM887qzriHFou+H4+2RTfbXVe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k5ZPFDZJlwplYJcVN0hcpjbq8zgVx2BlX5Jmx9Z/ENA3LhITWolTR5vVQHH3t8XdEgvuJoTVcw0oFM6obkHUk9FL8Vsxpl2VGXbPJWMby5tTniUjHBWgZ+Ap7mjZxL/sTs21UyzyTv3p/YSC+3zSRcvwy7OW0ghjBVHMazt6rCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0s258rl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0s258rl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B1DC116C6;
	Mon, 26 Jan 2026 23:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769471813;
	bh=AT/vZyIz6F3+0iVc0cM887qzriHFou+H4+2RTfbXVe0=;
	h=Date:From:To:Cc:Subject:From;
	b=Y0s258rlVHvVat4WLV9WEylHc55Ryul9rrS0f7C7aHRE/oyoSANJOAtT3R9OQDXSl
	 h2nD48vKVPKu/okAqheu/qq+VWccGJ6U2nFXbUFfOcnM1U772yaMC+DzHwPEuRmJnb
	 kwLa3w0aclScaNKaQhiy6kZITXg+T4DW53YIXiq2UQ4fcmccTf2WCn3GCtkmzar/ED
	 LuovBcV5cKjuIcSgJbbAu7354CvJZK29mETYt85GT0f3Rq/BjHvcUZPvQc5Z+aS07S
	 rV1pXGexy0AJPyi5ApOFIM6louNW6XTsFnTyBHIpzQpjbJSiSWXRQl+8woj2sxLI/i
	 HE8tKQlbWGtOA==
Date: Mon, 26 Jan 2026 23:56:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 26
Message-ID: <aXf_QXYQW59bMKbG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ZQhiJYw0bIZWCL2"
Content-Disposition: inline


--6ZQhiJYw0bIZWCL2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260123:

The gfs2 tree gained a conflict with Linus' tree.

The ntfs3 tree gained a build failure due to an interaction with Linus'
tree for which I applied a fixup.

The arm64 tree gained a conflict with Linus' tree.

The mm-unstable tree gained a conflict with the fs-next tree.

The jc_docs tree gained a conflcit with the mm-nomm-stable tree.

The jc_docs tree gained a conflcit with the kbuild tree.

The jc_docs tree gained a conflict with Linus' tree.

The thermal tree gained a conflict with the pm tree.

The net-next tree gained a build failure, I used the version from
20260123.

The drm-next tree gained a conflict with the mm-unstable tree.

The block lost it's build failure.

The mailbox tree gained a conflict with the qcom tree.

The kvm-x86 tree gained a conflict with the kvm-arm tree.

The driver-core gained a conflict with the jc_docs tree.

The scsi tree gained a conflict with the libata tree.

The kselftest tree gained a conflict with the block tree.

The cxl tree gained a conflict with the tip tree.

One of the mm trees gained a build failure for which I reverted a
commit.

Non-merge commits (relative to Linus' tree): 8791
 8687 files changed, 509076 insertions(+), 178448 deletions(-)

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
an arm64 build of various kselftests and a native build of tools/perf.
After the final fixups (if any), I do an x86_64 modules_install followed
by builds for x86_64 allnoconfig, arm64 allyesconfig, powerpc
allnoconfig (32 and 64 bit), ppc44x_defconfig and pseries_le_defconfig
and i386, s390, sparc and sparc64 defconfig and htmldocs. And finally, a
simple boot test of the powerpc pseries_le_defconfig kernel in qemu
(with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 404 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--6ZQhiJYw0bIZWCL2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3/0EACgkQJNaLcl1U
h9DbHwf9FRGZZpSzLra2bPivzO2tElKL+MsttnB+VB7W5GLrPFIy91AOCmOFnTeq
qzs6bdHITV4xgIZYp/cvHhQJZM8sFZQxKBru5NaDxlETCU4XH9yKw/7OGBhrKec3
8DAoBVv4o5j1PA4VUKA2qCB9khMqIkTlugDJwqbRZ1yy4t0KA3BSDC0X6E6LjrSj
NKVgAUWbjYzhPxrjoiLGcet0u/rea6wb2SmcS2Ou0xCwqV/mTDwWmdz8PlBZnIjO
PbUriWhrg9HAxQr6ZSmv88e0T8/pHkQPpOtj5m1DIJjkJ3hifFLc9OKW6EiaYZ8U
BD3HV7ri1YkvUqpV12fpvUJwhcInfA==
=DS/G
-----END PGP SIGNATURE-----

--6ZQhiJYw0bIZWCL2--
