Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB3C2580EE;
	Tue,  5 May 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986245; cv=none; b=h+P6OSANEhKOQDYuYjvogL8FWoplTMiNdYIPW7FzYJXVV3m4dkroMWJG5WWM+Wl9J7ThDT4AFGmL/3ozRXgw8v3NKUtrLYIPtDPmE/AONQoYgC3S25rA6lWdZzT8qLAlHE82BcqROdVjJmR8zRH9QvlwQ4QHNpqgnIdWQYRsvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986245; c=relaxed/simple;
	bh=pVIQg5EmfIeQ6RdUrvqowszuNCc2b2K36KrwkEDFBUg=;
	h=Date:Message-ID:From:To:Cc:Subject; b=dt0lR8Jh2evw+j5sdWeb78mIZAq81dchXxI4Amo9xoSzbPz8X8YH4c5/t2xR8hwoxB6l5p69njxVfdSMiL4bUNEc7KVn3nvXsSDzBFirI/k5ABtVhBdOB6OqsxNHxf9jTVyDGfyLiFvsU1IKbTQtprBGkxdV9MwsjL+aCCs0Mbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8HhnD2B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8HhnD2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9988AC2BCB4;
	Tue,  5 May 2026 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777986245;
	bh=pVIQg5EmfIeQ6RdUrvqowszuNCc2b2K36KrwkEDFBUg=;
	h=Date:From:To:Cc:Subject:From;
	b=k8HhnD2B0XOWLZdYaplT4zMkRdIrRPrUpfJp6WQKX7aWvszwaAM2b1mXzMJ1RfQJH
	 AeKBYiuc7sEqqXVjRUpm/CiLMIsENdsstDa6evjKoIYDsO2RxEGKFI6eykGGgTy1+4
	 48rLFWTmbc+WWzStI5TneK/kZTzCNXZEVQAJYEkR3Zse1yWJ7FZYY5v+L6VvwwBWdX
	 JVHaM8b+AmsbHiTHD6nFBYQhi++zgJ/glUgYHw3RKGhT/poGf5Kd+v8iedQZ8VR1pT
	 TMxfUMYmHMDVCHFliAWNAoHYLBg5FjDBp+rEcoq5FaFs+rUcS90T1086kVHe6ECcB/
	 2y4MCLozLCFNw==
Date: Tue, 05 May 2026 15:04:02 +0200
Message-ID: <e76451b971852e9e0f602af00602236a@kernel.org>>
From: Thierry Reding <thierry.reding@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 5
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Changes since 20260504:

  The net-next tree acquired a conflict with the net tree.

Non-merge commits (relative to Linus' tree): 2518
 2816 files changed, 150320 insertions(+), 41285 deletions(-)

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
