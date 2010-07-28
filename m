From: Jarod Wilson <jarod@wilsonet.com>
Subject: Re: linux-next: Tree for July 28 (lirc #2)
Date: Wed, 28 Jul 2010 18:27:26 -0400
Message-ID: <AANLkTi=DLHOnzgXmpzNE3PQXp-xSkm8vLdxBBf1mcFuO@mail.gmail.com>
References: <20100728162855.4968e561.sfr@canb.auug.org.au>
	<20100728102417.be60049a.randy.dunlap@oracle.com>
	<20100728220454.GK8564@aniel.lan>
	<4C50AC26.1080100@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4C50AC26.1080100@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Janne Grunau <j@jannau.net>, Stephen Rothwell <sfr@canb.auug.org.au>, lirc-list@lists.sourceforge.net, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 28, 2010 at 6:16 PM, Randy Dunlap <randy.dunlap@oracle.com>=
 wrote:
> On 07/28/10 15:04, Janne Grunau wrote:
>> On Wed, Jul 28, 2010 at 10:24:17AM -0700, Randy Dunlap wrote:
>>> On Wed, 28 Jul 2010 16:28:55 +1000 Stephen Rothwell wrote:
>>>
>>>> Hi all,
>>>>
>>>> Changes since 20100727:
>>>
>>>
>>> When USB_SUPPORT is not enabled and MEDIA_SUPPORT is not enabled:
>>>
>>
>> following patch should fix it
>>
>> Janne
>
> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
>
> Thanks.

Acked-by: Jarod Wilson <jarod@redhat.com>

Indeed, thanks much, Janne!


>> From 7d1cc98c19a6c27dd74a28f04dfe4248a0b335ce Mon Sep 17 00:00:00 20=
01
>> From: Janne Grunau <j@jannau.net>
>> Date: Wed, 28 Jul 2010 23:53:35 +0200
>> Subject: [PATCH 1/2] staging/lirc: fix Kconfig dependencies
>>
>> Signed-off-by: Janne Grunau <j@jannau.net>
>> ---
>> =A0drivers/staging/lirc/Kconfig | =A0 28 ++++++++++++++-------------=
-
>> =A01 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/staging/lirc/Kconfig b/drivers/staging/lirc/Kco=
nfig
>> index 968c2ade..3981a4a 100644
>> --- a/drivers/staging/lirc/Kconfig
>> +++ b/drivers/staging/lirc/Kconfig
>> @@ -13,13 +13,13 @@ if LIRC_STAGING
>>
>> =A0config LIRC_BT829
>> =A0 =A0 =A0 =A0 =A0tristate "BT829 based hardware"
>> - =A0 =A0 depends on LIRC_STAGING
>> + =A0 =A0 depends on LIRC && LIRC_STAGING
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for the IR interface on BT829-based hardware
>>
>> =A0config LIRC_ENE0100
>> =A0 =A0 =A0 tristate "ENE KB3924/ENE0100 CIR Port Reciever"
>> - =A0 =A0 depends on LIRC_STAGING
>> + =A0 =A0 depends on LIRC && LIRC_STAGING
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 This is a driver for CIR port handled by ENE KB3924 =
embedded
>> =A0 =A0 =A0 =A0 controller found on some notebooks.
>> @@ -27,20 +27,20 @@ config LIRC_ENE0100
>>
>> =A0config LIRC_I2C
>> =A0 =A0 =A0 tristate "I2C Based IR Receivers"
>> - =A0 =A0 depends on LIRC_STAGING
>> + =A0 =A0 depends on I2C && LIRC && LIRC_STAGING
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for I2C-based IR receivers, such as those com=
monly
>> =A0 =A0 =A0 =A0 found onboard Hauppauge PVR-150/250/350 video captur=
e cards
>>
>> =A0config LIRC_IGORPLUGUSB
>> =A0 =A0 =A0 tristate "Igor Cesko's USB IR Receiver"
>> - =A0 =A0 depends on LIRC_STAGING && USB
>> + =A0 =A0 depends on USB && LIRC && LIRC_STAGING && USB
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for Igor Cesko's USB IR Receiver
>>
>> =A0config LIRC_IMON
>> =A0 =A0 =A0 tristate "Legacy SoundGraph iMON Receiver and Display"
>> - =A0 =A0 depends on LIRC_STAGING
>> + =A0 =A0 depends on LIRC && LIRC_STAGING
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for the original SoundGraph iMON IR Receiver =
and Display
>>
>> @@ -48,31 +48,31 @@ config LIRC_IMON
>>
>> =A0config LIRC_IT87
>> =A0 =A0 =A0 tristate "ITE IT87XX CIR Port Receiver"
>> - =A0 =A0 depends on LIRC_STAGING
>> + =A0 =A0 depends on LIRC && LIRC_STAGING
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for the ITE IT87xx IR Receiver
>>
>> =A0config LIRC_ITE8709
>> =A0 =A0 =A0 tristate "ITE8709 CIR Port Receiver"
>> - =A0 =A0 depends on LIRC_STAGING && PNP
>> + =A0 =A0 depends on LIRC && LIRC_STAGING && PNP
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for the ITE8709 IR Receiver
>>
>> =A0config LIRC_PARALLEL
>> =A0 =A0 =A0 tristate "Homebrew Parallel Port Receiver"
>> - =A0 =A0 depends on LIRC_STAGING && !SMP
>> + =A0 =A0 depends on LIRC && LIRC_STAGING && !SMP
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for Homebrew Parallel Port Receivers
>>
>> =A0config LIRC_SASEM
>> =A0 =A0 =A0 tristate "Sasem USB IR Remote"
>> - =A0 =A0 depends on LIRC_STAGING
>> + =A0 =A0 depends on USB && LIRC && LIRC_STAGING
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for the Sasem OnAir Remocon-V or Dign HV5 HTP=
C IR/VFD Module
>>
>> =A0config LIRC_SERIAL
>> =A0 =A0 =A0 tristate "Homebrew Serial Port Receiver"
>> - =A0 =A0 depends on LIRC_STAGING
>> + =A0 =A0 depends on LIRC && LIRC_STAGING
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for Homebrew Serial Port Receivers
>>
>> @@ -85,25 +85,25 @@ config LIRC_SERIAL_TRANSMITTER
>>
>> =A0config LIRC_SIR
>> =A0 =A0 =A0 tristate "Built-in SIR IrDA port"
>> - =A0 =A0 depends on LIRC_STAGING
>> + =A0 =A0 depends on LIRC && LIRC_STAGING
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for the SIR IrDA port
>>
>> =A0config LIRC_STREAMZAP
>> =A0 =A0 =A0 tristate "Streamzap PC Receiver"
>> - =A0 =A0 depends on LIRC_STAGING
>> + =A0 =A0 depends on USB && LIRC && LIRC_STAGING
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for the Streamzap PC Receiver
>>
>> =A0config LIRC_TTUSBIR
>> =A0 =A0 =A0 tristate "Technotrend USB IR Receiver"
>> - =A0 =A0 depends on LIRC_STAGING && USB
>> + =A0 =A0 depends on USB && LIRC && LIRC_STAGING && USB
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for the Technotrend USB IR Receiver
>>
>> =A0config LIRC_ZILOG
>> =A0 =A0 =A0 tristate "Zilog/Hauppauge IR Transmitter"
>> - =A0 =A0 depends on LIRC_STAGING
>> + =A0 =A0 depends on I2C && LIRC && LIRC_STAGING
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Driver for the Zilog/Hauppauge IR Transmitter, found=
 on
>> =A0 =A0 =A0 =A0 PVR-150/500, HVR-1200/1250/1700/1800, HD-PVR and oth=
er cards
>
>
> --
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your c=
ode ***
>



--=20
Jarod Wilson
jarod@wilsonet.com
