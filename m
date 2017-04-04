From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mfd tree
Date: Tue, 4 Apr 2017 16:44:53 +1000
Message-ID: <20170404164453.677dc74a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi Lee,

After merging the mfd tree, today's linux-next build (powerpc
allyesconfig) failed like this:

/home/sfr/next/next/drivers/mfd/intel_soc_pmic_bxtwc.c:25:31: fatal error: asm/intel_pmc_ipc.h: No such file or directory

Caused by commit

  eb2a445f7d8f ("mfd: intel_soc_pmic: Fix a mess with compilation units")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
