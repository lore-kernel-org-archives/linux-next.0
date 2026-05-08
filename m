Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C23E0252;
	Fri,  8 May 2026 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247023; cv=none; b=CfXZLmSWiqQBT3CNr/kAIDTjK3dMmwHdh+ZrsJsnRf7SUf9khF11e9kWpp53Rzlt1BV68xxOaNa+jKdyEZLoavhc9aYRXyf+p6a06nuUL8IFLbrxyK0hDQp6qKLgurTF0T3hJclL7deOQyPcIzdcqO4qG6UlLir8o6lAc8tl70U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247023; c=relaxed/simple;
	bh=t0c1yWFdY3un9bC5oRjHRN0CM653skc24dZ4lJH1oeQ=;
	h=Date:Message-ID:From:To:Cc:Subject; b=gR2gbFZOpmcV3DH8/s8Dgi86ULuLsBZMmgcZM0TSs2iJ5pEPC8UdHgRsueR5iSG100d3pUiG0xhL114OUxOz9ytsEU2LRzzpkn4kQBZQ3LY7vYglAnR2yNMLLZaH7fJHVbwfVN7Cibw/u5yeAwhiF0KckPcTS8sTQBvbwMrG79g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehfsXsnh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehfsXsnh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D575C2BCB8;
	Fri,  8 May 2026 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778247022;
	bh=t0c1yWFdY3un9bC5oRjHRN0CM653skc24dZ4lJH1oeQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ehfsXsnhAf7GC9K0Sw4qfdEYODn2TyeZfagJeY5BY1RlSRSVMcGg+1EOpjtrGBbI1
	 kvCl+FMKD74+wnRuwKSvhGuJ1WPT1O0C3YusU115UB1tOYDcK5Z76Hu2I9MaZGU0XF
	 imx9Cbnlvj6BZt/u6yKxH6A82QYG1ZiZoZ20npQiVnvhDotBCT4UJpCbeJKm0a9oHh
	 K/yAzBQJJhXzucWir2ykWbHEFmxwx1xgNQlXYfDQqwQbvzXA1Ipz2x/PMyUggM49TB
	 QNCbxd8apkG4FkFsMLP9LR+3oYVv48QB/my6WIFNxILDOh74/sMJu69FlNbg3kfaL+
	 AvlOfqQ8crpCQ==
Date: Fri, 08 May 2026 15:30:20 +0200
Message-ID: <17844ed25938ca416f1d8c88a4aa7441@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 8
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

I will be on holiday for a week starting Monday, and I don't plan on
creating a linux-next tree during that time.

Changes since 20260507:

  The cix tree acquired a conflict with the arm-soc tree.

  The stm32 tree acquired a conflict with the arm-soc tree.

  The hwmon-staging tree acquired a conflict with the hwmon-fixes tree.

Non-merge commits (relative to Linus' tree): 3529
 4221 files changed, 239791 insertions(+), 83377 deletions(-)

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

I am currently merging 422 trees (counting Linus' and 129 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.
