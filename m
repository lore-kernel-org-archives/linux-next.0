From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next not booting on snowball
Date: Fri, 02 Dec 2011 18:31:27 +0100
Message-ID: <4ED90B6F.6050205@linaro.org>
References: <4ED79454.1090304@linaro.org> <20111201145801.GB2103@sirena.org.uk> <4ED79E9F.7060103@linaro.org> <alpine.LFD.2.02.1112011400380.2357@xanadu.home> <4ED8087F.7030507@linaro.org> <alpine.LFD.2.02.1112011856310.2357@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:63390 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757157Ab1LBRbh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Dec 2011 12:31:37 -0500
Received: by lagp5 with SMTP id p5so284112lag.19
        for <linux-next@vger.kernel.org>; Fri, 02 Dec 2011 09:31:35 -0800 (PST)
In-Reply-To: <alpine.LFD.2.02.1112011856310.2357@xanadu.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Lists Linaro-dev <linaro-dev@lists.linaro.org>, Stephen Warren <swarren@nvidia.com>, Kevin Hilman <khilman@ti.com>, Jamie Iles <jamie@jamieiles.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/02/2011 01:11 AM, Nicolas Pitre wrote:
> On Fri, 2 Dec 2011, Daniel Lezcano wrote:
>=20
>> On 12/01/2011 08:03 PM, Nicolas Pitre wrote:
>>> Please have a look at this email:
>>>
>>> http://article.gmane.org/gmane.linux.ports.arm.kernel/141386
>>>
>>> There are two patches in there which should help you get some debug=
ging=20
>>> info out.
>>
>>
>> Thanks Nicolas,
>>
>> I have applied the patches and I get:
>>
>> ---------------------
>>
>> <6>Booting Linux on physical CPU 0
>> <6>Initializing cgroup subsys cpuset
>> <6>Initializing cgroup subsys cpu
>> <5>Linux version 3.2.0-rc2+ (dlezcano@monster) (gcc version 4.3.2
>> (Debian 4.3.2-1.1) ) #7 SMP PREEMPT Thu Dec 1 2
>> 3:58:34 CET 2011
>> CPU: ARMv7 Processor [412fc091] revision 1 (ARMv7), cr=3D10c5387f
>> CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction c=
ache
>> Machine: Calao Systems Snowball platform
>> <4>Ignoring unrecognised tag 0x41000403
>> Memory policy: ECC disabled, Data cache writealloc
>>
>> ---------------------
>>
>> I am not able to understand these informations, I hope they can help=
 to
>> understand the problem.
>>
>> Is there something else I can do to help ?
>=20
> Yes.  Either you have access to a fancy debugger and then you could=20
> trace what happens from the moment devicemaps_init() is entered.
>=20
> Or, using the good old way, just insert a couple of
>=20
> 	printk("%s:%s line %d\n", __FILE__, __func__, __LINE__);
>=20
> in a couple places (still with the 2 earlier patches applied).  Good=20
> locations for those traces would be:
>=20
>  - Upon entering devicemaps_init() to confirm it makes that far.
>=20
>  - Just before and right after the call to mdesc->map_io(), still in=20
>    devicemaps_init().
>=20
>  - If you don't see the trace after mdesc->map_io(), then the problem=
 is
>    most likely in u8500_map_io(), in which case you should add more=20
>    traces in there to narrow the problem area down to the problematic
>    call.

The kernel hangs at:

u8500_map_io
 -> ux500_map_io
   -> ux500_read_asicid(addr=3D9001dbf4), base=3D9001d000
     ->  readl(__io_address(9001dbf4)=3Df901dbf4);

But when I try with the next patch in the git where it supposed to boot=
,
the hang appears at the same place :/

Any ideas ?

Thanks

  -- Daniel

- --=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJO2QtvAAoJEAKBbMCpUGYA0QEH/1Krr4SMAeVE50+LfXpHrZny
yVWfC/ITLgghODFuP84mJV+C6yYl8RSW7Kyxz7mv5jV+oXaLrxv1sJVS/w0bxgAG
IXO/P+RmHy6hR0sUPBFjfwM4xCsuwxax/k7KiLu3Yr6h/g0tJQLU6vnZE0ZQutpk
MkvSBdJUbQuXLX76AiM4llumrRY5pqzUh7S5vJVbkq2SaTXZxM6kfX1DMXw/3XPd
awVn5Loao9AaCnjV6oKJqfF7GlTd9FMa6iZEuRA31EQlfDnsKWcITxSgjG7rmoKD
Ums47o9U3MnPtMmw+T8jaNsP7PxdcTIEJatTUbN8C/sQmllb0dX709J43y8lWBk=3D
=3Dr495
-----END PGP SIGNATURE-----
