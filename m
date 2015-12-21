From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clockevents tree with the tip tree
Date: Mon, 21 Dec 2015 14:08:24 +1100
Message-ID: <20151221140824.1309a841@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55023 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751145AbbLUDI0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 20 Dec 2015 22:08:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>

Hi Daniel,

Today's linux-next merge of the clockevents tree got a conflict in:

  drivers/clocksource/h8300_timer16.c

between commit:

  d33f250af4e6 ("clocksource/drivers/h8300: Use ioread / iowrite")

from the tip tree and commit:

  1ddca16cc5b3 ("clocksource/drivers/h8300: Use ioread / iowrite")

from the clockevents tree.

The former is just a fixed version of the latter, so I used that.

It looks like the clockevents tree needs to be cleaned up.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
