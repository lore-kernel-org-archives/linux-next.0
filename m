From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the scsi-mkp tree with the char-misc
 tree
Date: Fri, 7 Apr 2017 15:33:51 +1000
Message-ID: <20170407153351.0ecafd59@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58745 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752083AbdDGFdx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 Apr 2017 01:33:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <Bart.VanAssche@sandisk.com>, Logan Gunthorpe <logang@deltatee.com>

Hi Martin,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/osd/osd_uld.c

between commit:

  ac1ddc584e98 ("scsi: utilize new cdev_device_add helper function")

from the char-misc tree and commit:

  c02465fa13b6 ("scsi: osd_uld: Check scsi_device_get() return value")

from the scsi-mkp tree.

I am not sure how to resolve this, so I have just effectively recerted
the latter commit fo today.  Better suggestions welcome.

I fixed it up and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
