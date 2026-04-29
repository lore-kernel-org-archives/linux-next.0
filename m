Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51C33A3814;
	Wed, 29 Apr 2026 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462048; cv=none; b=j7rAGN9+tbxHzKAL2TYNd45BwdRevYpRtYjoiSZ689LhA4A1BuJrQuDwjt3dQpt1p9ZPyqwYI5lDlHVgGCPhp7rQ5SPMlJqswK0dWSSsxk7XnNknIYBOKd4YxKN6TrtpvqScW55e0RuL5MYgfZYB8sje+J5cYKtv2dieHBFwPP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462048; c=relaxed/simple;
	bh=7vTeKad186E0ktzCpNXLUqE+Nu6bpTQbCg7IbcT+MQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hmqe8yqLMzNP2gOcZA6S4kgyliEEMQEa8k+IAk9Cg1YK/SKjkbv7ltHUgGlKoqMvX+KWMZ8R9UoKI4exL+mvhzXdFDJbN7zZUJAwi7NUJcBx8oSqaAnv2bhpkuBVI0A7Z83tvYhFSGjJ4Z1Q78OHzMrjLrT1HL+X8SAfW7bTesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RN+IWrs+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RN+IWrs+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECFDC19425;
	Wed, 29 Apr 2026 11:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777462048;
	bh=7vTeKad186E0ktzCpNXLUqE+Nu6bpTQbCg7IbcT+MQ0=;
	h=From:To:Cc:Subject:Date:From;
	b=RN+IWrs+w0YeDygbmQ24D909KOX3FdaLE6vj91qOI2n15nsYNT06kaHGFBbKP6aBZ
	 BYGYWs8cVBtqvnc7V9mDX50Fl1NBU0x0Ee9tyQ7WM7vBXSmuyM/sK4HGV4KGR0GA12
	 09qcDAIDR/JnyeFv4E2x3uTPmrSVlwPz3v+yBZ4kk92TcAazce0apIMd2jW6WbzfDX
	 mwi1VBX8LTFlrWY8xsQt+aZd7PGnH3qweW8HvO42Wk76o4/QGS4WtkUZW6O+zvoYFY
	 mdbTBW61Ri1pVtssZVLLpEnksgiyNp8u3/ZRRINDreXHJP5JAu9giwBD9Vmye9yJYl
	 a6JzhT1g+99PQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 29
Date: Wed, 29 Apr 2026 13:27:25 +0200
Message-ID: <20260429112726.4002447-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Changes since 20260428:

Some Fixes: tags issue appeared in the iio-fixes tree and have been
reported.

The mm-nonmm-unstable tree caused a build failure, so I've reverted the
offending commit in linux-next and reported the issue.

The nand tree caused some conflicts and build failures, so I've reused
the version from next-20260428.

Non-merge commits (relative to Linus' tree): 1719
 2045 files changed, 127653 insertions(+), 27227 deletions(-)

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
