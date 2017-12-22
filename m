From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: linux-next: manual merge of the omap tree with the keystone tree
Date: Fri, 22 Dec 2017 11:41:27 +0530
Message-ID: <3b336c91-8416-191c-2f32-31e3e9b32318@ti.com>
References: <20171222084545.5bab63b5@canb.auug.org.au>
 <20171221231253.GX3875@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fllnx210.ext.ti.com ([198.47.19.17]:15083 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751111AbdLVGLm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Dec 2017 01:11:42 -0500
In-Reply-To: <20171221231253.GX3875@atomide.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Lindgren <tony@atomide.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Santosh Shilimkar <santosh.shilimkar@oracle.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



On Friday 22 December 2017 04:42 AM, Tony Lindgren wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> [171221 21:48]:
>> Hi Tony,
>>
>> Today's linux-next merge of the omap tree got a conflict in:
>>
>>   arch/arm/configs/multi_v7_defconfig
>>
>> between commit:
>>
>>   d3b15c54ed7e ("ARM: config: sync multi-v7 config with keystone peripherals")
>>
>> from the keystone tree and commit:
>>
>>   d03366dcbffc ("ARM: multi_v7_defconfig: Enable CONFIG_PCI_DRA7XX (Host & Device modes)")
>>
>> from the omap tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> Thanks I'll wait on this one so Kishon can check the resulting next.

omap2plus_defconfig on linux-next looks fine.

Thanks
Kishon
