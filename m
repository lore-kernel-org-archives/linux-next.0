From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 8 (docbook/media)
Date: Fri, 10 Jun 2011 09:04:31 -0700
Message-ID: <4DF2408F.1010902@oracle.com>
References: <20110608161046.4ad95776.sfr@canb.auug.org.au> <20110608125243.e63a07fc.randy.dunlap@oracle.com> <4DF11E15.5030907@infradead.org> <4DF12263.3070900@redhat.com> <4DF12DD1.7060606@oracle.com> <4DF1581E.8050308@redhat.com> <4DF1593A.6080306@oracle.com> <4DF21254.6090106@redhat.com> <4DF23271.7070407@oracle.com> <4DF235F0.9080209@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:42339 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750876Ab1FJQEt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Jun 2011 12:04:49 -0400
In-Reply-To: <4DF235F0.9080209@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-media@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 06/10/11 08:19, Mauro Carvalho Chehab wrote:
> Em 10-06-2011 12:04, Randy Dunlap escreveu:
>> On 06/10/11 05:47, Mauro Carvalho Chehab wrote:
>>> Hi Randy,
>>>
>>> Em 09-06-2011 20:37, Randy Dunlap escreveu:
>>>>
>>>> Big hint:  I see these errors not during "make htmldocs" but durin=
g a kernel code build
>>>> when CONFIG_BUILD_DOCSRC=3Dy.
>>>>
>>>> Sorry, I should have mentioned this earlier.
>>>
>>> I couldn't reach any troubles there. Documentation build is stoppin=
g earlier.
>>> I'm using the -next tree for 20110610:
>>>
>>> $ make defconfig
>>> $ make CONFIG_BUILD_DOCSRC=3Dy -j 16 Documentation/
>>
>>
>> Maybe that incantation does not set CONFIG_HEADERS_CHECK, which
>> CONFIG_BUILD_DOCSRC depends on.
>>
>> [build errors snipped]
>>
>>>
>>> Could you please send me your .config?
>>
>> yes, attached.
>>
>=20
> Hmm... didn't work either. With your config:
>=20
> [mchehab@buidmachine linux-next]$ make -j 16 Documentation/
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   HOSTCC  Documentation/networking/timestamping/timestamping
> Documentation/networking/timestamping/timestamping.c:45:30: error: li=
nux/net_tstamp.h: No such file or directory
> Documentation/networking/timestamping/timestamping.c: In function =91=
main=92:
> Documentation/networking/timestamping/timestamping.c:331: error: stor=
age size of =91hwconfig=92 isn=92t known
> Documentation/networking/timestamping/timestamping.c:331: error: stor=
age size of =91hwconfig_requested=92 isn=92t known
> Documentation/networking/timestamping/timestamping.c:355: error: =91S=
OF_TIMESTAMPING_TX_HARDWARE=92 undeclared (first use in this function)
> Documentation/networking/timestamping/timestamping.c:355: error: (Eac=
h undeclared identifier is reported only once
> Documentation/networking/timestamping/timestamping.c:355: error: for =
each function it appears in.)
> Documentation/networking/timestamping/timestamping.c:357: error: =91S=
OF_TIMESTAMPING_TX_SOFTWARE=92 undeclared (first use in this function)
> Documentation/networking/timestamping/timestamping.c:359: error: =91S=
OF_TIMESTAMPING_RX_HARDWARE=92 undeclared (first use in this function)
> Documentation/networking/timestamping/timestamping.c:361: error: =91S=
OF_TIMESTAMPING_RX_SOFTWARE=92 undeclared (first use in this function)
> Documentation/networking/timestamping/timestamping.c:363: error: =91S=
OF_TIMESTAMPING_SOFTWARE=92 undeclared (first use in this function)
> Documentation/networking/timestamping/timestamping.c:365: error: =91S=
OF_TIMESTAMPING_SYS_HARDWARE=92 undeclared (first use in this function)
> Documentation/networking/timestamping/timestamping.c:367: error: =91S=
OF_TIMESTAMPING_RAW_HARDWARE=92 undeclared (first use in this function)
> Documentation/networking/timestamping/timestamping.c:387: error: =91H=
WTSTAMP_TX_ON=92 undeclared (first use in this function)
> Documentation/networking/timestamping/timestamping.c:387: error: =91H=
WTSTAMP_TX_OFF=92 undeclared (first use in this function)
> Documentation/networking/timestamping/timestamping.c:390: error: =91H=
WTSTAMP_FILTER_PTP_V1_L4_SYNC=92 undeclared (first use in this function=
)
> Documentation/networking/timestamping/timestamping.c:390: error: =91H=
WTSTAMP_FILTER_NONE=92 undeclared (first use in this function)
> Documentation/networking/timestamping/timestamping.c:331: warning: un=
used variable =91hwconfig_requested=92
> Documentation/networking/timestamping/timestamping.c:331: warning: un=
used variable =91hwconfig=92
> make[3]: *** [Documentation/networking/timestamping/timestamping] Err=
or 1
> make[2]: *** [Documentation/networking/timestamping] Error 2
> make[1]: *** [Documentation/networking] Error 2
> make: *** [Documentation/] Error 2
>=20
> PS.: A full build against next is broken:
> $ make -j 27
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   CC      arch/x86/lib/memmove_64.o
> gcc: arch/x86/lib/memmove_64.c: No such file or directory
> gcc: no input files
> make[1]: *** [arch/x86/lib/memmove_64.o] Error 1
> make: *** [arch/x86/lib] Error 2
> make: *** Waiting for unfinished jobs....
>=20
> My tree is on this commit:
>=20
> commit c4c5f633751496147f2d846844aa084a1dbca0f4
> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> Date:   Fri Jun 10 16:17:26 2011 +1000
>=20
>     Add linux-next specific files for 20110610


Still fails on linux-next-20110610 for me.

Please try a full, clean build, not using only
$ make -j 16 Documentation/

$ mkdir doc64
$ cp -a config-r7970 doc64/.config
$ make O=3Ddoc64 oldconfig
$ make O=3Ddoc64 -j9 all
=2E..
ls: cannot access /lnx/src/NEXT/linux-next-20110610/Documentation/DocBo=
ok/media/*/*.gif: No such file or directory
ls: cannot access /lnx/src/NEXT/linux-next-20110610/Documentation/DocBo=
ok/media/*/*.png: No such file or directory


--=20
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
