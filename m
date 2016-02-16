From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the staging
 tree
Date: Tue, 16 Feb 2016 13:55:48 +1100
Message-ID: <20160216135548.6da63be6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shraddha Barke <shraddha.6596@gmail.com>, Christoffer Dall <christoffer.dall@linaro.org>, Jason Hu <jia-cheng.hu@intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/platform/goldfish/goldfish_pipe.c

between commit:

  1d427da1d7f9 ("Platform: goldfish: goldfish_pipe.c: Add DMA support using managed version")

from the staging tree and commits:

  2f3be88237a3 ("goldfish_pipe: Pin pages to memory while copying and other cleanups")
  d62f324b0ac8 ("goldfish: Enable ACPI-based enumeration for android pipe")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/platform/goldfish/goldfish_pipe.c
index 9f6734ce1873,839df4aace76..000000000000
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@@ -57,7 -58,8 +58,9 @@@
  #include <linux/slab.h>
  #include <linux/io.h>
  #include <linux/goldfish.h>
 +#include <linux/dma-mapping.h>
+ #include <linux/mm.h>
+ #include <linux/acpi.h>
  
  /*
   * IMPORTANT: The following constants must match the ones used and defined
