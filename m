From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rtc tree
Date: Thu, 17 Dec 2015 16:03:44 +1100
Message-ID: <20151217160344.096b4a9e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37630 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751013AbbLQFDq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Dec 2015 00:03:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sasha Levin <sasha.levin@oracle.com>

Hi Alexandre,

After merging the rtc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/built-in.o: In function `rtc_time64_to_tm':
sunxi_sid.c:(.text+0x366e54): undefined reference to `__aeabi_ldivmod'
sunxi_sid.c:(.text+0x366e6c): undefined reference to `__aeabi_ldivmod'

Caused by commit

  bfad4c280be0 ("rtc: fix overflow and incorrect calculation in rtc_time64_to_tm")

I have used the rtc tree from next-20151216 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
