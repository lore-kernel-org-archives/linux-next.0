From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nfs tree with Linus' tree
Date: Thu, 2 Apr 2009 11:41:44 +1100
Message-ID: <20090402114144.66eab5c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47440 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750913AbZDBAly (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Apr 2009 20:41:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>, Nick Piggin <npiggin@suse.de>, Andrew Morton <akpm@linux-foundation.org>

Hi Trond,

Today's linux-next merge of the nfs tree got a conflict in fs/nfs/file.c
between commit c2ec175c39f62949438354f603f4aa170846aabb ("mm:
page_mkwrite change prototype to match fault") from Linus' tree and
commit e858675049961c24d12a9fb66aae6638ff30abb8 ("NFS: Add comment
banners to some NFS functions") from the nfs tree.

Just context changes.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/nfs/file.c
index 0abf3f3,caf9be4..0000000
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@@ -451,9 -478,13 +478,14 @@@ const struct address_space_operations n
  	.launder_page = nfs_launder_page,
  };
  
+ /*
+  * Notification that a PTE pointing to an NFS page is about to be made
+  * writable, implying that someone is about to modify the page through a
+  * shared-writable mapping
+  */
 -static int nfs_vm_page_mkwrite(struct vm_area_struct *vma, struct page *page)
 +static int nfs_vm_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf)
  {
 +	struct page *page = vmf->page;
  	struct file *filp = vma->vm_file;
  	struct dentry *dentry = filp->f_path.dentry;
  	unsigned pagelen;
