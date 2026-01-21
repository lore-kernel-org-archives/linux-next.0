Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629613793C9;
	Wed, 21 Jan 2026 17:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015970; cv=none; b=jB2FyB+xrx0Ermxta2Mld8n9o7WdDa3xHzfivHLBxetPUPdsl24pDek+OTSrEZUO6gbEMujguAhRgUorlHdklNZAZvaDFAG53qbo59MR/baiFWfi8VsWNQyJP2bpyc2FdSxnH/ibOiZEdh+++8DmsHOGyOGs+D/GT+ddeLJ1yGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015970; c=relaxed/simple;
	bh=lmxGtzkAb+eJz10izmPS+uFxqDIbEK6blEV7Z3pKp2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7FyDUktYhAWIq5e5E7uAeaW+MtM0+J8+Cn3Av2gQPY3i/tOgkfgjII6K9sqKEowcZaKm1eYzzlSEElKq5IwjJEc185hhif0MqfOUXgvbf/yzrQCiZsJ90V/tYPuOLCQuPT2n4I/IBZT+JsR2Bu1ddB68DLqV0miYD+A3g06DDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkkxEnIX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkkxEnIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A04C4CEF1;
	Wed, 21 Jan 2026 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769015969;
	bh=lmxGtzkAb+eJz10izmPS+uFxqDIbEK6blEV7Z3pKp2s=;
	h=Date:From:To:Cc:Subject:From;
	b=kkkxEnIXR7y0Ih/KnqRG60sVjUfw3+vvT4vpH6JDLGSn0601G0ph7if4+h5YgkcVs
	 0sEIQc8gDSVEB4nW64pYzKW3OJDDDjp5LFK+sybtfR5GMteB7FLgd1ZgQOqRUhuksS
	 QhcSJouThtyISn3X2PG61q8DYPVZwXkVL0WNgRZGDqJuGQ/+oYX89V1Ay7iM/qttc2
	 MgErO0U0aL2I3IXdqgk27ggB8R2rN5ETyaag0Ayzg/V3J1sSKOVFMbKiTG2awHpz1U
	 BQGxXvSLWhxnBZiIE9Y6lWmhyRVLOSJPlk1l5a69MUfM1GJcInjFcunOgbygSybj6r
	 N7mLu/MAnI7Rg==
Date: Wed, 21 Jan 2026 17:19:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 21
Message-ID: <aXEKnsJME7nGdABv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260120:

The risc-v tree gained a conflict with the mm-stable tree.

The pci tree gained a conflict with Linus' tree.

The iommu lost it's build failure.

The char-misc tree gained a build failure due to an interaction with the
net-next tree for which I applied a fixup.

The slab tree gained a conflict with the slab-fixes tree.

The kthread tree gained a conflict with the risc-v tree.

The drm-rust tree gained a conflict with the drm-misc tree.

The drm-rust build failure was replaced with a new one.

Non-merge commits (relative to Linus' tree): 7986
 7839 files changed, 457508 insertions(+), 157887 deletions(-)

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
