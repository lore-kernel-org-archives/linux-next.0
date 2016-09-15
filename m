From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the lightnvm tree
Date: Thu, 15 Sep 2016 13:42:31 +1000
Message-ID: <20160915134231.144855f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47650 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1761957AbcIODmf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Sep 2016 23:42:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matias =?UTF-8?B?QmrDuHJsaW5n?= <m@bjorling.me>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Simon A. F. Lund" <slund@cnexlabs.com>

Hi Matias,

After merging the lightnvm tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/lightnvm/sysfs.c: In function 'nvm_sysfs_register_dev':
drivers/lightnvm/sysfs.c:184:2: warning: ignoring return value of 'device_add', declared with attribute warn_unused_result [-Wunused-result]
  device_add(&dev->dev);
  ^

Introduced by commit

  38c9e260b9f9 ("lightnvm: expose device geometry through sysfs")

-- 
Cheers,
Stephen Rothwell
