From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rtc tree
Date: Tue, 10 Jan 2017 14:01:00 +1100
Message-ID: <20170110140100.4a5a0158@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1764732AbdAJDBF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Jan 2017 22:01:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>

Hi Alexandre,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/rtc/rtc-armada38x.c: In function 'read_rtc_register_wa':
drivers/rtc/rtc-armada38x.c:131:25: warning: 'index_max' may be used uninitialized in this function [-Wmaybe-uninitialized]
  return rtc->val_to_freq[index_max].value;
                         ^

Introduced by commit

  61cffa2438e3 ("rtc: armada38x: Follow the new recommendation for errata implementation")

-- 
Cheers,
Stephen Rothwell
