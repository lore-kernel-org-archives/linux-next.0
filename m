From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: Tree for June 8 (docbook/media)
Date: Fri, 10 Jun 2011 09:47:16 -0300
Message-ID: <4DF21254.6090106@redhat.com>
References: <20110608161046.4ad95776.sfr@canb.auug.org.au> <20110608125243.e63a07fc.randy.dunlap@oracle.com> <4DF11E15.5030907@infradead.org> <4DF12263.3070900@redhat.com> <4DF12DD1.7060606@oracle.com> <4DF1581E.8050308@redhat.com> <4DF1593A.6080306@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:6568 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756011Ab1FJMr0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Jun 2011 08:47:26 -0400
In-Reply-To: <4DF1593A.6080306@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-media@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Randy,

Em 09-06-2011 20:37, Randy Dunlap escreveu:
>=20
> Big hint:  I see these errors not during "make htmldocs" but during a=
 kernel code build
> when CONFIG_BUILD_DOCSRC=3Dy.
>=20
> Sorry, I should have mentioned this earlier.

I couldn't reach any troubles there. Documentation build is stopping ea=
rlier.
I'm using the -next tree for 20110610:

$ make defconfig
$ make CONFIG_BUILD_DOCSRC=3Dy -j 16 Documentation/

Documentation/networking/timestamping/timestamping.c:45:30: error: linu=
x/net_tstamp.h: No such file or directory
Documentation/networking/timestamping/timestamping.c: In function =91ma=
in=92:
Documentation/networking/timestamping/timestamping.c:331: error: storag=
e size of =91hwconfig=92 isn=92t known
Documentation/networking/timestamping/timestamping.c:331: error: storag=
e size of =91hwconfig_requested=92 isn=92t known
Documentation/networking/timestamping/timestamping.c:355: error: =91SOF=
_TIMESTAMPING_TX_HARDWARE=92 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:355: error: (Each =
undeclared identifier is reported only once
Documentation/networking/timestamping/timestamping.c:355: error: for ea=
ch function it appears in.)
Documentation/networking/timestamping/timestamping.c:357: error: =91SOF=
_TIMESTAMPING_TX_SOFTWARE=92 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:359: error: =91SOF=
_TIMESTAMPING_RX_HARDWARE=92 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:361: error: =91SOF=
_TIMESTAMPING_RX_SOFTWARE=92 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:363: error: =91SOF=
_TIMESTAMPING_SOFTWARE=92 undeclared (first use in this function)
Documentation/accounting/getdelays.c: In function =91main=92:
Documentation/networking/timestamping/timestamping.c:365: error: =91SOF=
_TIMESTAMPING_SYS_HARDWARE=92 undeclared (first use in this function)Do=
cumentation/accounting/getdelays.c:525: error: =91TASKSTATS_TYPE_NULL=92=
 undeclared (first use in this function)

Documentation/accounting/getdelays.c:525: error: (Each undeclared ident=
ifier is reported only once
Documentation/accounting/getdelays.c:525: error: for each function it a=
ppears in.)
Documentation/networking/timestamping/timestamping.c:367: error: =91SOF=
_TIMESTAMPING_RAW_HARDWARE=92 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:387: error: =91HWT=
STAMP_TX_ON=92 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:387: error: =91HWT=
STAMP_TX_OFF=92 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:390: error: =91HWT=
STAMP_FILTER_PTP_V1_L4_SYNC=92 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:390: error: =91HWT=
STAMP_FILTER_NONE=92 undeclared (first use in this function)
Documentation/networking/timestamping/timestamping.c:331: warning: unus=
ed variable =91hwconfig_requested=92
Documentation/networking/timestamping/timestamping.c:331: warning: unus=
ed variable =91hwconfig=92
make[2]: *** [Documentation/accounting/getdelays] Error 1
make[3]: *** [Documentation/networking/timestamping/timestamping] Error=
 1
make[1]: *** [Documentation/accounting] Error 2
make[1]: *** Waiting for unfinished jobs....
make[2]: *** [Documentation/networking/timestamping] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [Documentation/networking] Error 2
make: *** [Documentation/] Error 2

Could you please send me your .config?

Thanks,
Mauro
