From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the edac-amd tree with the edac tree
Date: Mon, 28 Nov 2016 14:37:26 +1100
Message-ID: <20161128143726.7fda1849@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754070AbcK1Dh2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Nov 2016 22:37:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Borislav,

Today's linux-next merge of the edac-amd tree got a conflict in:

  drivers/edac/edac_mc.c

between commit:

  ef91afa61088 ("edac: move documentation from edac_mc.c to edac_core.h")

from the edac tree and commit:

  c73e8833bec5 ("EDAC, mc: Fix locking around mc_devices list")

from the edac-amd tree.

I fixed it up (see below - there may be more fixes needed in
edac_core.h) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/edac/edac_mc.c
index d50653d36918,d2ea9c4f1824..000000000000
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@@ -470,6 -499,24 +470,17 @@@ static struct mem_ctl_info *__find_mci_
  
  	return NULL;
  }
+ 
 -/**
 - * find_mci_by_dev
 - *
 - *	scan list of controllers looking for the one that manages
 - *	the 'dev' device
 - * @dev: pointer to a struct device related with the MCI
 - */
+ struct mem_ctl_info *find_mci_by_dev(struct device *dev)
+ {
+ 	struct mem_ctl_info *ret;
+ 
+ 	mutex_lock(&mem_ctls_mutex);
+ 	ret = __find_mci_by_dev(dev);
+ 	mutex_unlock(&mem_ctls_mutex);
+ 
+ 	return ret;
+ }
  EXPORT_SYMBOL_GPL(find_mci_by_dev);
  
  /*
@@@ -599,10 -646,18 +610,12 @@@ static int del_mc_from_global_list(stru
  	return handlers;
  }
  
 -/**
 - * edac_mc_find: Search for a mem_ctl_info structure whose index is 'idx'.
 - *
 - * If found, return a pointer to the structure.
 - * Else return NULL.
 - */
  struct mem_ctl_info *edac_mc_find(int idx)
  {
+ 	struct mem_ctl_info *mci = NULL;
  	struct list_head *item;
- 	struct mem_ctl_info *mci;
+ 
+ 	mutex_lock(&mem_ctls_mutex);
  
  	list_for_each(item, &mc_devices) {
  		mci = list_entry(item, struct mem_ctl_info, link);
