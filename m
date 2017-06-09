From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the device-mapper tree
Date: Fri, 9 Jun 2017 13:12:37 +1000
Message-ID: <20170609131237.41b77828@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34255 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751470AbdFIDMj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Jun 2017 23:12:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>

Hi all,

After merging the device-mapper tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/md/dm-zoned-target.c:947:2: error: unknown field 'suspend' specified in initializer
  .suspend  = dmz_suspend,
  ^
drivers/md/dm-zoned-target.c:947:14: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .suspend  = dmz_suspend,
              ^

Caused by commit

  02da2e15e81f ("dm zoned: drive-managed zoned block device target")

I have used the device-mapper tree from next-20170608 for today.

-- 
Cheers,
Stephen Rothwell
