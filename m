From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for December 18 (patch: kernel-doc notation)
Date: Thu, 18 Dec 2008 16:14:37 -0800
Message-ID: <20081218161437.fe2d2675.randy.dunlap@oracle.com>
References: <20081218230637.c879a046.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:24364 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750888AbYLSAU2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Dec 2008 19:20:28 -0500
In-Reply-To: <20081218230637.c879a046.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Chinner <david@fromorbit.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

fs/inode.c and mm/filemap.c need kernel-doc fixes.

What tree were these merged into for linux-next?
How do I get these doc fixes merged?  (2 patches below)

---

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix fs/inode.c kernel-doc function parameters:

Warning(linux-next-20081218//fs/inode.c:120): No description found for parameter 'sb'
Warning(linux-next-20081218//fs/inode.c:120): No description found for parameter 'inode'
Warning(linux-next-20081218//fs/inode.c:588): No description found for parameter 'sb'
Warning(linux-next-20081218//fs/inode.c:588): No description found for parameter 'inode'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Dave Chinner <david@fromorbit.com>
---
 fs/inode.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20081218.orig/fs/inode.c
+++ linux-next-20081218/fs/inode.c
@@ -110,8 +110,8 @@ static void wake_up_inode(struct inode *
 
 /**
  * inode_init_always - perform inode structure intialisation
- * @sb		- superblock inode belongs to.
- * @inode	- inode to initialise
+ * @sb: superblock inode belongs to
+ * @inode: inode to initialise
  *
  * These are initializations that need to be done on every inode
  * allocation as the fields are not initialised by slab allocation.
@@ -574,8 +574,8 @@ __inode_add_to_lists(struct super_block 
 
 /**
  * inode_add_to_lists - add a new inode to relevant lists
- * @sb		- superblock inode belongs to.
- * @inode	- inode to mark in use
+ * @sb: superblock inode belongs to
+ * @inode: inode to mark in use
  *
  * When an inode is allocated it needs to be accounted for, added to the in use
  * list, the owning superblock and the inode hash. This needs to be done under

---

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix mm/filemap.c functions' kernel-doc:

Warning(/local/linsrc/linux-next-20081218//mm/filemap.c:575): No description found for parameter 'page'
Warning(/local/linsrc/linux-next-20081218//mm/filemap.c:575): No description found for parameter 'waiter'
Warning(/local/linsrc/linux-next-20081218//mm/filemap.c:2348): No description found for parameter 'mapping'
Warning(/local/linsrc/linux-next-20081218//mm/filemap.c:2348): No description found for parameter 'index'
Warning(/local/linsrc/linux-next-20081218//mm/filemap.c:2348): No description found for parameter 'source'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Dave Chinner <david@fromorbit.com>
---
 mm/filemap.c |   13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

--- linux-next-20081218.orig/mm/filemap.c
+++ linux-next-20081218/mm/filemap.c
@@ -566,8 +566,8 @@ EXPORT_SYMBOL(wait_on_page_bit);
 
 /**
  * add_page_wait_queue - Add an arbitrary waiter to a page's wait queue
- * @page - Page defining the wait queue of interest
- * @waiter - Waiter to add to the queue
+ * @page: Page defining the wait queue of interest
+ * @waiter: Waiter to add to the queue
  *
  * Add an arbitrary @waiter to the wait queue for the nominated @page.
  */
@@ -2328,11 +2328,10 @@ generic_file_buffered_write(struct kiocb
 EXPORT_SYMBOL(generic_file_buffered_write);
 
 /**
- * generic_file_buffered_write_one_page - Write a single page of data to an
- *	inode
- * @mapping - The address space of the target inode
- * @index - The target page in the target inode to fill
- * @source - The data to write into the target page
+ * generic_file_buffered_write_one_page - Write a single page of data to an inode
+ * @mapping: The address space of the target inode
+ * @index: The target page in the target inode to fill
+ * @source: The data to write into the target page
  *
  * Write the data from the source page to the page in the nominated address
  * space at the @index specified.  Note that the file will not be extended if
