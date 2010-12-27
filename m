From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: linux-next: Tree for December 27
Date: Mon, 27 Dec 2010 16:45:38 +0100
Message-ID: <4D18B4A2.1030107@example.com>
References: <20101227170451.a9a9f873.sfr@canb.auug.org.au>	<4D18A480.2060309@example.com>	<AANLkTi=WhSP1ceHBW95n1e-gHwwnt36h3czFGuKsEny6@mail.gmail.com>	<4D18A972.1020205@example.com> <AANLkTikCeqCLmDJAnf9uT6wW+OLkRop-FJ9MDrMM_oX7@mail.gmail.com> <4D18AD30.9070707@example.com>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 63.mail-out.ovh.net ([91.121.185.56]:42181 "HELO
	63.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754213Ab0L0Ppl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Dec 2010 10:45:41 -0500
In-Reply-To: <4D18AD30.9070707@example.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: piotr@hosowicz.com
Cc: sedat.dilek@gmail.com, Sedat Dilek <sedat.dilek@googlemail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 27.12.2010 16:13, Piotr Hosowicz wrote:
> On 27.12.2010 16:08, Sedat Dilek wrote:
>> 2010/12/27 Piotr Hosowicz<piotr@hosowicz.com>:
>>> On 27.12.2010 15:48, Sedat Dilek wrote:
>>>>
>>>> 2010/12/27 Piotr Hosowicz<piotr@hosowicz.com>:
>>>>>
>>>>> On 27.12.2010 07:04, Stephen Rothwell wrote:
>>>>>
>>>>> Hello,
>>>>>
>>>>> I noticed that after first reboot with this kernel that my MP3
>>>>> collection
>>>>> in
>>>>> mocp layed on Ext4 fs opens painfully slow. It is not my mistake,
>>>>> because
>>>>> I
>>>>> always do it the same way, new kernel, then music on. The problem
>>>>> is not
>>>>> present in rc7-git4. I could measure it in some way (timing ls -l=
a
>>>>> in tht
>>>>> dir?) if somebody needs it.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Piotr Hosowicz
>>>>>
>>>>
>>>> You tried mblk_io_submit mount-option for that partition?
>>>
>>> No, I do not use it, I do not even know what it is. My options are:
>>>
>>> /dev/sda2 on / type ext4 (rw,errors=3Dremount-ro)
>>>
>>
>> Have a closer look at "ext4: Turn off multiple page-io submission by
>> default"
>
> I tried to Google for mblk_io_submit but I didn't find anything helpf=
ul.
> Could you tell me how should I add this option in fstab and what will=
 be
> its effect?

As far as I understand that option regards writing, not reading. The=20
symptoms I described occured while reading only.

Regards,

Piotr Hosowicz

--=20
TV: "W tej chwili, =BFe si=EA tak wyra=BF=EA, zaliczonych mamy 17 zawod=
niczek."
NP: Peter Green Splinter Group - Say That You Want To
NB: 2.6.37-rc7-next-20101227
