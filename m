From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 8 (staging/brcm80211)
Date: Sun, 10 Oct 2010 11:58:32 -0700
Message-ID: <20101010115832.0bf5dff8.randy.dunlap@oracle.com>
References: <20101008161552.07c9f137.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:62501 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751174Ab0JJS7a (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 10 Oct 2010 14:59:30 -0400
In-Reply-To: <20101008161552.07c9f137.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, gregkh <greg@kroah.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Brett Rudley <brudley@broadcom.com>, Henry Ptasinski <henryp@broadcom.com>, Nohee Ko <noheek@broadcom.com>

On Fri, 8 Oct 2010 16:15:52 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20101007:



drivers/staging/brcm80211/brcmfmac/dhd_linux.c:432: note: expected 'void *' but argument is of type 'sk_buff_data_t'
drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:1337: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:2120: warning: initialization from incompatible pointer type
drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:2121: warning: initialization from incompatible pointer type
drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:2122: warning: initialization from incompatible pointer type
drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:4035: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'
drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:4048: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
