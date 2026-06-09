Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C7438AC8E;
	Tue,  9 Jun 2026 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989711; cv=none; b=RTHg1PVHhwB0KSIqi1rTMB4SZKnkyhax8xXwt0JMVG4QNlj+yKRNANvNsclGr67yy+B2fyJyfoyJkH5pHIuJRBD2JGVB7BX+1c/l2b9VnSkdmTx1fCeQujuQ/dLsS72BMKGZ7kH0zFzoLvENqKRSMGfGyD3e/A0gxwbwnFhNDeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989711; c=relaxed/simple;
	bh=vPRtbvI9UUMBhlEon6EMZ/axGnGv9eAK+KWtoV3h7y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XOehrOa1fvfnTCSmkcH+HWqQ0NxbmeOurTnUTKFe0YTilzQqfQghC4BVKHabyVCXsV+1M74Ll0/w8rQaVTnnSIOMOxsanvjF999bcmmfUamEnQfzbEbfSivlCXAesNPYkbRcarniKbbt5KyYtMvzYmA5JSeY8AqyM3jMmp1X2EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAXUSZU3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAXUSZU3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09881F00898;
	Tue,  9 Jun 2026 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989710;
	bh=vPRtbvI9UUMBhlEon6EMZ/axGnGv9eAK+KWtoV3h7y4=;
	h=Date:From:To:Cc:Subject;
	b=ZAXUSZU32gDUdU7qIJI8BLPMGvhEDAf6XJfLTAYNLD4UiGTYxg1XDNveKtbL2cNpk
	 bA6qL9keV5nSecLbg9fW38wi5YFF/7UkymWf6rSoZ5AfJRY8EE5H099wjFSQaM9eH/
	 2a9tgHSBSGm6AxSqc4AxmIlRy9qiCniFZydl3cGG9FlGgBq8gwALEMPg7xKkajNaoa
	 0uKnj+u5mJIb/0Kt/tGPlES51AGz+Rut8GgkbuJDfJTMxHU29D5oG10d8+6swvQJEK
	 qd+X3D4TEFi8kppcukXBQCSNBR5LS5Uq1bUROqsMZxZcZsKfiliXq0PavdjM1UVQjB
	 L7SJEz15Fxdyg==
Date: Tue, 9 Jun 2026 00:21:48 -0700
From: Drew Fustini <fustini@kernel.org>
To: broonie@kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org
Subject: Add fustini riscv-config to linux-next
Message-ID: <aie/DAyvda4bcdLm@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

I have a new tree where I will apply patches for riscv defconfigs. I
have trees for dt and clk for two riscv soc vendors in next but
defconfig patches don't belong in such branches. Conor has in the past
taken defconfig patches but he is happy for me to send pull requests
as needed based on my new defconfig branches.

Please add these to linux-next:

riscv-config https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git#riscv-config-for-next
riscv-config-fixes https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git#riscv-config-fixes

Thanks,
Drew
