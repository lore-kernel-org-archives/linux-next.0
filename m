Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D077459AF1;
	Tue,  4 Aug 2026 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785864171; cv=none; b=cYOLS4/esiw8sBIPdX5HCakW5La3/x9fC+KR1NdiQODsWgjL/b4WpUchPYSyliEQdmoiFT+K0iJ91ELWStnx2sBamGZAWS9loh2apjxhdoTN7KO2AepTU3Rtr5js7om4/wxpVRqyq3XITV2OBnkcFVhZoWupMTu/D5m4RQLO9Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785864171; c=relaxed/simple;
	bh=Olu2xtPm50JmyOZ4e7XndDQPZROvNXUdhIVe62r25Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T1I7O+mwHA98V1QQnFatiY/p9KCOXk9DChSemU+YrlfvlCpvCV2sqyTzchjtAsx3uKbUPXAPQJjUIEF/l9DUkwAVhuk9pAmNeNReEE6TeUZl/ishPtzKekyLp7U9LzlUJEsPj5qYalkkRCPZHtXkddMo9OhEhTnmpB6dci3avFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzSdAdOB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzSdAdOB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306021F000E9;
	Tue,  4 Aug 2026 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785864160;
	bh=hyFV5mLX7Xm9FyicLXBmxhkXsIzvPFBYrOeUSY3uSN8=;
	h=Date:From:To:Cc:Subject;
	b=nzSdAdOBaqepYksjuc53CMsNKX4poqkig8hVaMrn5lNC99U95wgshfRqU2X0MrWZR
	 /0PBhM/8IlgdPC/oIAiZckSucuz5nsYVqNOvbwwIuHs4BcobQDIs9NVcTFJFx9Dikk
	 GPPP7GREcFRxNHQDo8H65lfsxH+wNgiOjM+Q37eS0gbYcVZrWHCT48rpX73vKW6Na1
	 DqjnH5ONdfMHjNWPFeR54aXdyvEAVMhLLYlLodGbcljG5BexxikveJYtYMVuocN6VE
	 rdYq+p+v8aHlWYY6EKlL5QBysx0pTsrB2iAiWaVpiW2kQcdRT/qBan0uMZZ8+08wCO
	 rNZNpHSaopWVw==
Date: Tue, 4 Aug 2026 18:22:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 4
Message-ID: <anIf3c71MGAcA-0s@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260803:

The btrfs tree acquired a conflict with the btrfs-fixes tree.

The xen-tip tree acquired a build failure, I used the version from
next-20260803 instead.

Non-merge commits (relative to Linus' tree): 11635
 10401 files changed, 549933 insertions(+), 170284 deletions(-)

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

I am currently merging 429 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.
