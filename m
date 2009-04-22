From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [BUILD FAILURE 09/12] Next April 21 : PPC64 randconfig [drivers/staging/comedi/drivers.o]
Date: Wed, 22 Apr 2009 08:10:35 -0700
Message-ID: <49EF336B.5070807@oracle.com>
References: <1240340029.9110.142.camel@subratamodak.linux.ibm.com> <1240358910.6571.6.camel@localhost> <alpine.LRH.2.00.0904220942430.6852@vixen.sonytel.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755626AbZDVPNZ@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.00.0904220942430.6852@vixen.sonytel.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Michael Ellerman <michael@ellerman.id.au>, subrata@linux.vnet.ibm.com, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, "David A. Schleef" <ds@schleef.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, linux-next <linux-next@vger.kernel.org>, Alexander Beregalov <a.beregalov@gmail.com>
List-Id: linux-next.vger.kernel.org

Geert Uytterhoeven wrote:
> On Wed, 22 Apr 2009, Michael Ellerman wrote:
>> On Wed, 2009-04-22 at 00:23 +0530, Subrata Modak wrote:
>>> Reported this error on 14th April:
>>> http://lkml.org/lkml/2009/4/14/488,
>>>
>>> CC [M]  drivers/staging/comedi/drivers.o=20
>>> drivers/staging/comedi/drivers.c: In function =91comedi_buf_alloc=92=
:
>>> drivers/staging/comedi/drivers.c:496: error: =91PAGE_KERNEL_NOCACHE=
=92
>>> undeclared (first use in this function)
>>> drivers/staging/comedi/drivers.c:496: error: (Each undeclared ident=
ifier
>>> is reported only once
>>> drivers/staging/comedi/drivers.c:496: error: for each function it
>>> appears in.)
>>> make[3]: *** [drivers/staging/comedi/drivers.o] Error 1
>>> make[2]: *** [drivers/staging/comedi] Error 2
>>> make[1]: *** [drivers/staging] Error 2
>>> make: *** [drivers] Error 2
>> Subrata, unless someone says otherwise, please do not send randconfi=
g
>> failures for drivers in staging - those drivers have bigger problems
>> than randconfig failures.
>=20
> Indeed, in particular this one http://lkml.org/lkml/2009/3/9/349.
>=20
>> To avoid them, do this:
>>
>> # make randconfig
>> # sed -i -e 's/^\(CONFIG_STAGING\)=3Dy/# \1 is not set/' .config
>                                        ^^^^^^^^^^^^^^^
> Recently I discovered that `n' actually works, too!

Yes, I've been using =3Dn for quite awhile to disable a config symbol.

>> # make oldconfig


--=20
~Randy
