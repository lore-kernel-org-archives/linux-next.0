From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the clockevents tree
Date: Thu, 17 Dec 2015 13:55:17 +1100
Message-ID: <20151217135517.1aad704d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55089 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751799AbbLQCzT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Dec 2015 21:55:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>

Hi Daniel,

After merging the clockevents tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/clocksource/h8300_timer16.c: In function 'timer16_interrupt':
drivers/clocksource/h8300_timer16.c:64:2: error: implicit declaration of function 'ctrl_bclr' [-Werror=implicit-function-declaration]
  ctrl_bclr(p->ovf, p->mapcommon + TISRC);
  ^

Caused by commit

  1ddca16cc5b3 ("clocksource/drivers/h8300: Use ioread / iowrite")

ctrl_bclr is only defined for the h8300 arch ...

I have used the clocksource tree from next-20151216 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
