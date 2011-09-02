From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: linux-next: Tree for Aug 22 (evm)
Date: Thu, 1 Sep 2011 20:32:47 -0400
Message-ID: <CACqU3MWcBJuXA3n=ha_MNteM6MHfEWj8=42nZ_zvorvt6Pbq-w@mail.gmail.com>
References: <20110822145304.980529cb921e5f1321c622da@canb.auug.org.au>
	<20110822125355.bb01d76b.rdunlap@xenotime.net>
	<CACqU3MVjg60pTPyNWm+41w144QzPgtHQ4wZPUUV=vok8gGffuQ@mail.gmail.com>
	<20110822174958.73dd96c7.rdunlap@xenotime.net>
	<1314065358.3225.44.camel@localhost.localdomain>
	<20110823164035.ca28fdc6.rdunlap@xenotime.net>
	<CACqU3MWfKji5BcGRmwO_Y4_15oOq7Trw3u6j1g2meFAaG-s9-w@mail.gmail.com>
	<1314362342.3224.19.camel@localhost.localdomain>
	<20110826100011.9213d872.rdunlap@xenotime.net>
	<CACqU3MXBjHi9nOfxeQGJVtc7x33KbzK2Mi+_+A+jr+bPwqzY-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:38664 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932659Ab1IBAcs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Sep 2011 20:32:48 -0400
In-Reply-To: <CACqU3MXBjHi9nOfxeQGJVtc7x33KbzK2Mi+_+A+jr+bPwqzY-Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Mimi Zohar <zohar@us.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hi,

On Sat, Aug 27, 2011 at 2:06 AM, Arnaud Lacombe <lacombar@gmail.com> wr=
ote:
> Hi,
>
> On Fri, Aug 26, 2011 at 1:00 PM, Randy Dunlap <rdunlap@xenotime.net> =
wrote:
>> On Fri, 26 Aug 2011 08:39:02 -0400 Mimi Zohar wrote:
>>
>>> On Tue, 2011-08-23 at 22:10 -0400, Arnaud Lacombe wrote:
>>> > Hi,
>>> >
>>> > On Tue, Aug 23, 2011 at 7:40 PM, Randy Dunlap <rdunlap@xenotime.n=
et> wrote:
>>> > > I think that you are going to need to do something like Arnaud =
suggested
>>> > > and use "depends on TCG_TPM=3Dy" instead of just "depends on TC=
G_TPM",
>>> > > unless you can convince someone that this is a kconfig bug.
>>> > >
>>> > dammit... I guess there is...
>>> >
>>> > If you consider the following Kconfig:
>>> >
>>> > config MOD
>>> > =A0 =A0 =A0 =A0 bool
>>> > =A0 =A0 =A0 =A0 default y
>>> > =A0 =A0 =A0 =A0 option modules
>>> >
>>> > config EXPERIMENTAL
>>> > =A0 =A0 =A0 =A0 bool
>>> > =A0 =A0 =A0 =A0 default y
>>> >
>>> > menuconfig A
>>> > =A0 =A0 =A0 =A0 tristate "A"
>>> > =A0 =A0 =A0 =A0 depends on EXPERIMENTAL
>>> >
>>> > config B
>>> > =A0 =A0 =A0 =A0 bool "B"
>>> >
>>> > config B0
>>> > =A0 =A0 =A0 =A0 bool
>>> >
>>> > config C
>>> > =A0 =A0 =A0 =A0 tristate "C"
>>> > =A0 =A0 =A0 =A0 depends on B
>>> >
>>> > config C0
>>> > =A0 =A0 =A0 =A0 tristate
>>> >
>>> > config D
>>> > =A0 =A0 =A0 =A0 boolean "D"
>>> > =A0 =A0 =A0 =A0 depends on A && B
>>> > =A0 =A0 =A0 =A0 select C
>>> > =A0 =A0 =A0 =A0 select C0
>>> >
>>> > config E
>>> > =A0 =A0 =A0 =A0 tristate "E"
>>> >
>>> > config F
>>> > =A0 =A0 =A0 =A0 tristate "F"
>>> > =A0 =A0 =A0 =A0 select E
>>> >
>>> > B (KEYS) allows to set C (TRUSTED_KEYS). Also, B (KEYS) and A
>>> > (TCG_TPM) allows to set D (EVM), which will select (C). Now,
>>> > menuconfig highlight the problem very well. Proceeding as followi=
ng
>>> > A=3Dm, B=3Dy, C=3Dm, E=3Dy, F=3Dy, we ends up having:
>>> >
>>> > =A0<M> A =A0--->
>>> > =A0[*] B
>>> > =A0{M} C
>>> > =A0[*] D
>>> > =A0-*- E
>>> > =A0<*> F
>>> >
>>> > which translate in the following config:
>>> >
>>> > CONFIG_MOD=3Dy
>>> > CONFIG_EXPERIMENTAL=3Dy
>>> > CONFIG_A=3Dm
>>> > CONFIG_B=3Dy
>>> > CONFIG_C=3Dm
>>> > CONFIG_C0=3Dm
>>> > CONFIG_D=3Dy
>>> > CONFIG_E=3Dy
>>> > CONFIG_F=3Dy
>>> >
>>> > I would have expected CONFIG_C and CONFIG_C0 to be 'y', just as '=
E'.
>>> > If you remove D's dependency on 'A', everything works as expected=
=2E So
>>> > it would seem direct dependency state influence the state of reve=
rse
>>> > dependencies...
>>> >
>>> > Will have a look...
>>> >
>>> > =A0- Arnaud
>>>
>>> Thanks for looking into this! =A0Instead of changing 'TCG_TPM' to
>>> 'TCG_TPM=3Dy', the dependency should be on 'TRUSTED_KEYS=3Dy'. =A0T=
hen when
>>> I've refactored ENCRYPTED_KEYS, removing the ENCRYPTED_KEYS depende=
ncy
>>> on TRUSTED_KEYS, the EVM dependency would be '(TRUSTED_KEYS=3Dy ||
>>> TRUSTED_KEYS=3Dn)'. =A0Do you want a temporary fix for now?
>>
>> Yes, linux-next (randconfig) builds are still failing, so we need so=
mething
>> to prevent that.
>>
> you may want to try:
>
> git://github.com/lacombar/linux-2.6.git master/kconfig/expr-woes
>
ping ?

 - Arnaud

> only the last commit is relevant to the problem, but depend on one
> another to get <assert.h>. The rest aims at tidying the expr stuff.
> I'm looking for regression it may have introduced.
>
> Thanks,
> =A0- Arnaud
>
> ps: I'll most likely be AFK until sunday evening (to be conservative)=
=2E
>
>> thanks,
>> ---
>> ~Randy
>> *** Remember to use Documentation/SubmitChecklist when testing your =
code ***
>>
>
