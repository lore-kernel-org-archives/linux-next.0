Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E361371881;
	Thu, 30 Apr 2026 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777548561; cv=none; b=K0rVJVsuzeEz0auy5J4QSBjsIWGOotNaC9OMtb1lnlVDgAGTDdjUM9ENOrWViuBGOZH7YKMSb7IQB+5N4CwfmCS03PXBZ8n7HPNceK1MnXuvVIvo8ByFAynYSIerChR/4j+pIXha+BOJDrZ4DDQX1TwLjiTnygFkFYZs4Nhg7Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777548561; c=relaxed/simple;
	bh=hmJhQZI0R1VKhoEXaxuHFLYmd3d+gCuTstqZCuSy5MY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OSSJunMMYbjmOdNuAuCSOBmpMsknZXm4UlL+UeKyktPr+ul++PZh0rMtk94kwbUfYjSTHflRCcwROy/gk3sbdpR6T4QRL6zljOu4RYp1Lj2ctNplUlt/hvSCLZ090dtDJ1kIIjJ1NqHbs1+cdYjzJsB7c1uT/+iqpr5p/g9e18c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NF99IsSb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NF99IsSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C50C2BCB3;
	Thu, 30 Apr 2026 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777548560;
	bh=hmJhQZI0R1VKhoEXaxuHFLYmd3d+gCuTstqZCuSy5MY=;
	h=From:To:Cc:Subject:Date:From;
	b=NF99IsSbW66hut3sSAlw/ttPIDobhdlNWC5k/RA6dIv8MvW6l5E0e7fvzrO9iDPT3
	 EqCWAOfUjFucWTIPMrTPg1gFUlC+IB6ovDWXwNnWip8t+TImcYQAhcFMkzMbco976+
	 bEMuBgVBD7TlnVTVTVOQlOeORsOkZzKSBmSGPJJ1r1iOCwBbNIVCY43fogdK+87kSD
	 Wn70qIGfqA0sMur19cB4PVZfS07ty/fD/ZScnTh0X7USu9NP/AUzILqS5he/c3tLa2
	 PXZiKKI7cHSibKAQIxi2hearOmd935bpINbzBRmeMXXTcBR8Oi12mwbJm3jMJePg0X
	 zgAINOMyrWDWQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 30
Date: Thu, 30 Apr 2026 13:29:16 +0200
Message-ID: <20260430112918.4100369-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Note that tomorrow is May Day, which is a public holiday for me, so I won't
be releasing a linux-next tree. Things should be back on regular schedule
starting Monday, May 4.

Changes since 20260429:

    The nand tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 1864
 2044 files changed, 130653 insertions(+), 26305 deletions(-)

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

I am currently merging 420 trees (counting Linus' and 128 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.
