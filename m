From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the lightnvm tree
Date: Thu, 30 Jun 2016 12:56:35 +1000
Message-ID: <20160630125635.008b33b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59256 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751450AbcF3C4i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jun 2016 22:56:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matias =?UTF-8?B?QmrDuHJsaW5n?= <m@bjorling.me>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Matias,

After merging the lightnvm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "nvm_alloc_dev" [drivers/nvme/host/nvme-core.ko] undefined!
ERROR: "nvm_alloc_dev" [drivers/block/null_blk.ko] undefined!

Caused by commit

  3daf1adc80a8 ("lightnvm: let drivers control the lifetime of nvm_dev")

I have used the lightnvm tree from next-20160629 for today.

-- 
Cheers,
Stephen Rothwell
