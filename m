From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next not booting on snowball
Date: Mon, 12 Dec 2011 16:41:59 +0100
Message-ID: <4EE620C7.2020405@linaro.org>
References: <4ED79454.1090304@linaro.org> <20111201145801.GB2103@sirena.org.uk>	<4ED79E9F.7060103@linaro.org>	<alpine.LFD.2.02.1112011400380.2357@xanadu.home>	<4ED8087F.7030507@linaro.org>	<alpine.LFD.2.02.1112011856310.2357@xanadu.home> <4ED90B6F.6050205@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:33517 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751026Ab1LLPmf (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Dec 2011 10:42:35 -0500
Received: by lagp5 with SMTP id p5so1972062lag.19
        for <linux-next@vger.kernel.org>; Mon, 12 Dec 2011 07:42:33 -0800 (PST)
In-Reply-To: <4ED90B6F.6050205@linaro.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Kevin Hilman <khilman@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-next@vger.kernel.org, Jamie Iles <jamie@jamieiles.com>, Lists Linaro-dev <linaro-dev@lists.linaro.org>


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/02/2011 06:31 PM, Daniel Lezcano wrote:
> On 12/02/2011 01:11 AM, Nicolas Pitre wrote:
>> On Fri, 2 Dec 2011, Daniel Lezcano wrote:
>
>>> On 12/01/2011 08:03 PM, Nicolas Pitre wrote:
>>>> Please have a look at this email:
>>>>
>>>> http://article.gmane.org/gmane.linux.ports.arm.kernel/141386
>>>>
>>>> There are two patches in there which should help you get
>>>> some
> debugging
>>>> info out.
>>>
>>>
>>> Thanks Nicolas,
>>>
>>> I have applied the patches and I get:
>>>
>>> ---------------------
>>>
>>> <6>Booting Linux on physical CPU 0 <6>Initializing cgroup
>>> subsys cpuset <6>Initializing cgroup subsys cpu <5>Linux
>>> version 3.2.0-rc2+ (dlezcano@monster) (gcc version 4.3.2
>>> (Debian 4.3.2-1.1) ) #7 SMP PREEMPT Thu Dec 1 2 3:58:34 CET
>>> 2011 CPU: ARMv7 Processor [412fc091] revision 1 (ARMv7),
>>> cr=3D10c5387f CPU: PIPT / VIPT nonaliasing data cache, VIPT
>>> aliasing
> instruction cache
>>> Machine: Calao Systems Snowball platform <4>Ignoring
>>> unrecognised tag 0x41000403 Memory policy: ECC disabled, Data
>>> cache writealloc
>>>
>>> ---------------------
>>>
>>> I am not able to understand these informations, I hope they
>>> can
> help to
>>> understand the problem.
>>>
>>> Is there something else I can do to help ?
>
>> Yes. Either you have access to a fancy debugger and then you
>> could trace what happens from the moment devicemaps_init() is
>> entered.
>
>> Or, using the good old way, just insert a couple of
>
>> printk("%s:%s line %d\n", __FILE__, __func__, __LINE__);
>
>> in a couple places (still with the 2 earlier patches applied).
>> Good locations for those traces would be:
>
>> - Upon entering devicemaps_init() to confirm it makes that far.
>
>> - Just before and right after the call to mdesc->map_io(), still
>> in devicemaps_init().
>
>> - If you don't see the trace after mdesc->map_io(), then the
> problem is
>> most likely in u8500_map_io(), in which case you should add more
>> traces in there to narrow the problem area down to the
>> problematic call.
>
> The kernel hangs at:
>
> u8500_map_io -> ux500_map_io -> ux500_read_asicid(addr=3D9001dbf4),
> base=3D9001d000 -> readl(__io_address(9001dbf4)=3Df901dbf4);
>
> But when I try with the next patch in the git where it supposed to
> boot, the hang appears at the same place :/
>
> Any ideas ?

Does anyone have some clues or ideas I can investigate ?
I am really not familiar with this part.

- --=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJO5iDGAAoJEAKBbMCpUGYAEPkIAJbmVV3Hmy/i7Yxn8OaKZbWA
hP9iGyM4IvN8VxuXCAKhUu43ykNQKJCpkdPB6M5GTSwZ+So6lZ1hAR3Hx8cxXz7c
R2BPVkrhsnMMH05cABJ7D8KHdLAdcs6X6IDl/8AfU15hvcgAia9hohPdh+xF4xTA
kPxVeqavU3qD0bea3tNwg/XD4yLTMzUtX6eAtoBzBxYReoTK8hRFyVLgSqhf+yH5
OiL4nvoIxmDzn9nagHEwILHQBqleXuurubeWRPPmJ8qXOTA7nwtQ+Ut8gJU35OTu
c0aEwkzFqW2XXFN5/Saqs78fCyoBbzL4MzJJftpWZLm8UwDosE2jxXqZWaOFTWA=3D
=3D6bfu
-----END PGP SIGNATURE-----
