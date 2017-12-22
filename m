From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: linux-next: manual merge of the omap tree with the keystone tree
Date: Thu, 21 Dec 2017 17:58:59 -0800
Message-ID: <2ec2df22-0f65-daf1-fe20-2dc3ad75f9cd@oracle.com>
References: <20171222084545.5bab63b5@canb.auug.org.au>
 <20171221231253.GX3875@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:45738 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755153AbdLVB7L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Dec 2017 20:59:11 -0500
In-Reply-To: <20171221231253.GX3875@atomide.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Lindgren <tony@atomide.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>

On 12/21/2017 3:12 PM, Tony Lindgren wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> [171221 21:48]:
>> Hi Tony,
>>
>> Today's linux-next merge of the omap tree got a conflict in:
>>
>>    arch/arm/configs/multi_v7_defconfig
>>
>> between commit:
>>
>>    d3b15c54ed7e ("ARM: config: sync multi-v7 config with keystone peripherals")
>>
>> from the keystone tree and commit:
>>
>>    d03366dcbffc ("ARM: multi_v7_defconfig: Enable CONFIG_PCI_DRA7XX (Host & Device modes)")
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
> 
> Santosh, the removal of CONFIG_PCI in multi_v7_defconfig looks a bit
> suspcicious to me, care to check if commit d3b15c54ed7e is correct?
> 
I just used savedefconfig so not sure why some of those needed ones
got knocked off. For now, I will drop the v7_defconfig patch and
post it separately later post merge window.

Regards,
Santosh
