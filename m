From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the nvdimm tree
Date: Mon, 4 Sep 2017 17:34:25 +1000
Message-ID: <20170904173425.5cc0e08d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Dan,

After merging the nvdimm tree, today's linux-next build (i386 defconfig)
failed like this:

drivers/dax/super.c:64:20: error: redefinition of 'fs_dax_get_by_bdev'
 struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev)
                    ^
In file included from drivers/dax/super.c:22:0:
include/linux/dax.h:76:34: note: previous definition of 'fs_dax_get_by_bdev' was here
 static inline struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev)
                                  ^ 

Caused by commit

  78f354735081 ("dax: introduce a fs_dax_get_by_bdev() helper")

The protection in drivers/dax/super.c is CONFIG_BLOCK, while in
include/linux/dax.h it is IS_ENABLED(CONFIG_FS_DAX) and the Makefile
uses CONFIG_DAX.

I have reverted that commit and the following 3 for today.

-- 
Cheers,
Stephen Rothwell
