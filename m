From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: Has somethimg changed in next's Debian package generation?
Date: Fri, 09 Jul 2010 17:38:51 +0200
Message-ID: <4C37428B.8000901@example.com>
References: <4C31F5C0.2020106@example.com> <4C3732EA.7070105@example.com>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 63.mail-out.ovh.net ([91.121.185.56]:50437 "HELO
	63.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1756156Ab0GIPi4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Jul 2010 11:38:56 -0400
In-Reply-To: <4C3732EA.7070105@example.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-next@vger.kernel.org

On 09.07.2010 16:32, Piotr Hosowicz wrote:
> On 05.07.2010 17:09, Piotr Hosowicz wrote:
>> Hello,
>>
>> I build the kernel with make-kpkg under debian like:
>>
>> make-kpkg kernel_image
>>
>> I have had done it this way also with linux next. Lacking fresh sources
>> after a short break from next I tried to build today's next as always
>> but the build failed when it was to finally build the package saying
>> that there is a inconsisteny in control file. I tried to tinker a bit
>> with ./debian/control but to no effect.
>>
>> Has something changed? It used to work just like that, there were no
>> problems at all.
>
> Anybody has any advice?
>
> Thanks in advance.

I tried again, precise cmd line was:

LANG=C CONCURRENCY_LEVEL=10 make-kpkg kernel_image

I ended with:

dpkg-gencontrol: error: package linux-image-2.6.35-rc4-next-20100709 not 
in control info
make[2]: *** [debian/stamp/binary/linux-image-2.6.35-rc4-next-20100709] 
Error 255
make[2]: Leaving directory `/usr/src/linux-2.6.35-rc4-next-20100709'
make[1]: *** 
[debian/stamp/binary/pre-linux-image-2.6.35-rc4-next-20100709] Error 2
make[1]: Leaving directory `/usr/src/linux-2.6.35-rc4-next-20100709'
make: *** [kernel_image] Error 2

Can someone help me on this?

Regards,

Piotr Hosowicz

-- 
Janusz Korwin-Mikke:
"Idiota z dyplomem to taki sam idiota,
jak przedtem - tylko z pretensjami."
NP: Mark Knopfler - Cleaning My Gun
NB: 2.6.35-rc4-git4
