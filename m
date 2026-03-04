Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54A30FF1C;
	Wed,  4 Mar 2026 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636724; cv=none; b=lquUO31vi5CjW1QtupskdN1qYXxEZgZsoaYQmfRtB7vnoAp4gbdADu3LnUvTx7QIgdLSGfbSDy5Xmk5hGNUzoVzzR2wNuxGQztmgxu9ffmvZY6R2hhA8ggFw7Q4oqsfmupSxl0BE219uiSqzac+oX8gKcW6HLN6ZDm/ZfppCbRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636724; c=relaxed/simple;
	bh=nWIZmR1ZxjZCOpfmWfKnWtlbdcY9ChVguGbaPWAy8XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fCTM08CO1PUnzOS1zBOiIYZYjrJh4MrnfOJtaE+lwQHQxq9UR/12XvkYyNKS7Q4uJXcO3ZQC8OJvN03z1zhDow+vEo/0ycE3QxrKTJ7GtIYSBCipJxPOZevtXREklX77lu9wJoItiK5eVSf+yVlzCPTYhEUnvf0r8a+t3KgUDUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KihxnbUm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KihxnbUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDC8C4CEF7;
	Wed,  4 Mar 2026 15:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772636724;
	bh=nWIZmR1ZxjZCOpfmWfKnWtlbdcY9ChVguGbaPWAy8XQ=;
	h=Date:From:To:Cc:Subject:From;
	b=KihxnbUmcIWrLsHscVl6oyuosvqyLVakM64+MVoBfLzoiay+jGuVOui7Thm3YKAyR
	 DAp2cERkC+dm1LshdI4IDPNQSx1h0S4zu9eaKZrNrcwGXlhthO8JDyOnCIC0h8XhRz
	 ITvqU/eZ8UK5PZpjKQYPLhi8b6tCZcweXbfsnx6wmAtvwhA2M5J9R0PkKcI8Gu/+sm
	 jIqmFSZ0XVc7yhPaWW7vOLmyLrarI6JTPxPVB4Qj2j/QFOksL/AKVwLFmZikEFSs+9
	 sAzsPzF17G87BkZG5Oo/zSfjLCfKvaBqsDjflc2y8CUpJspJ8RGl2z1o97x7mQR4QN
	 qG8RTzVbeUeUg==
Date: Wed, 4 Mar 2026 15:05:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 4
Message-ID: <aahKMCqNrNnUwr1B@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260303:

The battery lost it's build failure.

The kvm-x86 tree acquired a conflict with the tip tree.

The xen-tip tree acquired a build failure due namespace clashes in other
trees, I used the version from next-20260303 instead but will consider a
revert going forward.

Non-merge commits (relative to Linus' tree): 3501
 3763 files changed, 270164 insertions(+), 64746 deletions(-)

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

I am currently merging 408 trees (counting Linus' and 122 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.
