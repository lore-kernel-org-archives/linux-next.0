From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Large new drm driver
Date: Tue, 2 May 2017 11:31:19 +1000
Message-ID: <20170502113119.106bd9db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37333 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750710AbdEBBbW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 May 2017 21:31:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>

Hi Linus,

Just so you don't get a large suprise:

$ git diff --dirstat v4.11..next-20170501
   3.9% arch/
  13.5% drivers/gpu/drm/amd/include/asic_reg/vega10/DC/
   6.0% drivers/gpu/drm/amd/include/asic_reg/vega10/GC/
  23.5% drivers/gpu/drm/amd/include/asic_reg/vega10/NBIO/
   7.5% drivers/gpu/drm/amd/include/asic_reg/vega10/
   4.9% drivers/gpu/drm/
   4.6% drivers/net/
   5.8% drivers/staging/media/atomisp/pci/atomisp2/css2400/
   3.0% drivers/staging/media/
   4.5% drivers/staging/rtl8723bs/
  12.6% drivers/

There are some very large include files in the new drm driver.

wc -l over all the files in
drivers/gpu/drm/amd/include/asic_reg/vega10/:

361003 total
-- 
Cheers,
Stephen Rothwell
