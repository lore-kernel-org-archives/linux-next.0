Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1151365A0F;
	Tue, 14 Jul 2026 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026577; cv=none; b=esuiingHaA75uRTOfnzGgu7TgiwL7qq1p1wHdfd+Q3olPn5wF5aypr4nYXOjMd1IevQgqTlcgG2k1De+PnkZ9Zy9RbLWtv0qEJwt4qgO/iCLIcpImo7bvP9PvH8213VxNLk+36V0iPZVrVzBd+WxTaNlBe09j4h6nLUkUdrKH+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026577; c=relaxed/simple;
	bh=Vbp1Dgch6zjlrF6Ss9ntqBPXnJi1rDwEyRBwQpjWs3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tGN+px9Q3ghSByoS31PiVydlooBo5NvNO0sZboY4Oznq6xbMiTRfuqLN47XEfqdbMfT0voHEuxPHBTxee7Ho914CMicc2uh/zeZGn+UWvvoax5LN4PsoMLSOT2LhSN0CRfvPP6+IJD2rcLKqYwcPzgeE2Iq9XDWSkzsmKVr1rUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=og6lsgZE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="og6lsgZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B8D1F000E9;
	Tue, 14 Jul 2026 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784026576;
	bh=sH0eOLXSshPE3cbnac2u7QMGXvNV4bFlgY3/WSDqveI=;
	h=Date:From:To:Cc:Subject;
	b=og6lsgZE1gnAmJarV/zT6OSrCQf0Q4/Aqtz4+v8MXZE2MVoow7+92DogjdySWjXz9
	 DOQ24XZUsTdRcmFvod/oZwPtrK6eJh9+k9EPX9REQ7Bd0W3EmsQHRc6ckHsVSD6vMp
	 8GS4R1oAO1MCtcBRpSm4bFPqLMV+ZielVEYLno97kYIaT2NkpcNSMAgP1S5yVKQcaf
	 haqmvRmZLnUgpQ58WuP2VCpvrd+RVNpnyFP4yMXDuTkMLBnMjnOsNWI1y//xVG/ICA
	 xQNfhU5x2pTm3A/K4Gh6VdMR+Rbkjer3UpUBded+33K2U/mh6PpePL81ofQuJzjUes
	 bwMiAxdaBm3RQ==
Date: Tue, 14 Jul 2026 11:56:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 13
Message-ID: <alYVzZXS-wFnqcWh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0tpoFoSbvAEW/QHn"
Content-Disposition: inline


--0tpoFoSbvAEW/QHn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260710:

The fsl tree lost it's build failure.

The driver-core tree acquired a conflict with the origin tree.

The char-misc tree acquired a conflict with the origin tree.

The sound-asoc tree acquired a build failure which I fixed.

The tty tree acquired a build failure, I used the version from
next-20260710 instead.

The scsi-mkp tree acquired a conflict with the scsi-fixes tree.

The scsi-mkp tree acquired a conflict with the origin tree.

The scsi-mkp tree acquired a build failure in the final build so I
merged the version from next-20260710 instead.

The usb tree also acquired a build failure in the final build,
potentially due to a change in another tree, which I ignored for today.

Non-merge commits (relative to Linus' tree): 5209
 5201 files changed, 210814 insertions(+), 86997 deletions(-)

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

--0tpoFoSbvAEW/QHn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWFcwACgkQJNaLcl1U
h9CQdAf/WIQxWR5EuSpM2x6FeuQqhJ+dK3ZqHbPws1/g/WX80KK9FRaORF06N3QG
1z96AAbLJjhmXWdZkUNndK1mXw0SITi5CI573FAq/PpKcBjvJhUkKuHEE3aGS+UC
tVSQEEWFegyHUTXSHBkrK+wopZ/yiDQoIBwwJZYQtjm75XyMEBkP9gKH4MyUiCe4
JKN/Pv/V9d42fnABqpLir1HQ4PgZiuiJuj6GdZBP61WMbbBvnA4eIciSZozxg2im
RGvPobthnB8sQrgcyu2ueqnPlrL/YXUgmkbkPWKsaGKNUIdxNP/LZUnYxIbPHhYg
Y3dazNFPwnfkk9fIub886mOB5f1Wug==
=0mke
-----END PGP SIGNATURE-----

--0tpoFoSbvAEW/QHn--
