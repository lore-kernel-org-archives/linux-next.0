From: Zhang Rui <rui.zhang@intel.com>
Subject: thermal patches in linux-next
Date: Tue, 07 Aug 2012 10:53:58 +0800
Message-ID: <1344308038.1682.637.camel@rui.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:27144 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753999Ab2HGCwr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Aug 2012 22:52:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amit Kachhap <amit.kachhap@linaro.org>, guenter.roeck@ericsson.com, kuninori.morimoto.gx@renesas.com, akpm@linux-foundation.org

Hi, all,

I just created a git tree for catching all thermal changes.
http://git.kernel.org/?p=linux/kernel/git/rzhang/linux.git;a=summary
and I also created the next branch, which I'd like to be set for
linux-next inclusion, but don't know how.

And, I just saw that there are a couple of thermal patches in
linux-next, which I think it would be better if they can be re-based on
my next branch first.
For Guenter's and Kuninori's patch, I can take them directly, with few
changes.

Amit,
I really like the idea of generic cpufreq cooling. But can you please
rebase the patches on top of my next branch? the recent thermal changes
will make your patch much cleaner, as we discussed before. :)

thanks,
rui
