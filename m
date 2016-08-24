From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the thermal tree
Date: Wed, 24 Aug 2016 13:38:33 +1000
Message-ID: <20160824133833.3e92892a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>, Leo Yan <leo.yan@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Zhang,

After merging the thermal tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

warning: (HISI_THERMAL) selects STUB_CLK_HI6220 which has unmet direct dependencies (COMMON_CLK && COMMON_CLK_HI6220 && MAILBOX)

Introduced by commit

  5f63581ce68e ("thermal: hisilicon: Add dependency on the clock driver to allow frequency scaling")

BTW: That commit message does not match the change (which adds a
"select" not a "depends on".

-- 
Cheers,
Stephen Rothwell
