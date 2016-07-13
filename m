From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Date: Wed, 13 Jul 2016 16:14:48 +1000
Message-ID: <20160713161448.7cedd072@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, NeilBrown <neilb@suse.com>, Keith Busch <keith.busch@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/nvme/host/core.c

between commit:

  f80ec966c19b ("nvme: Limit command retries")

from the block tree and commit:

  8cc07e463b0c ("NVMe: don't allocate unused nvme_major")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/nvme/host/core.c
index 86a0c661e74c,3dc259e7bf2a..000000000000
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@@ -48,14 -47,6 +48,11 @@@ unsigned char shutdown_timeout = 5
  module_param(shutdown_timeout, byte, 0644);
  MODULE_PARM_DESC(shutdown_timeout, "timeout in seconds for controller shutdown");
  
 +unsigned int nvme_max_retries = 5;
 +module_param_named(max_retries, nvme_max_retries, uint, 0644);
 +MODULE_PARM_DESC(max_retries, "max number of retries a command may have");
 +EXPORT_SYMBOL_GPL(nvme_max_retries);
 +
- static int nvme_major;
- module_param(nvme_major, int, 0);
- 
  static int nvme_char_major;
  module_param(nvme_char_major, int, 0);
  
