From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in
 em-x270.c
Date: Thu, 29 Mar 2012 10:55:07 -0400
Message-ID: <4F7477CB.5070206@windriver.com>
References: <CAP=VYLp-weNj35OHtmZ6pf5-t7OUxWREeu8r5sSOLhFYu0CppQ@mail.gmail.com> <1331244366-6147-1-git-send-email-paul.gortmaker@windriver.com> <4F732C97.2030804@compulab.co.il> <20120328152743.GW3232@opensource.wolfsonmicro.com> <4F73356D.5080401@windriver.com> <20120328161305.GZ3232@opensource.wolfsonmicro.com> <4F73437B.6070806@windriver.com> <4F7471A0.6070208@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:49224 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758657Ab2C2OzW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Mar 2012 10:55:22 -0400
In-Reply-To: <4F7471A0.6070208@compulab.co.il>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Igor Grinberg <grinberg@compulab.co.il>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, haojian.zhuang@gmail.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

On 12-03-29 10:28 AM, Igor Grinberg wrote:
> On 03/28/12 18:59, Paul Gortmaker wrote:
>> On 12-03-28 12:13 PM, Mark Brown wrote:
>>> On Wed, Mar 28, 2012 at 11:59:41AM -0400, Paul Gortmaker wrote:
>>>> On 12-03-28 11:27 AM, Mark Brown wrote:
>>>
>>>> static struct platform_device em_x270_gps_userspace_consumer = {
>>>>         .name           = "reg-userspace-consumer",
>>>>         .id             = 0,
>>>
>>>> static struct platform_device em_x270_gprs_userspace_consumer = {
>>>>         .name           = "reg-userspace-consumer",
>>>>         .id             = 1,
>>>
>>>> Note that the existing names currently don't incorporate the .id
>>>> field as a suffix, and so never were unique.
>>>
>>> No, this is just a basic part of how platform devices work - the device
>>> name is always the same and if you've got more than one of them they get
>>> different .ids.  dev_name() returns name.id, or just name if id is set
>>> to -1 indicating that there's onyl one device of a given type.
>>
>> OK, so Igor - can you simply retest the v2 patch, but make the
>> two trivial changes:
>>
>> -REGULATOR_CONSUMER(ldo3, "reg-userspace-consumer", "vcc gps");
>> +REGULATOR_CONSUMER(ldo3, "reg-userspace-consumer.0", "vcc gps");
>>
>> -REGULATOR_CONSUMER(ldo19, "reg-userspace-consumer", "vcc gprs");
>> +REGULATOR_CONSUMER(ldo19, "reg-userspace-consumer.1", "vcc gprs");
> 
> Well, I thought of this solution, but I don't like it, as it makes
> the whole thing very fragile and sensitive to the reg-userspace-consumer
> platform device registration order and count, isn't it?

Why would it be order dependent?  You can see in the above structs
that they explicitly call out an ID value -- it is _not_ chosen at
the time of registration.  So it will always be:

reg-userspace-consumer.0  -->  gps consumer
reg-userspace-consumer.1  -->  gprs consumer

At least that is my (limited) understanding, based on what
Mark was saying.

Paul.
--

> (That's why I proposed to use NULL...).
> 
> So, Mark, how do you think the above issues can be handled without
> putting NULL into the dev_name?
> 
