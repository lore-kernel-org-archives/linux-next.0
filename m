From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the driver-core tree
Date: Wed, 7 Oct 2015 15:51:46 +1100
Message-ID: <20151007155146.41c4528f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49442 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751006AbbJGEvs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Oct 2015 00:51:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

Hi Greg,

After merging the driver-core tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/base/power/opp/debugfs.c: In function 'opp_debug_create_one':
drivers/base/power/opp/debugfs.c:48:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
  if (!debugfs_create_bool("available", S_IRUGO, d,
       ^
In file included from drivers/base/power/opp/debugfs.c:13:0:
include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
 struct dentry *debugfs_create_bool(const char *name, umode_t mode,
                ^
drivers/base/power/opp/debugfs.c:52:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
  if (!debugfs_create_bool("dynamic", S_IRUGO, d, (u32 *)&opp->dynamic))
       ^
In file included from drivers/base/power/opp/debugfs.c:13:0:
include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
 struct dentry *debugfs_create_bool(const char *name, umode_t mode,
                ^
drivers/base/power/opp/debugfs.c:55:7: warning: passing argument 4 of 'debugfs_create_bool' from incompatible pointer type
  if (!debugfs_create_bool("turbo", S_IRUGO, d, (u32 *)&opp->turbo))
       ^
In file included from drivers/base/power/opp/debugfs.c:13:0:
include/linux/debugfs.h:94:16: note: expected 'bool *' but argument is of type 'u32 *'
 struct dentry *debugfs_create_bool(const char *name, umode_t mode,
                ^

Introduced by commit

  621a5f7ad9cd ("debugfs: Pass bool pointer to debugfs_create_bool()")

interacting with commit

  5cb5fdbf3877 ("PM / OPP: Add debugfs support")

from the pm tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
