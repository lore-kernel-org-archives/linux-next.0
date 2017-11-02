From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Thu, 2 Nov 2017 15:30:15 +1100
Message-ID: <20171102153015.6d939935@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34085 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750703AbdKBEaR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 00:30:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Georgiana Chelu <georgiana.chelu93@gmail.com>, Aishwarya Pant <aishpant@gmail.com>

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo.c

between commit:

  309167b966b6 ("media: staging: atomisp: cleanup out of memory messages")

from the v4l-dvb tree and commit:

  63342e75e661 ("Staging: media: atomisp: Use kmalloc_array instead of kmalloc")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo.c
index 9e957514108e,5232327f5d9c..000000000000
--- a/drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo.c
@@@ -721,10 -725,12 +721,10 @@@ static int alloc_private_pages(struct h
  
  	pgnr = bo->pgnr;
  
- 	bo->page_obj = kmalloc(sizeof(struct hmm_page_object) * pgnr,
+ 	bo->page_obj = kmalloc_array(pgnr, sizeof(struct hmm_page_object),
  				GFP_KERNEL);
 -	if (unlikely(!bo->page_obj)) {
 -		dev_err(atomisp_dev, "out of memory for bo->page_obj\n");
 +	if (unlikely(!bo->page_obj))
  		return -ENOMEM;
 -	}
  
  	i = 0;
  	alloc_pgnr = 0;
@@@ -984,13 -990,16 +984,13 @@@ static int alloc_user_pages(struct hmm_
  	struct vm_area_struct *vma;
  	struct page **pages;
  
- 	pages = kmalloc(sizeof(struct page *) * bo->pgnr, GFP_KERNEL);
+ 	pages = kmalloc_array(bo->pgnr, sizeof(struct page *), GFP_KERNEL);
 -	if (unlikely(!pages)) {
 -		dev_err(atomisp_dev, "out of memory for pages...\n");
 +	if (unlikely(!pages))
  		return -ENOMEM;
 -	}
  
- 	bo->page_obj = kmalloc(sizeof(struct hmm_page_object) * bo->pgnr,
+ 	bo->page_obj = kmalloc_array(bo->pgnr, sizeof(struct hmm_page_object),
  		GFP_KERNEL);
  	if (unlikely(!bo->page_obj)) {
 -		dev_err(atomisp_dev, "out of memory for bo->page_obj...\n");
  		kfree(pages);
  		return -ENOMEM;
  	}
@@@ -1350,9 -1363,10 +1350,9 @@@ void *hmm_bo_vmap(struct hmm_buffer_obj
  		bo->status &= ~(HMM_BO_VMAPED | HMM_BO_VMAPED_CACHED);
  	}
  
- 	pages = kmalloc(sizeof(*pages) * bo->pgnr, GFP_KERNEL);
+ 	pages = kmalloc_array(bo->pgnr, sizeof(*pages), GFP_KERNEL);
  	if (unlikely(!pages)) {
  		mutex_unlock(&bo->mutex);
 -		dev_err(atomisp_dev, "out of memory for pages...\n");
  		return NULL;
  	}
  
