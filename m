From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the ext4 tree
Date: Fri, 3 Nov 2017 17:17:13 +1100
Message-ID: <20171103171713.0f6ff1b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751891AbdKCGRP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Nov 2017 02:17:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>, Jan Kara <jack@suse.cz>

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  fs/dax.c

between commit:

  19fe5f643f89 ("iomap: Switch from blkno to disk offset")

from the ext4 tree and commit:

  cac0def9d075 ("dax: Simplify arguments of dax_insert_mapping()")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Thanks, Dan, for the heads up and sample solutions.
-- 
Cheers,
Stephen Rothwell

diff --cc fs/dax.c
index f3a44a7c14b3,78233c716757..000000000000
--- a/fs/dax.c
+++ b/fs/dax.c
@@@ -820,38 -820,42 +820,42 @@@ out
  }
  EXPORT_SYMBOL_GPL(dax_writeback_mapping_range);
  
- static int dax_insert_mapping(struct address_space *mapping,
- 		struct block_device *bdev, struct dax_device *dax_dev,
- 		sector_t sector, size_t size, void *entry,
- 		struct vm_area_struct *vma, struct vm_fault *vmf)
+ static sector_t dax_iomap_sector(struct iomap *iomap, loff_t pos)
  {
- 	unsigned long vaddr = vmf->address;
- 	void *ret, *kaddr;
 -	return iomap->blkno + (((pos & PAGE_MASK) - iomap->offset) >> 9);
++	return (iomap->addr + (pos & PAGE_MASK) - iomap->offset) >> 9;
+ }
+ 
+ static int dax_iomap_pfn(struct iomap *iomap, loff_t pos, size_t size,
+ 			 pfn_t *pfnp)
+ {
+ 	const sector_t sector = dax_iomap_sector(iomap, pos);
  	pgoff_t pgoff;
+ 	void *kaddr;
  	int id, rc;
- 	pfn_t pfn;
+ 	long length;
  
- 	rc = bdev_dax_pgoff(bdev, sector, size, &pgoff);
+ 	rc = bdev_dax_pgoff(iomap->bdev, sector, size, &pgoff);
  	if (rc)
  		return rc;
- 
  	id = dax_read_lock();
- 	rc = dax_direct_access(dax_dev, pgoff, PHYS_PFN(size), &kaddr, &pfn);
- 	if (rc < 0) {
- 		dax_read_unlock(id);
- 		return rc;
+ 	length = dax_direct_access(iomap->dax_dev, pgoff, PHYS_PFN(size),
+ 				   &kaddr, pfnp);
+ 	if (length < 0) {
+ 		rc = length;
+ 		goto out;
  	}
+ 	rc = -EINVAL;
+ 	if (PFN_PHYS(length) < size)
+ 		goto out;
+ 	if (pfn_t_to_pfn(*pfnp) & (PHYS_PFN(size)-1))
+ 		goto out;
+ 	/* For larger pages we need devmap */
+ 	if (length > 1 && !pfn_t_devmap(*pfnp))
+ 		goto out;
+ 	rc = 0;
+ out:
  	dax_read_unlock(id);
- 
- 	ret = dax_insert_mapping_entry(mapping, vmf, entry, sector, 0);
- 	if (IS_ERR(ret))
- 		return PTR_ERR(ret);
- 
- 	trace_dax_insert_mapping(mapping->host, vmf, ret);
- 	if (vmf->flags & FAULT_FLAG_WRITE)
- 		return vm_insert_mixed_mkwrite(vma, vaddr, pfn);
- 	else
- 		return vm_insert_mixed(vma, vaddr, pfn);
+ 	return rc;
  }
  
  /*
