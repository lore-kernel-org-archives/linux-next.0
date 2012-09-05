From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] bus: fix omap compile error if CONFIG_OF is true
Date: Tue, 4 Sep 2012 17:05:16 -0700
Message-ID: <CAOesGMiKu3=1P1tyGdMY9fFg1W8sjPV8i3CGX6c6nUS0UMz9rQ@mail.gmail.com>
References: <20120904144123.25261.79625.stgit@localhost.localdomain>
	<5046770E.1010206@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:39148 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751980Ab2IEAFQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 20:05:16 -0400
Received: by pbbrr13 with SMTP id rr13so292pbb.19
        for <linux-next@vger.kernel.org>; Tue, 04 Sep 2012 17:05:16 -0700 (PDT)
In-Reply-To: <5046770E.1010206@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, kishon@ti.com, linux-next@vger.kernel.org

On Tue, Sep 4, 2012 at 2:47 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On 09/04/2012 07:41 AM, Alan Cox wrote:
>
>> From: Alan Cox <alan@linux.intel.com>
>>
>> Signed-off-by: Alan Cox <alan@linux.intel.com>
>> ---
>>
>>  drivers/bus/omap-ocp2scp.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/omap-ocp2scp.c b/drivers/bus/omap-ocp2scp.c
>> index 9075ef8..ff63560 100644
>> --- a/drivers/bus/omap-ocp2scp.c
>> +++ b/drivers/bus/omap-ocp2scp.c
>> @@ -67,7 +67,7 @@ static const struct of_device_id omap_ocp2scp_id_table[] = {
>>       { .compatible = "ti,omap-ocp2scp" },
>>       {}
>>  };
>> -MODULE_DEVICE_TABLE(of, omap_usb2_id_table);
>> +MODULE_DEVICE_TABLE(of, omap_ocp2scp_id_table);
>>  #endif
>>
>>  static struct platform_driver omap_ocp2scp_driver = {
>>
>> --
>
>
> Kishon posted a patch for this on Aug. 23:
> http://marc.info/?l=linux-next&m=134574365000518&w=2
>
> Who needs to merge it?

I've applied the first patch to arm-soc, since that's where the
breakage was introduced. Pushing out shortly.


-Olof
