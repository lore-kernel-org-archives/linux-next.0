From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the block tree
Date: Wed, 10 May 2017 11:24:11 +1000
Message-ID: <20170510112411.1e785033@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751060AbdEJBYO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 May 2017 21:24:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Markus Trippelsdorf <markus@trippelsdorf.de>, Bart Van Assche <bart.vanassche@sandisk.com>

Hi Jens,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

block/elevator.c: In function 'elv_iosched_store':
block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]
  strstrip(elevator_name);
  ^

Introduced by commit

  d0f6e2da5871 ("block: Remove leading whitespace and trailing newline in elevator switch error message")

-- 
Cheers,
Stephen Rothwell
