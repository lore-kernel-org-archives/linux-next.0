From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: linux-next: Tree for December 27
Date: Mon, 27 Dec 2010 16:13:52 +0100
Message-ID: <4D18AD30.9070707@example.com>
References: <20101227170451.a9a9f873.sfr@canb.auug.org.au>	<4D18A480.2060309@example.com>	<AANLkTi=WhSP1ceHBW95n1e-gHwwnt36h3czFGuKsEny6@mail.gmail.com>	<4D18A972.1020205@example.com> <AANLkTikCeqCLmDJAnf9uT6wW+OLkRop-FJ9MDrMM_oX7@mail.gmail.com>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 63.mail-out.ovh.net ([91.121.185.56]:46043 "HELO
	63.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754022Ab0L0PN6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Dec 2010 10:13:58 -0500
In-Reply-To: <AANLkTikCeqCLmDJAnf9uT6wW+OLkRop-FJ9MDrMM_oX7@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Sedat Dilek <sedat.dilek@googlemail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 27.12.2010 16:08, Sedat Dilek wrote:
> 2010/12/27 Piotr Hosowicz<piotr@hosowicz.com>:
>> On 27.12.2010 15:48, Sedat Dilek wrote:
>>>
>>> 2010/12/27 Piotr Hosowicz<piotr@hosowicz.com>:
>>>>
>>>> On 27.12.2010 07:04, Stephen Rothwell wrote:
>>>>
>>>> Hello,
>>>>
>>>> I noticed that after first reboot with this kernel that my MP3 col=
lection
>>>> in
>>>> mocp layed on Ext4 fs opens painfully slow. It is not my mistake, =
because
>>>> I
>>>> always do it the same way, new kernel, then music on. The problem =
is not
>>>> present in rc7-git4. I could measure it in some way (timing ls -la=
 in tht
>>>> dir?) if somebody needs it.
>>>>
>>>> Regards,
>>>>
>>>> Piotr Hosowicz
>>>>
>>>
>>> You tried mblk_io_submit mount-option for that partition?
>>
>> No, I do not use it, I do not even know what it is. My options are:
>>
>> /dev/sda2 on / type ext4 (rw,errors=3Dremount-ro)
>>
>
> Have a closer look at "ext4: Turn off multiple page-io submission by =
default"

I tried to Google for mblk_io_submit but I didn't find anything helpful=
=2E=20
Could you tell me how should I add this option in fstab and what will b=
e=20
its effect?

Regards and thanks in advance,

Piotr Hosowicz

--=20
R=F3=BFnica mi=EAdzy PiS, a PO jest taka, =BFe PO nie zro-
bi=B3a liberalizacji, a PiS nie zrobi=B3 lustracji.
NP: Peter Green Splinter Group - I Can't Help Myself
NB: 2.6.37-rc7-next-20101227
