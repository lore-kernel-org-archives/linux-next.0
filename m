From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb-gadget tree with the
 usb-gadget-fixes tree
Date: Wed, 20 Apr 2016 13:28:02 +1000
Message-ID: <20160420132802.681072b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56661 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932120AbcDTD2G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Apr 2016 23:28:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felipe Balbi <balbi@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Du, Changbin" <changbin.du@intel.com>

Hi Felipe,

Today's linux-next merge of the usb-gadget tree got a conflict in:

  drivers/usb/dwc3/debugfs.c

between commit:

  e6bdf8195b4a ("usb: dwc3: fix memory leak of dwc->regset")

from the usb-gadget-fixes tree and commit:

  4e9f311833a9 ("usb: dwc3: make dwc3_debugfs_init return value be void")

from the usb-gadget tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/usb/dwc3/debugfs.c
index cebf9e38b60a,6c14f653dc9b..000000000000
--- a/drivers/usb/dwc3/debugfs.c
+++ b/drivers/usb/dwc3/debugfs.c
@@@ -661,29 -956,16 +956,14 @@@ void dwc3_debugfs_init(struct dwc3 *dwc
  			IS_ENABLED(CONFIG_USB_DWC3_GADGET)) {
  		file = debugfs_create_file("testmode", S_IRUGO | S_IWUSR, root,
  				dwc, &dwc3_testmode_fops);
- 		if (!file) {
- 			ret = -ENOMEM;
- 			goto err2;
- 		}
- 
- 		file = debugfs_create_file("link_state", S_IRUGO | S_IWUSR, root,
- 				dwc, &dwc3_link_state_fops);
- 		if (!file) {
- 			ret = -ENOMEM;
- 			goto err2;
- 		}
- 	}
 -		if (!file)
 -			dev_dbg(dwc->dev, "Can't create debugfs testmode\n");
  
- 	return 0;
+ 		file = debugfs_create_file("link_state", S_IRUGO | S_IWUSR,
+ 				root, dwc, &dwc3_link_state_fops);
+ 		if (!file)
+ 			dev_dbg(dwc->dev, "Can't create debugfs link_state\n");
  
- err2:
- 	kfree(dwc->regset);
- 
- err1:
- 	debugfs_remove_recursive(root);
- 
- err0:
- 	return ret;
+ 		dwc3_debugfs_create_endpoint_dirs(dwc, root);
+ 	}
  }
  
  void dwc3_debugfs_exit(struct dwc3 *dwc)
