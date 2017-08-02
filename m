From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Thu, 3 Aug 2017 06:37:43 +1000
Message-ID: <20170803063743.1d50a5d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57617 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751991AbdHBUhq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Aug 2017 16:37:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

Hi Darren,

Commits

  890f658c101d ("platform/x86: peaq-wmi: silence a static checker warning")
  6d8d55626296 ("platform/x86: msi-wmi: remove unnecessary static in msi_wmi_notify()")
  cd0223c64c60 ("platform/x86: ibm_rtl: remove unnecessary static in ibm_rtl_write()")

are missing Signed-off-by's from their commiter.

-- 
Cheers,
Stephen Rothwell
