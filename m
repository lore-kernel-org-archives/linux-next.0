Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2FB370D63;
	Mon,  4 May 2026 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777931936; cv=none; b=bh+VGqpAPZtOf+GtMhc75yLLD6Hu3/qcpqctqRlPn5S4/Duqa4SFBssEc5KIwUvcZh22gyabXNYe83gPacrI7h+Rhc42PAI4smXXWGvunxx6wDX9jBTiJx4ZKNojm2dIAU2T0zWhFBmRAgLwlVdP9aNwloJESMUW19szfGNQ7xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777931936; c=relaxed/simple;
	bh=HNil5T8Vmd0o6OmiEhxdXzbCmc9B0g36HvkcQ3S2z7M=;
	h=Date:Message-ID:From:To:Cc:Subject; b=N/GViDhD1NtOniZFpJOPRA+kauo+/LS5BlCaBSN1RHQ7M1V08BSWvsWiiXHkqMoooPE9l4kzuFWjlgJ6YhAY0KWOlIT4ZUaOF8GjrNJrKL+G6D/HZX7JR/bX8DBp51BvYHorq1yIy/uY4tTEUdKOOMR/H+Ahy+tHVldSyMbHfmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+9/bW5f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+9/bW5f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8FAC2BCB8;
	Mon,  4 May 2026 21:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777931935;
	bh=HNil5T8Vmd0o6OmiEhxdXzbCmc9B0g36HvkcQ3S2z7M=;
	h=Date:From:To:Cc:Subject:From;
	b=C+9/bW5fWMh49tKxSp6Yhk/06pfLIalujvYuH88Oc/xjv8hITzqIT4dT95XSzlwwy
	 rVauyjl4sFMKnaZrjEEkdvJbn0ccXDGBCl/WIYhmCf0L55BGYiIfp9/l24n51HH0mG
	 cucRJHDJqSsL3F9IKDBKZ8PGdvXWW6oTihUAeO12W5yCHbkB7Bya2P/WBuXaVxG6aD
	 etLz/g1x3aIDDD2mn7w2SEJ0+EzyFHHwftmUNkGiRYZlmsADRPQXXLAQfjrf0Jx5+U
	 oSJMQY5nOPKVPLFT8Gj5xLd9oQIpNT92x3X82aGL7KEAIS8whHX66dyp2cgV8uizDy
	 JSb4cN8lEK5MA==
Date: Mon, 04 May 2026 23:58:53 +0200
Message-ID: <6627b1dbdd5f13f17f994405018aae3e@kernel.org>>
From: Thierry Reding <thierry.reding@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 4
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Changes since 20260430:

The nfc-fixes and nfc trees were added. The nfc tree was based on an old
linux-next release and caused a number of conflicts so was skipped for
today.

Non-merge commits (relative to Linus' tree): 2371
 2675 files changed, 146116 insertions(+), 39197 deletions(-)

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
