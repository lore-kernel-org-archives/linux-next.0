From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the target-updates tree
Date: Wed, 7 Oct 2015 14:49:32 +1100
Message-ID: <20151007144932.3e68e0f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41493 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752928AbbJGDte (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Oct 2015 23:49:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Christoph Hellwig <hch@lst.de>

Hi Nicholas,

After merging the target-updates tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/hwtracing/stm/policy.c:212:2: error: unknown field 'show_attribute' specified in initializer
  .show_attribute  = stp_policy_node_attr_show,
  ^
drivers/hwtracing/stm/policy.c:212:2: warning: initialization from incompatible pointer type
drivers/hwtracing/stm/policy.c:212:2: warning: (near initialization for 'stp_policy_node_item_ops.allow_link')
drivers/hwtracing/stm/policy.c:213:2: error: unknown field 'store_attribute' specified in initializer
  .store_attribute = stp_policy_node_attr_store,
  ^
drivers/hwtracing/stm/policy.c:213:2: warning: initialization from incompatible pointer type
drivers/hwtracing/stm/policy.c:213:2: warning: (near initialization for 'stp_policy_node_item_ops.drop_link')
drivers/hwtracing/stm/policy.c:353:2: error: unknown field 'show_attribute' specified in initializer
  .show_attribute  = stp_policy_attr_show,
  ^
drivers/hwtracing/stm/policy.c:353:2: warning: initialization from incompatible pointer type
drivers/hwtracing/stm/policy.c:353:2: warning: (near initialization for 'stp_policy_item_ops.allow_link')

Caused by commit

  7bd1d4093c2f ("stm class: Introduce an abstraction for System Trace Module devices")

from the char-misc tree interacting with commit

  f71933438300 ("configfs: remove old API")

I have reverted the target-updated commit for today.  If there is a
better resolution (and I assume that there is), please let me know.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
