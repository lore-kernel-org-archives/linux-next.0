From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the phy-next tree
Date: Thu, 24 Aug 2017 15:23:35 +1000
Message-ID: <20170824152335.7d9977e8@canb.auug.org.au>
References: <20170822150733.32c8514c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43139 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750806AbdHXFXh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Aug 2017 01:23:37 -0400
In-Reply-To: <20170822150733.32c8514c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Crispin <john@phrozen.org>, Harvey Hunt <harvey.hunt@imgtec.com>

Hi Greg,

On Tue, 22 Aug 2017 15:07:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Kishon,
> 
> After merging the phy-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/phy/ralink/phy-ralink-usb.c: In function 'ralink_usb_phy_probe':
> drivers/phy/ralink/phy-ralink-usb.c:195:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   phy->clk = (u32) match->data;
>              ^
> 
> Introduced by commit
> 
>   2411a736ff09 ("phy: ralink-usb: add driver for Mediatek/Ralink")

I now get this warning after merging the usb tree ...

-- 
Cheers,
Stephen Rothwell
