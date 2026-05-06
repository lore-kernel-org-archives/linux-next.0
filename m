Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764C93F23DF;
	Wed,  6 May 2026 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075624; cv=none; b=jEiCywvtQJ3IxmoIs+jCcH/dQyqrkR8CAy2M1yhkG+UfODVZHNd45KuZrJfN/JaIFimBz4u2WICC0Y4DXB06rHQWXlTlzgwdXvwNtyfoCyTQceHPwDrFhWFRLUnE+DUHboQ5gsVf+KpUzHS5Im1ZwaPFV+XL7Gfr8INI9DJRaDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075624; c=relaxed/simple;
	bh=WQu036m4wHvAvRXjcU/KjgENGzZ6p6HMGvdTr8UHnaA=;
	h=Date:Message-ID:From:To:Cc:Subject; b=MSfXMEtzbwzykgkEquK50o1qbLv6pc4K7w+ccbyF2qFna3N9/zSQWCkHSB3sG4UgjRDbaT9Fd+rVor40VndwaJpRNqoHK2G1+MB9I1kfWOhT1xWdrycs97X+Mf7kOV+dIkIRIBq7oPvKKmc44jzT8++wKOPsZk7HtfjrXSD0/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqikSPi/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqikSPi/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EAAC2BCB0;
	Wed,  6 May 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778075624;
	bh=WQu036m4wHvAvRXjcU/KjgENGzZ6p6HMGvdTr8UHnaA=;
	h=Date:From:To:Cc:Subject:From;
	b=JqikSPi/8VH/OX+Oua34r63ziuZbZ3ANRbqeo+SUNk8N5BkvcTBelH7cD1niDhm3f
	 Fpdqa6oMfaigbv5b7nUf7HUwh+uGYKO6XX3ZZpWYWsQf58G+k2txOusByv+6VK/4ZV
	 s0LUN4w8kdfl7/iytXqgxBNqMAvUi8eFNU9Sb21oOeTmQzfueOICfwFAC+bmQMWW0v
	 gv2p/3LhO7Mxh+t2ZWuMqa/m/STQSxeALnWqiRb63TlKhc6V5jKQqRcWZSYkJUGnlX
	 sQR0GQCMWLwzwKVSZe8XBiTn+ZcS9L2grwDagYZpny7A8/B6mV2f+H7F3jiB56BpcF
	 B9v6kG0GEzQ9g==
Date: Wed, 06 May 2026 15:53:42 +0200
Message-ID: <fd4ab7e683f452fab1668af47d794509@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 6
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Changes since 20260505:

  There were a few merge conflicts between the various DRM trees, but
  they are all resolved between themselves, so they were trivial to fix
  up.

  The cix tree acquired a conflict with the pinctrl tree.

Non-merge commits (relative to Linus' tree): 3212
 3849 files changed, 206714 insertions(+), 56397 deletions(-)

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
