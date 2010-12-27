From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for December 27
Date: Mon, 27 Dec 2010 17:16:40 +0100
Message-ID: <AANLkTim1Cj1rbgnFr6C7==UP+jiriJ55Kcu9wmgd+DKh@mail.gmail.com>
References: <20101227170451.a9a9f873.sfr@canb.auug.org.au>
	<4D18A480.2060309@example.com>
	<AANLkTi=WhSP1ceHBW95n1e-gHwwnt36h3czFGuKsEny6@mail.gmail.com>
	<4D18A972.1020205@example.com>
	<AANLkTikCeqCLmDJAnf9uT6wW+OLkRop-FJ9MDrMM_oX7@mail.gmail.com>
	<4D18AD30.9070707@example.com>
	<4D18B4A2.1030107@example.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:56555 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754247Ab0L0QQl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Dec 2010 11:16:41 -0500
In-Reply-To: <4D18B4A2.1030107@example.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: piotr@hosowicz.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

2010/12/27 Piotr Hosowicz <piotr@hosowicz.com>:
> On 27.12.2010 16:13, Piotr Hosowicz wrote:
>>
>> On 27.12.2010 16:08, Sedat Dilek wrote:
>>>
>>> 2010/12/27 Piotr Hosowicz<piotr@hosowicz.com>:
>>>>
>>>> On 27.12.2010 15:48, Sedat Dilek wrote:
>>>>>
>>>>> 2010/12/27 Piotr Hosowicz<piotr@hosowicz.com>:
>>>>>>
>>>>>> On 27.12.2010 07:04, Stephen Rothwell wrote:
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> I noticed that after first reboot with this kernel that my MP3
>>>>>> collection
>>>>>> in
>>>>>> mocp layed on Ext4 fs opens painfully slow. It is not my mistake,
>>>>>> because
>>>>>> I
>>>>>> always do it the same way, new kernel, then music on. The problem
>>>>>> is not
>>>>>> present in rc7-git4. I could measure it in some way (timing ls -la
>>>>>> in tht
>>>>>> dir?) if somebody needs it.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Piotr Hosowicz
>>>>>>
>>>>>
>>>>> You tried mblk_io_submit mount-option for that partition?
>>>>
>>>> No, I do not use it, I do not even know what it is. My options are:
>>>>
>>>> /dev/sda2 on / type ext4 (rw,errors=remount-ro)
>>>>
>>>
>>> Have a closer look at "ext4: Turn off multiple page-io submission by
>>> default"
>>
>> I tried to Google for mblk_io_submit but I didn't find anything helpful.
>> Could you tell me how should I add this option in fstab and what will be
>> its effect?
>
> As far as I understand that option regards writing, not reading. The
> symptoms I described occured while reading only.
>

That's the only performance issue I am aware of in ext4 in recent time.
Why don't you try it and present some numbers in transfer ratio (write, read)?

- Sedat -
