From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the battery tree
Date: Mon, 27 Jul 2015 11:40:03 +1000
Message-ID: <20150727114003.093f0c4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48284 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755249AbbG0BkF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Jul 2015 21:40:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jun Nie <jun.nie@linaro.org>

Hi Sebastian,

After merging the battery tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/power/reset/zx-reboot.c:21:26: fatal error: asm/proc-fns.h: No such file or directory
 #include <asm/proc-fns.h>
                          ^

Caused by commit

  dd9f1486ae20 ("power/reset: zx: Register restart handler")

I have used the battery tree from next-20150724 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
