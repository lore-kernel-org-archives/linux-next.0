From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 18 Apr 2017 09:04:44 +0200
Message-ID: <1492499084.2472.0.camel@sipsolutions.net>
References: <20170418155348.69ee48c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from s3.sipsolutions.net ([5.9.151.49]:44136 "EHLO sipsolutions.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751641AbdDRHE5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Apr 2017 03:04:57 -0400
In-Reply-To: <20170418155348.69ee48c4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>

On Tue, 2017-04-18 at 15:53 +1000, Stephen Rothwell wrote:

> Caused by commit
> 
>   554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

Oh, another new driver :)

> interacting with commit
> 
>   818a986e4eba ("cfg80211: move add/change interface monitor flags
> into params")
> 
> from the mac80211-next tree.
> 
> I have added the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 18 Apr 2017 15:43:43 +1000
> Subject: [PATCH] staging: merge fix for add/change_virtual-intf API
> change

That looks good, evidently it doesn't care about the parameter then.

Thanks!

johannes
