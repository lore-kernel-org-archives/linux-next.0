From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with Linus' tree
Date: Mon, 24 Aug 2015 09:55:48 +1000
Message-ID: <20150824095548.6bb25c3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42451 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753637AbbHWXzv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Aug 2015 19:55:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shailendra Verma <shailendra.capricorn@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  drivers/cpufreq/exynos-cpufreq.c

between commit:

  62c3f2fddd43 ("cpufreq: exynos: Fix for memory leak in case SoC name does not match")

from Linus' tree and commits:

  ac4c90c82e4d ("cpufreq: exynos: remove exynos5250 specific cpufreq driver support")
  966f2a71a92d ("cpufreq: exynos: remove Exynos4x12 specific cpufreq driver support")

from the arm-soc tree.

I fixed it up (the latter commit removed the file, so I did that) and
can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
