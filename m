Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C7930DEB8;
	Mon, 27 Apr 2026 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300664; cv=none; b=Bsoolto2lYJPpdhHIlO1QRZoXEi0+iLW/2URzjjhjl+C8Yy3nXZAt59k5L7fuDufE7FzoGADwISuCAHuqU/Y1pEAAwj3zkBDYLfrttyH8ZL/ZY0CC1VMjuV9PwH0oQOV5QZJioGO24TBzL9eyoBI28PdzLGyDYEeotmtFjgMBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300664; c=relaxed/simple;
	bh=OZr/kgFOjc+hvdbRBhhqmHIPaFIGmz1TfcwkwrOL600=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZBbX3fuY2u3yLkEl6lQLDji9y8mwU9P0EACDwFn7Lvj4ddmYaUzGS07zDfH4k/sAOhEYyZ9JKUFB4BPE6+vjHzjQ77XXZBOcu9c17C53/ZYVxTidKlir4LEMXsIQSsVLRPSFsawVuKvVX9DdsLfwse0+8IdR7jR7kPDPvgWjphw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lc+cbxw4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lc+cbxw4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E24C19425;
	Mon, 27 Apr 2026 14:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777300663;
	bh=OZr/kgFOjc+hvdbRBhhqmHIPaFIGmz1TfcwkwrOL600=;
	h=From:To:Cc:Subject:Date:From;
	b=Lc+cbxw4jaJgA8TFzRpoQ+Hp41RPfUqxNFv1EE8a6oAuyzJTWL0qRwrvp2GlB3LmQ
	 YI4R8uNA2mj1HWraO7H4fc3le9lwVFzXT7eJql0BL2FOQsWaZMRNxVrDhXyBvZCPJB
	 XhTMf9FcbsHRbgG2sLbE7i5pTRbkvBSwVWXz5Jw40a5KrPS4Jyfh3zTUgj3GuDPpfB
	 fS11UkrJx4V+WjsWcCQEGd/7Ixs4+gTfH6gYtV6BMk/jMRoGslrmGlNgDlqbTWDFRw
	 kDYQYd8II1ukowNho/7qT+F5d7cFKAAS6twsrL5V2snHSQ9yRVdWYjilrQU8i9Cc29
	 SkKzSsJy/3ETg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 27
Date: Mon, 27 Apr 2026 16:37:34 +0200
Message-ID: <20260427143737.3767348-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Changes since 20260424:

The bpf-next tree started to cause some build failures, so I've reused the
tree from next-20260424.

There's one build failure in the drm/amd/amdgpu driver (frame size errors)
that I was only able to reproduce on an arm64 allyesconfig build at a very
late state. It doesn't look like any recent changes caused this so I left
it in for now, hoping it won't impact most people.

Non-merge commits (relative to Linus' tree): 775
 998 files changed, 91327 insertions(+), 10126 deletions(-)

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
