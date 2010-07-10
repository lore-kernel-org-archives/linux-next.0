From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: Has somethimg changed in next's Debian package generation?
Date: Sat, 10 Jul 2010 14:54:37 +0200
Message-ID: <4C386D8D.5030407@example.com>
References: <4C31F5C0.2020106@example.com> <4C3732EA.7070105@example.com> <4C37428B.8000901@example.com>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 30.mail-out.ovh.net ([213.186.62.213]:43357 "HELO
	30.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752151Ab0GJMym (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 10 Jul 2010 08:54:42 -0400
In-Reply-To: <4C37428B.8000901@example.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-next@vger.kernel.org

On 09.07.2010 17:38, Piotr Hosowicz wrote:
> On 09.07.2010 16:32, Piotr Hosowicz wrote:
>> On 05.07.2010 17:09, Piotr Hosowicz wrote:
>>> Hello,
>>>
>>> I build the kernel with make-kpkg under debian like:
>>>
>>> make-kpkg kernel_image
>>>
>>> I have had done it this way also with linux next. Lacking fresh sou=
rces
>>> after a short break from next I tried to build today's next as alwa=
ys
>>> but the build failed when it was to finally build the package sayin=
g
>>> that there is a inconsisteny in control file. I tried to tinker a b=
it
>>> with ./debian/control but to no effect.
>>>
>>> Has something changed? It used to work just like that, there were n=
o
>>> problems at all.
>>
>> Anybody has any advice?
>>
>> Thanks in advance.
>
> I tried again, precise cmd line was:
>
> LANG=3DC CONCURRENCY_LEVEL=3D10 make-kpkg kernel_image
>
> I ended with:
>
> dpkg-gencontrol: error: package linux-image-2.6.35-rc4-next-20100709 =
not
> in control info
> make[2]: *** [debian/stamp/binary/linux-image-2.6.35-rc4-next-2010070=
9]
> Error 255
> make[2]: Leaving directory `/usr/src/linux-2.6.35-rc4-next-20100709'
> make[1]: ***
> [debian/stamp/binary/pre-linux-image-2.6.35-rc4-next-20100709] Error =
2
> make[1]: Leaving directory `/usr/src/linux-2.6.35-rc4-next-20100709'
> make: *** [kernel_image] Error 2
>
> Can someone help me on this?

I helped myself. Here is the culprit:

http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
commit;h=3Dd5eda75f3a6a08f5a3644764a88d288e62e7823d

Here is a raw remedy:

http://groups.google.com/group/linux.debian.bugs.dist/browse_thread/thr=
ead/c12ec7e5aabbbdfa/83f0b0433b3c34ae?lnk=3Draot

There is a link to the patch for make-kpkg file.

Regards,

Piotr Hosowicz

--=20
"Polski system finansowy w okresie transformacji przejdzie do anna=B3=F3=
w
historii nonsensu, a logika polskich libera=B3=F3w jest logika z pogran=
icza
surrealizmu". - Milton Friedman, laureat nagrody Nobla nazywany
papie=BFem wolnego rynku
NP: Slash - Ghost (Feat. Ian Astbury)
NB: 2.6.35-rc4-next-20100709
