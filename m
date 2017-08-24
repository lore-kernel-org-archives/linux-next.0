From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: linux-next: build warning after merge of the phy-next tree
Date: Thu, 24 Aug 2017 13:31:43 +0530
Message-ID: <a5d1d4a4-e19f-d92b-f985-81683a933933@ti.com>
References: <20170822150733.32c8514c@canb.auug.org.au>
 <20170824152335.7d9977e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:63296 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751208AbdHXICD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Aug 2017 04:02:03 -0400
In-Reply-To: <20170824152335.7d9977e8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Crispin <john@phrozen.org>, Harvey Hunt <harvey.hunt@imgtec.com>

Stephen,

On Thursday 24 August 2017 10:53 AM, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Tue, 22 Aug 2017 15:07:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi Kishon,
>>
>> After merging the phy-next tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> drivers/phy/ralink/phy-ralink-usb.c: In function 'ralink_usb_phy_probe':
>> drivers/phy/ralink/phy-ralink-usb.c:195:13: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>>   phy->clk = (u32) match->data;
>>              ^
>>
>> Introduced by commit
>>
>>   2411a736ff09 ("phy: ralink-usb: add driver for Mediatek/Ralink")
> 
> I now get this warning after merging the usb tree ...

I've now sent a patch from Arnd to fix it.

Thanks
Kishon
