From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the samsung tree
Date: Mon, 17 Aug 2015 11:36:17 +1000
Message-ID: <20150817113617.56d901e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shailendra Verma <shailendra.capricorn@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-next.vger.kernel.org

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/cpufreq/exynos-cpufreq.c

between commit:

  966f2a71a92d ("cpufreq: exynos: remove Exynos4x12 specific cpufreq driver support")

from the samsung tree and commit:

  62c3f2fddd43 ("cpufreq: exynos: Fix for memory leak in case SoC name does not match")

from the pm tree.

I fixed it up (I just removed the file) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
