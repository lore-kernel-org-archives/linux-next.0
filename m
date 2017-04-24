From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the nvdimm
 tree
Date: Mon, 24 Apr 2017 16:47:22 +1000
Message-ID: <20170424164722.7fce4ee4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52935 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1165733AbdDXGr0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Apr 2017 02:47:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ross Zwisler <ross.zwisler@linux.intel.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/dax.c

between commit:

  52d52d6f1178 ("filesystem-dax: convert to dax_direct_access()")

from the nvdimm tree and commit:

  a865ea3e58c4 ("dax: add tracepoints to dax_writeback_mapping_range()")
  70b18baeff15 ("dax: fix regression in dax_writeback_mapping_range()")
  f18b1aa363db ("dax: add tracepoint to dax_writeback_one()")
  775c67fd4de1 ("dax: add tracepoint to dax_insert_mapping()")

from the akpm-current tree.

Thanks, Dan, for the example merge.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc fs/dax.c
index 67d900277d91,2a4e25a9f234..000000000000
--- a/fs/dax.c
+++ b/fs/dax.c
@@@ -817,8 -853,9 +823,9 @@@ static int dax_writeback_one(struct blo
  	spin_lock_irq(&mapping->tree_lock);
  	radix_tree_tag_clear(page_tree, index, PAGECACHE_TAG_DIRTY);
  	spin_unlock_irq(&mapping->tree_lock);
 -	trace_dax_writeback_one(mapping->host, index, dax.size >> PAGE_SHIFT);
 - unmap:
 -	dax_unmap_atomic(bdev, &dax);
++	trace_dax_writeback_one(mapping->host, index, size / PAGE_SIZE);
 + dax_unlock:
 +	dax_read_unlock(id);
  	put_locked_mapping_entry(mapping, index, entry);
  	return ret;
  
@@@ -874,16 -908,15 +883,16 @@@ int dax_writeback_mapping_range(struct 
  				break;
  			}
  
 -			ret = dax_writeback_one(bdev, mapping, indices[i],
 -					pvec.pages[i]);
 +			ret = dax_writeback_one(bdev, dax_dev, mapping,
 +					indices[i], pvec.pages[i]);
- 			if (ret < 0) {
- 				put_dax(dax_dev);
- 				return ret;
- 			}
+ 			if (ret < 0)
+ 				goto out;
  		}
  	}
+ out:
+ 	trace_dax_writeback_range_done(inode, start_index, end_index);
 +	put_dax(dax_dev);
- 	return 0;
+ 	return (ret < 0 ? ret : 0);
  }
  EXPORT_SYMBOL_GPL(dax_writeback_mapping_range);
  
@@@ -916,7 -941,8 +925,8 @@@ static int dax_insert_mapping(struct ad
  		return PTR_ERR(ret);
  	*entryp = ret;
  
+ 	trace_dax_insert_mapping(mapping->host, vmf, ret);
 -	return vm_insert_mixed(vma, vaddr, dax.pfn);
 +	return vm_insert_mixed(vma, vaddr, pfn);
  }
  
  /**
