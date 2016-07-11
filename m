From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pm tree
Date: Mon, 11 Jul 2016 11:46:53 +1000
Message-ID: <20160711114653.066355ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51602 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755498AbcGKBq4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 10 Jul 2016 21:46:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Rafael,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: "configfs_unregister_subsystem" [samples/configfs/configfs_sample.ko] undefined!
ERROR: "configfs_register_subsystem" [samples/configfs/configfs_sample.ko] undefined!
ERROR: "config_group_init" [samples/configfs/configfs_sample.ko] undefined!
ERROR: "config_item_init_type_name" [samples/configfs/configfs_sample.ko] undefined!
ERROR: "config_group_init_type_name" [samples/configfs/configfs_sample.ko] undefined!
ERROR: "configfs_undepend_item" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] undefined!
ERROR: "config_item_put" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] undefined!
ERROR: "config_item_init_type_name" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] undefined!

... and many more ...

Presumably (maybe?) caused by commit

  0bf54fcd9504 ("ACPI: add support for configfs")

though it is not obvious why this should be a problem.

I have used the version of the pm tree from next-20160708 for today.
-- 
Cheers,
Stephen Rothwell
