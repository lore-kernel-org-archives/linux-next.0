Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2F640B6EE;
	Mon, 15 Jun 2026 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541892; cv=none; b=PyswvbwfoUNcCe2K5Tbq8K960WW7WY/ZLnyGXd/zMVnmOv0XRIAPBVmcMNpLAsn+Kgem312UHFPhNXmvad7y1IeHTNZ59UHMu2Xuxp09pMq9BMro/g3Sg2Cz5DJPCBlzT8cjBZFissM8RiiRlWbccVd2znLnQTj+V+n/9mk9dkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541892; c=relaxed/simple;
	bh=anVov4sbEzd/b1gnrWiwFNfsx2x/vfdgIdkdVcS2bBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ehgXv4Nn1yW+FeFd8NX6E0v7/PfNKamO9yqOf+55TQXDEiZtEhrtr7Tr/1CBCZnx1V6Sh2PQml3d+nOY4tfVqOlUTsutmgrppyR6OESgTIqDYCeAAyi9bULopKuvpKK8hXKIYZ19hiJxhw8C4kJbFmNKTCG/QdruKOVqV7rPo4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dx7kO06r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dx7kO06r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07F31F000E9;
	Mon, 15 Jun 2026 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541891;
	bh=NHFhEKXK6eE7jkOC1rhhW/LWivBWcsdhDBQkZoqLHkI=;
	h=Date:From:To:Cc:Subject;
	b=Dx7kO06r5LmB+ZSFJ8avaEk9Nc/0kVpMoh6TkiSThxTbDpABpVOeLGXijxfGOvoi1
	 +42+ujOnyPwu9sY4TiUC/oFoocs3TKX1DhcJq9ewF3KFqaUXecplFy2DyozV18lWe0
	 7phkc9wb51H9X5Ke6dprj6FOgbnRWtI3jgdje73/tbFekmWTyh9vxmFpfq2hI9Woc0
	 ewO84eT+R7kQpFQESMlmhGhhgLfwrWG0azzRCG3heWG63isnoVsdLT18QvivlGRfGC
	 WfR0e8anlRVUIevMRdU1dGPGn0BFyCXOEKJKObUvfrwsCspVVk9+DFtdB8xzwuIdBQ
	 YQad2ApvE1tZw==
Date: Mon, 15 Jun 2026 17:44:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 15
Message-ID: <ajAsADYHMJDbBSaC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

There was an earlier version posted briefly which I replaced due to
build errors, apologies for any disruption caused.

Changes since 20260612:

The sparc tree acquired a conflict with the mm-nonmm-unstable tree.

The hwmon-staging tree lost it's build failure.

The net-next tree acquired a conflict with the net tree.

The drm-xe tree acquired a conflict with the origin tree.

The drm-xe tree lost it's build failure.

The slab tree acquired a build failure, I used the version from
next-20260623 instead.

Non-merge commits (relative to Linus' tree): 11633
 12177 files changed, 756925 insertions(+), 233574 deletions(-)

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

I am currently merging 425 trees (counting Linus' and 131 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.
