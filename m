From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Wed, 7 Feb 2018 10:45:33 +1100
Message-ID: <20180207104533.216ef09b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52963 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753346AbeBFXpg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Feb 2018 18:45:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Nikolay Borisov <nborisov@suse.com>

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/disk-io.c

between commit:

  540adea3809f ("error-injection: Separate error-injection from kprobe")

from Linus' tree and commit:

  8bd2a9b19fd7 ("btrfs: Remove custom crc32c init code")

from the btrfs-kdave tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/disk-io.c
index f9cef2f8d1a5,ff64113ec5f0..000000000000
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@@ -30,7 -30,7 +30,8 @@@
  #include <linux/ratelimit.h>
  #include <linux/uuid.h>
  #include <linux/semaphore.h>
 +#include <linux/error-injection.h>
+ #include <linux/crc32c.h>
  #include <asm/unaligned.h>
  #include "ctree.h"
  #include "disk-io.h"
