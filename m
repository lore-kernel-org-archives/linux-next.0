From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mailbox tree
Date: Sun, 1 Nov 2015 23:12:53 +1100
Message-ID: <20151101231253.64beff47@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43799 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752347AbbKAMM6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 07:12:58 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>

Hi Jassi,

After merging the mailbox tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mailbox/mailbox-test.c: In function 'mbox_test_receive_message':
drivers/mailbox/mailbox-test.c:226:11: error: implicit declaration of function '__io_virt' [-Werror=implicit-function-declaration]
           __io_virt(tdev->mmio), MBOX_MAX_MSG_LEN, true);
           ^

Caused by commit

  a133f8b65d59 ("mailbox: mailbox-test: Correctly repair Sparse warnings")

I have used the mailbox tree from next-20151022 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
