From: Ray Jui <rjui@broadcom.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Fri, 18 Dec 2015 09:05:46 -0800
Message-ID: <56743CEA.2070502@broadcom.com>
References: <20151218144516.77c8e052@canb.auug.org.au>
 <0C803592FC378B4E83922050AB46442A2ADB1C73@SJEXCHMB10.corp.ad.broadcom.com>
 <20151218165757.1c8d35ec@canb.auug.org.au>
 <0C803592FC378B4E83922050AB46442A2ADB1CB8@SJEXCHMB10.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw3-out.broadcom.com ([216.31.210.64]:24778 "EHLO
	mail-gw3-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932467AbbLRRFt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Dec 2015 12:05:49 -0500
In-Reply-To: <0C803592FC378B4E83922050AB46442A2ADB1CB8@SJEXCHMB10.corp.ad.broadcom.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pramod Kumar <pramodku@broadcom.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Branden <sbranden@broadcom.com>

Hi All,

Yes I also checked the original patch that Pramod sent out:

@@ -636,13 +638,13 @@ static int cygnus_gpio_register_pinconf(struct 
cygnus_gpio *chip)
  	return 0;
  }

-static void cygnus_gpio_unregister_pinconf(struct cygnus_gpio *chip)
+static void iproc_gpio_unregister_pinconf(struct iproc_gpio *chip)
  {
  	if (chip->pctl)
  		pinctrl_unregister(chip->pctl);
  }

Somehow it was not merged properly into Linus' tree? The fix is simple 
and just like Pramod proposed.

Linus, how do you want to proceed with this?

Thanks,

Ray


On 12/17/2015 10:12 PM, Pramod Kumar wrote:
> Hi Stephen,
>
> The issue I pointed out is the relevant and is fully related to the statement-
>
> " After merging the pinctrl tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:"
>
> Even I tried the build for config "arm multi_v7_defconfig" it was compile failed. After fixing this I see compilation successful. I don't think we see any more issue after this fix.
>
> Please let me know in case I should try any more compilation.
>
> Regards,
> Pramod
>
>> -----Original Message-----
>> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
>> Sent: 18 December 2015 11:28
>> To: Pramod Kumar
>> Cc: Linus Walleij; linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Ray
>> Jui; Scott Branden
>> Subject: Re: linux-next: build failure after merge of the pinctrl tree
>>
>> Hi Pramod,
>>
>> On Fri, 18 Dec 2015 05:34:58 +0000 Pramod Kumar
>> <pramodku@broadcom.com> wrote:
>>>
>>> Hi Stephen/Linus,
>>>
>>> Please suggest us how could we fix this issue.
>>
>> I think you issue is different from what I reported, What I reported was caused
>> by the addition of the dependency on COMPILE_TEST which allowed the driver
>> to be built on architectures/platforms that do not have the needed definitions.
>>
>> --
>> Cheers,
>> Stephen Rothwell                    sfr@canb.auug.org.au
>
