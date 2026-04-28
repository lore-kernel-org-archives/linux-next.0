Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156542EECB;
	Tue, 28 Apr 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380510; cv=none; b=j5S+NOMOJCMXpJP6+KSkmdbi9VqcnJgKYqfZAmXEvPPoOic1aK5/F7eDg7HW3DgsuRVaGQiKkjRZIDwIATFwqyuGhfuKS+0KV3ZZRtDkIDJbu+w1C/enzM5DVeawh8JTXbBfY4+3YUp6umEyB8ryA4ZB57Y3DA35JiyAjUQlxU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380510; c=relaxed/simple;
	bh=PI8Ts0ZQtGkrONsGhkEbOUrYbXQ5IJvC8kVsBkj/Fgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V5U7nboqMPRygnskEMQC/w2Vyvt27j4hOYIqrXv8c+1Xi2IzifDv2E1vORGupZLuaKBJ4kzvMON65RqHQ9ogi1rS5dE9/u/cOxv/kkzjrgf8LnT7DWALkvxOwQ2/jYXPYQav4U7ssdcju58MRyZF/GPtPHvMLc74By+vxxcv8+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgWoiTg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgWoiTg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B607C2BCB5;
	Tue, 28 Apr 2026 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777380509;
	bh=PI8Ts0ZQtGkrONsGhkEbOUrYbXQ5IJvC8kVsBkj/Fgo=;
	h=From:To:Cc:Subject:Date:From;
	b=QgWoiTg9FnQ6nc00ElU1q4ZOt2vMYabb5mPX9cmhe/RRcm7GpTWcfnHaKVZX8TjXH
	 Wywf1t2hc+42I9Dq5xiGyXHBMRMFo+6REPevmhmQjyJcwdMofvs7Xx6gT278APAOdB
	 D2v3Il7Nr2X++l32Ng2zDEolwkTKaES+RWsMsZgCAdsix5Kkg+liLZHvVNYzvUuDox
	 MywB9DgVkuTm4IaDMayF8bLMf5S0T4Z2WxK/B7RAcbQaybnNz/BOjGitS2ojI52UH8
	 sOFwl5qZENgZSTBncj54McKbEkyVfRO74yGPVobT07qR/m57/49qnCj/LfnBTnwh9z
	 JjYiqfqpPOdyA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 28
Date: Tue, 28 Apr 2026 14:48:20 +0200
Message-ID: <20260428124827.3910282-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Changes since 20260427:

The bpf-next build failure was partially resolved, but linux-next is
still carrying a patch to fix up another issue.

The efi-fixes tree added a few commits that caused build failures. I
reported them and added fixes for them in linux-next in the meantime.

The arm64 allyesconfig build failure for drm/amd/amdgpu still exists.

Non-merge commits (relative to Linus' tree): 1466
 1808 files changed, 120786 insertions(+), 21960 deletions(-)

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
