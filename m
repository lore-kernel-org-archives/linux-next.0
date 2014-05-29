From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: linux-next build failure on m68k in nfs code
Date: Thu, 29 May 2014 15:40:35 -0400
Message-ID: <53878D33.80107@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:57783 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753929AbaE2Tkk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 May 2014 15:40:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: dros@primarydata.com, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Trond,

I'm seeing this on today's linux-next with m68k allmodconfig:

ERROR: "__umoddi3" [fs/nfs/nfs_layout_nfsv41_files.ko] undefined!
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2

Making this obviously incorrect change makes it go away:


        /* calculate remaining bytes in the current stripe */
-       stripe_offset = ((u64)req_offset(req) - segment_offset) % stripe_unit;
+       stripe_offset = 0; // ((u64)req_offset(req) - segment_offset) % stripe_unit;


The line above comes from:

commit fa1165eda0eeaee57c292df3af1c98e10223f0f5
Author: Weston Andros Adamson <dros@primarydata.com>
Date:   Thu May 15 11:56:56 2014 -0400

    pnfs: filelayout: support non page aligned layouts

Looks like it needs to use the proper 64bit math wrappers.

Thanks,
Paul.
