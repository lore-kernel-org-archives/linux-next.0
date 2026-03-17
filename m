Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9AB377EDD;
	Tue, 17 Mar 2026 17:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766993; cv=none; b=W54HVxASo9Nb/aAv0fy76Z/GzPD10mQa55qQ2dsVEZkJtkVB9cdvyvR2SdVkbYd7Zjsx7DtgxAnITKeHU46KpaFvb83bPl25tStWy6na4X4inbW6jIHmita7rwF68jn+eC4qpfVRxqDuqTPXKYt7mMqkVu2vZZA7V+NeYLW90qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766993; c=relaxed/simple;
	bh=rnMA0nvQSKdwlbxWhkuYuzvNG04iKWjYuWNhTaio1Is=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jt0QeOp+31YWZ6IO5SAzEPqyOYz+kNM6B1c3MrbZ/Ig6OCpMExKvcf4fDQKQLZrtRccGpiaS9t5DwTbIQLxbbz+Wfz176fn/zabNGbvr6ZRfYVwhGT422zuQuaOfPXNi9wF4iGNZq7bmjv2qn0v96+xEwnFQSnvcVIIcTqftJ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwZUeBlJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwZUeBlJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCD6C4CEF7;
	Tue, 17 Mar 2026 17:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773766993;
	bh=rnMA0nvQSKdwlbxWhkuYuzvNG04iKWjYuWNhTaio1Is=;
	h=Date:From:To:Cc:Subject:From;
	b=uwZUeBlJdJbd/kWr+pX9QVRFsQ3c4cxYYcbLaZpZqLCw7o4nGAjLaslUTLY/yVj0V
	 lERhtEkORBa+rjTiwy0uO+k52+8jzKtzBajWoxg/uramyZNx0+D3c3KhXYxsCVBV2a
	 lp5DiejWABa70oZjAWpeq501I1v+bEGfcgJdaYIbXhoaLltXysxOLHF1D4ZLYYbLOn
	 MLffkkyGPX+q/pcOv9lgJxsHryS27YbSpMpcPRa/Im/Z3D5nEjrhRCZLjdWs2ZFaEd
	 6YU34Ov78bQ7I749a2L/MXAvdzPRNFr14215/rZDAMYbLWzIXdM2ghC+r80E9edKNP
	 I/LZa46K1/oyw==
Date: Tue, 17 Mar 2026 17:03:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 17
Message-ID: <abmJTaRwAZdMqpQy@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MWbRRSCMqBacs8yw"
Content-Disposition: inline


--MWbRRSCMqBacs8yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260316:

The btrfs tree acquired multiple conflicts with the btrfs-fixes tree.

The mm-unstable acquired a KUnit failure, I used the tree from
next-20260316 instead.

The kbuild lost it's build failure.

The mlx5-next tree acquired a conflict with the rdma tree.

The mtd lost it's build failure.

The drm-intel lost it's build failure.

The devicetree tree acquired a conflict with the qcom tree.

The driver-core tree acquired a conflict with the devicetree tree.

Non-merge commits (relative to Linus' tree): 6147
 6299 files changed, 426800 insertions(+), 129137 deletions(-)

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

--MWbRRSCMqBacs8yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5iUwACgkQJNaLcl1U
h9CF/wf/Zrk7XTK+1RZ9tNtFlovqQftlIrJ32W+pObgZnB70VllHiQcH61VWAfmh
x7HeYxAaYGpW2DoY0SAoDRJvk57a6XYmKHv1HliVlU9WbukrtHD8aYSAHM4o5Cqz
X/e3uVn+1UQjPBFtYd1Mb4yLNLPKsihmGePQXf0LcRn3iI6pwCgGORtVprRQxf+e
E4DzYzazJG7ucC+75SO4EWj5q5FE9cbR8euzYeZ+5D8x5jclloTjL5YaS37+DhPn
uuOGOrB1E35b933KPCznhEPrgDHhjKcRlavQrZH+rAsVk8GQJVHPBAkQa8Tjlj51
/xco6e+e0Zf6SNRzO6RVKTAK/nW6PA==
=d/7y
-----END PGP SIGNATURE-----

--MWbRRSCMqBacs8yw--
