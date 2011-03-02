From: "Roland Vossen" <rvossen@broadcom.com>
Subject: Re: [PATCH -next] staging/brcm80211: fix printk format warnings
Date: Wed, 2 Mar 2011 15:07:20 +0100
Message-ID: <4D6E4F18.4060505@broadcom.com>
References: <20110301181119.f1c7a9c3.sfr@canb.auug.org.au>
 <20110301162948.34c28d6e.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mms1.broadcom.com ([216.31.210.17]:2449 "EHLO mms1.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751138Ab1CBOHe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Mar 2011 09:07:34 -0500
In-Reply-To: <20110301162948.34c28d6e.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "gregkh@suse.de" <gregkh@suse.de>, driverdevel <devel@driverdev.osuosl.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Arend Van Spriel <arend@broadcom.com>

> drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:1379: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
> drivers/staging/brcm80211/sys/wl_mac80211.c:1827: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
> drivers/staging/brcm80211/sys/wl_mac80211.c:1832: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
>
> Signed-off-by: Randy Dunlap<randy.dunlap@oracle.com>

Acked-by: Roland Vossen<rvossen@broadcom.com>

Thanks Randy.
