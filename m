Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7963C377EC6;
	Thu, 30 Apr 2026 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540279; cv=none; b=q+jrlhAprpJTdH80eog2k+UGBfIW7c0ZpbhsvuRnp22PYnTUn6lqh4c7+PrGAOaC9JkjGHRO7gMledeMJLyNiwYoMLmxqmDwWy6w2VdS3zDWAJVtM4UrS1VyMHCl++/SEsDfKUSamwWUxo7cRIZy97LdHHWbQ/LTrMsriJgGfhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540279; c=relaxed/simple;
	bh=TAGRs2kk2CQruB1hI4fg4hgyhLCGP5Z6WYmhzyL2Jss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fyGL+FBduR0FVcrJdM4thsGDfEDoLyJfvuN1sPRcAWXxD1C8d1n5wnCdlvEOjUrA46yKU15GilWuxJhnGkcvWqSiu5hM7SAaCnJXbd0Pz04Lkul3yVeaNzgwZqd9zGiQc7JpwhUbTo+VZwCF/N5UQbKfDPvqaSnGr1HPus7JmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CI5z7aI/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CI5z7aI/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3748C2BCB3;
	Thu, 30 Apr 2026 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777540279;
	bh=TAGRs2kk2CQruB1hI4fg4hgyhLCGP5Z6WYmhzyL2Jss=;
	h=From:To:Cc:Subject:Date:From;
	b=CI5z7aI/PRtvscMW4i+FmyBcl6hSOgyW6jO0VTUCZ0gPhQCxQW3tqoGuFDodh0pBd
	 cWODTp6d2GR/Xrdoj/TkqEvem4tSMbOhc3Ou57sFC97RUabLw7mT+gEKHS11cN4bBY
	 rI5nDBO1jZAmdA3VnsI9tUq00rbvuzY2iMnwFYqpskpvq/pU2pFy23WF91ORLMqtHn
	 UMJ8Jy1nDnTRVThZd1v9W9iEMJ5BLyebdnLPI3C18qHFdM05vVr9VCCMdAxF3FPhaW
	 HaFMOMuj97qLhf/8jgLr1198abNo9mhE7M8AQtSMWBpN1JiQRb876ODgHyneRSSYLh
	 LxKSPyBrQIQSA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bitmap tree
Date: Thu, 30 Apr 2026 11:11:12 +0200
Message-ID: <20260430091113.4086100-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

After merging the bitmap tree, today's linux-next build (x86_64
allnoconfig) failed like this:

    ld: arch/x86/events/intel/core.o: in function `intel_hybrid_get_attr_cpus':
    core.c:(.text+0x944): undefined reference to `cpumap_print_to_pagebuf'
    ld: kernel/events/core.o: in function `cpumask_show':
    core.c:(.text+0xcb8): undefined reference to `cpumap_print_to_pagebuf'
    ld: drivers/base/cpu.o: in function `show_cpus_attr':
    cpu.c:(.text+0x280): undefined reference to `cpumap_print_to_pagebuf'

Caused by commit

    6d3a0b07f271 ("cpumask: switch cpumap_print_to_pagebuf() to using scnprintf()")

This seems to be caused by the new function not being available for
!CONFIG_SMP configurations, whereas previously it was a static inline
function and hence present irrespective of configuration.

I've fixed this up for today by reverting the following patches:

    af327141d0dd ("bitmap: drop bitmap_print_to_pagebuf()")
    6d3a0b07f271 ("cpumask: switch cpumap_print_to_pagebuf() to using scnprintf()")

Please fix this properly in the bitmap tree.

Thierry
