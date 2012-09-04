From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] extcon: extcon-arizona depends on INPUT
Date: Tue, 04 Sep 2012 16:51:00 -0700
Message-ID: <504693E4.8050808@xenotime.net>
References: <20120824172820.ee0f412d2944b08789414207@canb.auug.org.au> <5037B41C.6040703@xenotime.net> <503AB70E.2000407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy12-pub.bluehost.com ([50.87.16.10]:43536 "HELO
	oproxy12-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753271Ab2IDXvU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 19:51:20 -0400
In-Reply-To: <503AB70E.2000407@samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On 08/26/2012 04:53 PM, Chanwoo Choi wrote:

> On 08/25/2012 02:04 AM, Randy Dunlap wrote:
> 
>> From: Randy Dunlap <rdunlap@xenotime.net>
>>
>> extcon-arizona uses input_*() functions so it should depend
>> on INPUT.
>>
>> ERROR: "input_event" [drivers/extcon/extcon-arizona.ko] undefined!
>> ERROR: "input_free_device" [drivers/extcon/extcon-arizona.ko] undefined!
>> ERROR: "input_register_device" [drivers/extcon/extcon-arizona.ko] undefined!
>> ERROR: "input_set_capability" [drivers/extcon/extcon-arizona.ko] undefined!
>> ERROR: "input_allocate_device" [drivers/extcon/extcon-arizona.ko] undefined!
>> ERROR: "input_unregister_device" [drivers/extcon/extcon-arizona.ko] undefined!
>>
>> Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
>> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Cc: Chanwoo Choi <cw00.choi@samsung.com>
>> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
>> ---
> 
> Thanks much,
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> 
> I will apply this patch to
> http://10.90.51.51/cgi-bin/gitweb.cgi?p=linux-samsung;a=shortlog;h=refs/heads/extcon-for-next
> and you can check it after some hours.

Hi,
This build error still happens in linux-next of 20120904.

Can we get the patch merged for linux-next?

thanks,
-- 
~Randy
