Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F91E192590;
	Wed, 11 Mar 2026 16:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245980; cv=none; b=vEIE5b7BLKtVIRkgKzuEj+/4SvsY24Z51UuYKqbDwEo3Aoy0vaWnEY0cPpTjI6m4Y6zuxAC3HVXhOqaUdv2PoJY/y5dbH7lKd3vLoqY7z6I1VwCuY9/SeFhscbockcACA1TG4U052y1r/SN8N1HAsOttuN7zMPsPRLqWLr1N+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245980; c=relaxed/simple;
	bh=Mi8crnqLszcLer/GtMSsU4ldXx0Foi8Q05Gta5zTAf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcHjpB89AK5KYsvNtnYNlkvlewui80zB2eoApTT+rp9Pn/wP5VrbAOGCG3GUc2/cqZUPgvhYFkmCGIBh+a3cmFjnmR2noPcHr4+v0JI4c1qM+De/Wvz/QL1ypjFFz1qhQOg9HfafHf9ameXvq/65+ea+w1wX3/KhLvtYupdGd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4ZNVac5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4ZNVac5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C83C4CEF7;
	Wed, 11 Mar 2026 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773245979;
	bh=Mi8crnqLszcLer/GtMSsU4ldXx0Foi8Q05Gta5zTAf8=;
	h=Date:From:To:Cc:Subject:From;
	b=T4ZNVac5o9zfACKB6r1sMwr1hLdU/HuqWJvS+tAgY4u7cpvc/EOQpnie6soY7kik3
	 6qnGobqmCTrA0ZOJTFJjgtlVczUfBlbx/hffT2AoSFOSAyip3uqXG68Ov/yZUG6alA
	 eDJRnQQlSPppLXkT4Utgk/foIXGGOyenRyqbgHBDaIHC45TrU1I+D3dk++Nz59PwlM
	 mAww/11xB8PGyp6e3SsRwRR5zD+v8zH/gDSS86qS4Qz96YH6FSMpLuXR6t0+xGAgE1
	 wGwvC3aw4pgQIAh6EMbrypKWoU/Ky3snP68YTqa/dzdZzogHQqhG6tKos8UbaqAS8E
	 fClZbEwx75CDA==
Date: Wed, 11 Mar 2026 16:19:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 11
Message-ID: <abGWF_ffdwObpfRh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260310:

The tenstorrent-clk and tenstorrent-clk-fixes trees were added.

The drm-xe tree acquired a conflict with the mm-hotfixes tree.

The drm-xe tree acquired a build failure, I used the version from
20260310 instead.

The audit tree acquired a conflict with the vfs-brauner tree.

The kvm-x86 tree acquired a conflict with the mm-unstable tree.

The efi lost it's build failure.

The kvm-arm tree gained an arm64 allyesconfig build failure which was
ignored for today.

Non-merge commits (relative to Linus' tree): 5131
 5387 files changed, 343515 insertions(+), 94807 deletions(-)

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

I am currently merging 411 trees (counting Linus' and 123 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.
