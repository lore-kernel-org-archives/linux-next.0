From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the drm tree
Date: Mon, 13 Nov 2017 10:43:35 -0800
Message-ID: <917c5115-3d36-92bd-2713-5a6119fc82ca@gmail.com>
References: <20171030203756.35brom4ulrbgqesv@sirena.co.uk>
 <20171113165831.19ebc9fa@canb.auug.org.au>
 <153e4593-2ebb-c091-49c8-b8d44d5caeb5@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f50.google.com ([74.125.83.50]:43596 "EHLO
        mail-pg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753076AbdKMSni (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Nov 2017 13:43:38 -0500
In-Reply-To: <153e4593-2ebb-c091-49c8-b8d44d5caeb5@ti.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jyri Sarha <jsarha@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robherring2@gmail.com>, Rob Herring <robh@kernel.org>, ave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Mark Brown <broonie@kernel.org>, Frank Rowand <frank.rowand@sony.com>, Stephen Boyd <stephen.boyd@linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jyri,

On 11/13/17 07:40, Jyri Sarha wrote:
> On 11/13/17 07:58, Stephen Rothwell wrote:
>> Hi all,
>>
>> On Mon, 30 Oct 2017 20:37:56 +0000 Mark Brown <broonie@kernel.org> wrote:
>>>
>>> Today's linux-next merge of the devicetree tree got a conflict in:
>>>
>>>   drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>>>
>>> between commit:
>>>
>>>   44cd3939c111b7 ("drm/tilcdc: Remove redundant OF_DETACHED flag setting")
>>>
>>> from the drm tree and commit:
>>>
>>>   f948d6d8b792bb ("of: overlay: avoid race condition between applying multiple overlays")
>>>
>>> from the devicetree tree.
>>>
>>> I fixed it up (see below) and can carry the fix as necessary. This
>>> is now fixed as far as linux-next is concerned, but any non trivial
>>> conflicts should be mentioned to your upstream maintainer when your tree
>>> is submitted for merging.  You may also want to consider cooperating
>>> with the maintainer of the conflicting tree to minimise any particularly
>>> complex conflicts.
>>>
>>> diff --cc drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>>> index 482299a6f3b0,54025af534d4..000000000000
>>> --- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>>> +++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>>> @@@ -163,12 -162,8 +162,6 @@@ static struct device_node * __init tilc
>>>   		return NULL;
>>>   	}
>>>   
>>> - 	ret = of_resolve_phandles(overlay);
>>> - 	if (ret) {
>>> - 		pr_err("%s: Failed to resolve phandles: %d\n", __func__, ret);
>>> - 		return NULL;
>>> - 	}
>>>  -	of_node_set_flag(overlay, OF_DETACHED);
>>> --
>>>   	return overlay;
>>>   }
>>>   
>>
>> Just a reminder that this conflict still exists.
>>
> 
> After some consideration, I think we can drop the dts backward
> compatibility code from drm/tilcdc. It seems that it is causing a lot of
> trouble and I do not even know if anybody uses it anymore. Here is a
> patch for dropping it:
> 
> https://lists.freedesktop.org/archives/dri-devel/2017-November/157394.html
> 
> I did not plan to merge it before v4.16, but if this is a bigger problem
> I can push is right now for v4.15.
> 
> Best regards,
> Jyri
> 

The dropping patch is much appreciated.

It would make life easier for me if the patch gets into v4.15-rc.

-Frank
