From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Tue, 18 Apr 2017 15:32:20 +1000
Message-ID: <20170418153220.734e83f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42493 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750723AbdDRFcX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Apr 2017 01:32:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alan Cox <alan@linux.intel.com>

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

make[7]: *** No rule to make target 'drivers/staging/media/atomisp/pci/atomisp2/css2400/isp/kernels/uds/uds_1.0/ia_css_uds.host.o', needed by 'drivers/staging/media/atomisp/pci/atomisp2/atomisp.o'.  Stop.

Caused by commit

  7afe8f84f793 ("atomisp: remove UDS kernel code")

I have used the staging tree from next-20170413 for today.

-- 
Cheers,
Stephen Rothwell
