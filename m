From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the mmc-uh tree
Date: Mon, 6 Jun 2016 11:38:48 +1000
Message-ID: <20160606113848.534cbdf7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36988 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751770AbcFFBiv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 5 Jun 2016 21:38:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>

Hi Ulf,

After merging the mmc-uh tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/err.h:4:0,
                 from drivers/mmc/core/mmc.c:13:
drivers/mmc/core/mmc.c: In function 'mmc_select_hs400es':
include/linux/err.h:21:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
                                                 ^
include/linux/compiler.h:170:42: note: in definition of macro 'unlikely'
 # define unlikely(x) __builtin_expect(!!(x), 0)
                                          ^
drivers/mmc/core/mmc.c:1244:6: note: in expansion of macro 'IS_ERR_VALUE'
  if (IS_ERR_VALUE(err))
      ^

Introduced by commit

  8141f0ace818 ("mmc: core: implement enhanced strobe support")

I think error values now must be "long".

-- 
Cheers,
Stephen Rothwell
