From: Stephen Rothwell <sfr@au1.ibm.com>
Subject: linux-next: manual merge of the cpufreq tree with the s5p tree
Date: Fri, 11 Mar 2011 13:35:42 +1100
Message-ID: <20110311133542.8ffb094e.sfr@au1.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-next.vger.kernel.org

Hi Dave,

Today's linux-next merge of the cpufreq tree got a conflict in
arch/arm/mach-exynos4/cpufreq.c between commit 7d30e8b3815f ("ARM:
EXYNOS4: Add EXYNOS4 CPU initialization support") from the s5p tree and
commit 44033b9c940e ([CPUFREQ] Remove the pm_message_t argument from
driver suspend"") from the cpufreq tree (where this file is called
arch/arm/mach-s5pv310/cpufreq.c).

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-exynos4/cpufreq.c
index a16ac35,7c08ad7..0000000
--- a/arch/arm/mach-exynos4/cpufreq.c
+++ b/arch/arm/mach-exynos4/cpufreq.c
@@@ -452,8 -458,7 +452,7 @@@ static int exynos4_target(struct cpufre
  }
  
  #ifdef CONFIG_PM
- static int exynos4_cpufreq_suspend(struct cpufreq_policy *policy,
- 				   pm_message_t pmsg)
 -static int s5pv310_cpufreq_suspend(struct cpufreq_policy *policy)
++static int exynos4_cpufreq_suspend(struct cpufreq_policy *policy)
  {
  	return 0;
  }
