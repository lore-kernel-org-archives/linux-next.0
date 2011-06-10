From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: Tree for June 8 (docbook/media)
Date: Fri, 10 Jun 2011 12:19:12 -0300
Message-ID: <4DF235F0.9080209@redhat.com>
References: <20110608161046.4ad95776.sfr@canb.auug.org.au> <20110608125243.e63a07fc.randy.dunlap@oracle.com> <4DF11E15.5030907@infradead.org> <4DF12263.3070900@redhat.com> <4DF12DD1.7060606@oracle.com> <4DF1581E.8050308@redhat.com> <4DF1593A.6080306@oracle.com> <4DF21254.6090106@redhat.com> <4DF23271.7070407@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:28608 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757538Ab1FJPTU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Jun 2011 11:19:20 -0400
In-Reply-To: <4DF23271.7070407@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-media@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Em 10-06-2011 12:04, Randy Dunlap escreveu:
> On 06/10/11 05:47, Mauro Carvalho Chehab wrote:
>> Hi Randy,
>>
>> Em 09-06-2011 20:37, Randy Dunlap escreveu:
>>>
>>> Big hint:  I see these errors not during "make htmldocs" but during=
 a kernel code build
>>> when CONFIG_BUILD_DOCSRC=3Dy.
>>>
>>> Sorry, I should have mentioned this earlier.
>>
>> I couldn't reach any troubles there. Documentation build is stopping=
 earlier.
>> I'm using the -next tree for 20110610:
>>
>> $ make defconfig
>> $ make CONFIG_BUILD_DOCSRC=3Dy -j 16 Documentation/
>=20
>=20
> Maybe that incantation does not set CONFIG_HEADERS_CHECK, which
> CONFIG_BUILD_DOCSRC depends on.
>=20
> [build errors snipped]
>=20
>>
>> Could you please send me your .config?
>=20
> yes, attached.
>=20

Hmm... didn't work either. With your config:

[mchehab@buidmachine linux-next]$ make -j 16 Documentation/
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  HOSTCC  Documentation/networking/timestamping/timestamping
Documentation/networking/timestamping/timestamping.c:45:30: error: linu=
x/net_tstamp.h: No such file or directory
Documentation/networking/timestamping/timestamping.c: In function =E2=80=
=98main=E2=80=99:
Documentation/networking/timestamping/timestamping.c:331: error: storag=
e size of =E2=80=98hwconfig=E2=80=99 isn=E2=80=99t known
Documentation/networking/timestamping/timestamping.c:331: error: storag=
e size of =E2=80=98hwconfig_requested=E2=80=99 isn=E2=80=99t known
Documentation/networking/timestamping/timestamping.c:355: error: =E2=80=
=98SOF_TIMESTAMPING_TX_HARDWARE=E2=80=99 undeclared (first use in this =
function)
Documentation/networking/timestamping/timestamping.c:355: error: (Each =
undeclared identifier is reported only once
Documentation/networking/timestamping/timestamping.c:355: error: for ea=
ch function it appears in.)
Documentation/networking/timestamping/timestamping.c:357: error: =E2=80=
=98SOF_TIMESTAMPING_TX_SOFTWARE=E2=80=99 undeclared (first use in this =
function)
Documentation/networking/timestamping/timestamping.c:359: error: =E2=80=
=98SOF_TIMESTAMPING_RX_HARDWARE=E2=80=99 undeclared (first use in this =
function)
Documentation/networking/timestamping/timestamping.c:361: error: =E2=80=
=98SOF_TIMESTAMPING_RX_SOFTWARE=E2=80=99 undeclared (first use in this =
function)
Documentation/networking/timestamping/timestamping.c:363: error: =E2=80=
=98SOF_TIMESTAMPING_SOFTWARE=E2=80=99 undeclared (first use in this fun=
ction)
Documentation/networking/timestamping/timestamping.c:365: error: =E2=80=
=98SOF_TIMESTAMPING_SYS_HARDWARE=E2=80=99 undeclared (first use in this=
 function)
Documentation/networking/timestamping/timestamping.c:367: error: =E2=80=
=98SOF_TIMESTAMPING_RAW_HARDWARE=E2=80=99 undeclared (first use in this=
 function)
Documentation/networking/timestamping/timestamping.c:387: error: =E2=80=
=98HWTSTAMP_TX_ON=E2=80=99 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:387: error: =E2=80=
=98HWTSTAMP_TX_OFF=E2=80=99 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:390: error: =E2=80=
=98HWTSTAMP_FILTER_PTP_V1_L4_SYNC=E2=80=99 undeclared (first use in thi=
s function)
Documentation/networking/timestamping/timestamping.c:390: error: =E2=80=
=98HWTSTAMP_FILTER_NONE=E2=80=99 undeclared (first use in this function=
)
Documentation/networking/timestamping/timestamping.c:331: warning: unus=
ed variable =E2=80=98hwconfig_requested=E2=80=99
Documentation/networking/timestamping/timestamping.c:331: warning: unus=
ed variable =E2=80=98hwconfig=E2=80=99
make[3]: *** [Documentation/networking/timestamping/timestamping] Error=
 1
make[2]: *** [Documentation/networking/timestamping] Error 2
make[1]: *** [Documentation/networking] Error 2
make: *** [Documentation/] Error 2

PS.: A full build against next is broken:
$ make -j 27
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CC      arch/x86/lib/memmove_64.o
gcc: arch/x86/lib/memmove_64.c: No such file or directory
gcc: no input files
make[1]: *** [arch/x86/lib/memmove_64.o] Error 1
make: *** [arch/x86/lib] Error 2
make: *** Waiting for unfinished jobs....

My tree is on this commit:

commit c4c5f633751496147f2d846844aa084a1dbca0f4
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Fri Jun 10 16:17:26 2011 +1000

    Add linux-next specific files for 20110610
