From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next not booting on snowball
Date: Fri, 02 Dec 2011 00:06:39 +0100
Message-ID: <4ED8087F.7030507@linaro.org>
References: <4ED79454.1090304@linaro.org> <20111201145801.GB2103@sirena.org.uk> <4ED79E9F.7060103@linaro.org> <alpine.LFD.2.02.1112011400380.2357@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:32839 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755487Ab1LAXGq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2011 18:06:46 -0500
Received: by eaak14 with SMTP id k14so2763926eaa.19
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2011 15:06:45 -0800 (PST)
In-Reply-To: <alpine.LFD.2.02.1112011400380.2357@xanadu.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Lists Linaro-dev <linaro-dev@lists.linaro.org>, Stephen Warren <swarren@nvidia.com>, Kevin Hilman <khilman@ti.com>, Jamie Iles <jamie@jamieiles.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/01/2011 08:03 PM, Nicolas Pitre wrote:
> On Thu, 1 Dec 2011, Daniel Lezcano wrote:
> 
>> On 12/01/2011 03:58 PM, Mark Brown wrote:
>>> On Thu, Dec 01, 2011 at 03:51:00PM +0100, Daniel Lezcano wrote:
>>>
>>>> commit 549158d2ab01e8370d2773044fe09738a26f7086
>>>> Author: Nicolas Pitre <nicolas.pitre@linaro.org>
>>>> Date:   Thu Aug 25 00:35:59 2011 -0400
>>>
>>>>     ARM: move iotable mappings within the vmalloc region
>>>>    
>>>
>>> I recently reported an issue with this patch on s3c64xx which I'm
>>> avoiding with the below change, I believe Nicolas folded this in to his
>>> code but it's not propagated into -next yet.
>>>
> [...]
>>
>> Thanks for the patch Mark. I applied it and tried to boot but the kernel
>> is still stuck on the same place :(
> 
> Please have a look at this email:
> 
> http://article.gmane.org/gmane.linux.ports.arm.kernel/141386
> 
> There are two patches in there which should help you get some debugging 
> info out.


Thanks Nicolas,

I have applied the patches and I get:

- ---------------------

<6>Booting Linux on physical CPU 0
<6>Initializing cgroup subsys cpuset
<6>Initializing cgroup subsys cpu
<5>Linux version 3.2.0-rc2+ (dlezcano@monster) (gcc version 4.3.2
(Debian 4.3.2-1.1) ) #7 SMP PREEMPT Thu Dec 1 2
3:58:34 CET 2011
CPU: ARMv7 Processor [412fc091] revision 1 (ARMv7), cr=10c5387f
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
Machine: Calao Systems Snowball platform
<4>Ignoring unrecognised tag 0x41000403
Memory policy: ECC disabled, Data cache writealloc

- ---------------------

I am not able to understand these informations, I hope they can help to
understand the problem.

Is there something else I can do to help ?

Thanks
  -- Daniel

- -- 
 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJO2Ah/AAoJEAKBbMCpUGYAef0H/2eV0xJKDtt1sQDOEDqKx3HS
dOK4p//Q7niWVWXl2JXC3x39qBRHg4SDf/jc5nFmUBjbOZQDsiwGujQ9B0bI3yMR
Ozm5Uirv8L1jMdfhzDJQAG5OqFzOoNCX2RE9bYrrKssUb6z1QCPYi0HgGo8Wf4KL
N2T+naSZb1Pe/tIj9A7FK7HC/hjoMwBpdKXfM2IG6QT2sTo3BmTTrkuY8OD6avJ9
V1sWV2pX4oxp4RNOZVqkr6A8Lpcjy/x3GYe3vLVFuXkBTbFhhDRnaXSezCKNrx0X
bMlNXBt8lrqB37ifW61ISww9ec9b6jViXYs1ksByIdeIJPQ0dJPgGbRPrJORp40=
=d9/Y
-----END PGP SIGNATURE-----
