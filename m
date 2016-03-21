From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: linux-next: Crash in arm_pmu_device_probe() due to 'drivers/perf:
 arm_pmu: make info messages more verbose'
Date: Mon, 21 Mar 2016 08:02:43 +0100
Message-ID: <56EF9C93.1030007@de.bosch.com>
References: <56EBA3C3.10907@roeck-us.net> <56EBC7EC.6000907@de.bosch.com>
 <56EC02F1.90903@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:60840 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752569AbcCUHCs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Mar 2016 03:02:48 -0400
In-Reply-To: <56EC02F1.90903@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <private@roeck-us.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Will Deacon <will.deacon@arm.com>

On 18.03.2016 14:30, Guenter Roeck wrote:
> Hi Dirk,
>
> On 03/18/2016 02:18 AM, Dirk Behme wrote:
>> Hi Guenter,
>>
>> On 18.03.2016 07:44, Guenter Roeck wrote:
>>> Hi,
>>>
>>> I am seeing the attached crash when running a realview-pb-a8 image with
>>> realview_defconfig in qemu.
>>> bisect wasn't successful, but a commit analysis identified commit
>>> 'drivers/perf: arm_pmu: make info
>>> messages more verbose' as the culprit. Reverting this commit fixes the
>>> problem.
>>>
>>> The code roughly looks as follows.
>>>
>>> int arm_pmu_device_probe()
>>> {
>>>      ...
>>>      if (node && ..) {
>>>      } else {
>>>      }
>>>
>>>      if (ret) {
>>>                  pr_info("%s: failed to probe PMU! Error %i\n",
>>>                          node->full_name, ret);
>>>                  goto out_free;
>>>      }
>>>      ....
>>> out_free:
>>>      pr_info("%s: failed to register PMU devices! Error %i\n",
>>>                  node->full_name, ret);
>>>      ....
>>> }
>>>
>>> Note that 'node' is dereferenced even though it was previously checked
>>> if it is NULL.
>>> The configuration I am testing does not use devicetree.
>>>
>>> Can you use dev_info() instead ?
>>
>>
>> Does anything like below [1] does work for you?
>>
>> If so, could you please share the output? I.e. what it prints in your
>> non-devicetree non-pmu case?
>>
> This is what I get:
>
> hw perfevents: probing PMU on CPU 0
> armv7-pmu armv7-pmu: failed to probe PMU! Error -6
> armv7-pmu armv7-pmu: failed to register PMU devices! Error -6
>
> Another option might be to use of_node_full_name() (or even better
> both dev_info() and of_node_full_name()).
>
> Not sure though what you are looking for. '/soc/pmu_a53' doesn't
> tell (me) much either, and I am not sure I understand the context
> of the bug description. Why would the kernel try to initialize PMU
> for a CPU which isn't online ?


I have a device tree based ARMv8 Cortex A57 / Cortex A53 based system. 
The Cortex A57 are always starting fine, but based on some firmware 
issues the Cortex A53 are sometimes online, sometimes not. But enabling 
the PMUs is always in the device tree, which fails some times then, too.

With the initial non-verbose PMU error messages I needed some time to 
find out that the error messages were due to the Cortex A53 not being 
online. And I thought it would help to debug similar cases to make this 
more verbose.

Best regards

Dirk
