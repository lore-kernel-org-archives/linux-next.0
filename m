From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the i2c tree
Date: Mon, 5 Jun 2017 11:11:31 +1000
Message-ID: <20170605111131.3a113eaa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34535 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751193AbdFEBLe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 4 Jun 2017 21:11:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Wolfram,

After merging the i2c tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
 #define DEBUG
 ^
<command-line>:0:0: note: this is the location of the previous definition

Introduced by commit

  6c42778780c4 ("i2c: stub: use pr_fmt")

-- 
Cheers,
Stephen Rothwell
