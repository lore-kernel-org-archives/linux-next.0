From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the staging tree
Date: Wed, 10 Jan 2018 07:18:30 +1100
Message-ID: <20180110071830.6c7ccd1f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51149 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750788AbeAIUSd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Jan 2018 15:18:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Greg,

Commits

  97c6166001ef ("Staging: rtlwifi: Remove unused variable and the code")
  357f862bd214 ("staging: comedi: adv_pci1760: fix typo in comments")
  23cb746b5e9d ("staging: rtl8192u: Replace mdelay with msleep in rtl8192_usb_probe")
  beac4303532f ("Staging: vt6656: Fix unnecessary 'out of memory' message")

are missing a Signed-off-by from their committer.

-- 
Cheers,
Stephen Rothwell
