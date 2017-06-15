From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the wireless-drivers tree
Date: Fri, 16 Jun 2017 08:25:07 +1000
Message-ID: <20170616082507.1e824796@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42885 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751644AbdFOWZK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Jun 2017 18:25:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arend Van Spriel <arend.vanspriel@broadcom.com>

Hi all,

After merging the wireless-drivers tree, today's linux-next build
(x86_64 allmodconfig) produced this warning:

drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c: In function 'brcmf_usb_probe_phase2':
drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c:1198:2: warning: 'devinfo' may be used uninitialized in this function [-Wmaybe-uninitialized]
  mutex_unlock(&devinfo->dev_init_lock);
  ^

Introduced by commit

  6d0507a777fb ("brcmfmac: add parameter to pass error code in firmware callback")

-- 
Cheers,
Stephen Rothwell
