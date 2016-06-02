From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Thu, 2 Jun 2016 12:12:32 +1000
Message-ID: <20160602121232.7f32f1e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Rafael,

After merging the pm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/platforms/cell/cpufreq_spudemand.c: In function 'spu_gov_govern':
arch/powerpc/platforms/cell/cpufreq_spudemand.c:98:7: error: 'CPUFREQ_GOV_START' undeclared (first use in this function)
  case CPUFREQ_GOV_START:
       ^
arch/powerpc/platforms/cell/cpufreq_spudemand.c:98:7: note: each undeclared identifier is reported only once for each function it appears in
arch/powerpc/platforms/cell/cpufreq_spudemand.c:124:7: error: 'CPUFREQ_GOV_STOP' undeclared (first use in this function)
  case CPUFREQ_GOV_STOP:
       ^
arch/powerpc/platforms/cell/cpufreq_spudemand.c: At top level:
arch/powerpc/platforms/cell/cpufreq_spudemand.c:142:2: error: unknown field 'governor' specified in initializer
  .governor = spu_gov_govern,
  ^
arch/powerpc/platforms/cell/cpufreq_spudemand.c:142:14: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .governor = spu_gov_govern,
              ^
arch/powerpc/platforms/cell/cpufreq_spudemand.c:142:14: note: (near initialization for 'spu_governor.init')

Caused by commit

  c1596d383aef ("cpufreq: governor: Get rid of governor events")

I have used the pm tree from next-20160601 for today.

-- 
Cheers,
Stephen Rothwell
