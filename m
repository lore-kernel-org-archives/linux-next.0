From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Aug 28 [ xhci build breakage ]
Date: Thu, 29 Aug 2013 10:02:13 +0200
Message-ID: <CA+icZUWNVCtRn_aK0ndXxmqutM4Sc_PJN4ei0m5phu6-CwO_+g@mail.gmail.com>
References: <CA+icZUUTBYMxLPBv2fq86h3dxyANhtpd6=Q4XGMscrntPNA9bQ@mail.gmail.com>
	<CA+icZUW6JMa6VoRJ62AUZDpYm2_q_tzSM0Ryb56RNnCdEhwQyA@mail.gmail.com>
	<CA+icZUVTzMxS4f3kZnauDkrpf4vwMbS3zd7ECOhE37S_FF83UA@mail.gmail.com>
	<CA+icZUVsG-1J2oYF+AeHsxonG2ABW4d0464yijNwaq7R5k94SQ@mail.gmail.com>
	<521DD43D.7070605@samsung.com>
	<CA+icZUWQp0k8jMqY=_DYW2Ev1cEhpev=iQNnc=NbHNgHNbifTA@mail.gmail.com>
	<521DD6BD.4030700@samsung.com>
	<20130828165938.GA26483@xanatos>
	<521E3259.6040201@samsung.com>
	<CA+icZUUj-gyqmEFo54N_62KCgByAu1n9n=dHgg3aTC53zA9TRQ@mail.gmail.com>
	<20130828211546.GH26483@xanatos>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:65068 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755641Ab3H2ICP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2013 04:02:15 -0400
In-Reply-To: <20130828211546.GH26483@xanatos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Cc: Dmitry Kasatkin <d.kasatkin@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org

On Wed, Aug 28, 2013 at 11:15 PM, Sarah Sharp
<sarah.a.sharp@linux.intel.com> wrote:
> On Wed, Aug 28, 2013 at 07:39:14PM +0200, Sedat Dilek wrote:
>> On Wed, Aug 28, 2013 at 7:24 PM, Dmitry Kasatkin <d.kasatkin@samsung.com> wrote:
>> Still noone answered me why "drivers/usb/host/xhci-ring.c" does NOT
>> include <linux/device.h> (dev_info_ratelimited() and other defines).
>> I am expecting that... even I see...
>>
>>           drivers/usb/host/.xhci-ring.o.cmd:715:  include/linux/device.h \
>>
>> ...where I don't know why this happens.
>>
>> ( For me this is a bit more important than """trimming""" my
>> responses, I keep the history... )
>>
>> - Sedat -
>>
>> P.S.: List of includes in xhci-ring.c
>>
>> $ grep ^'#include' -nr drivers/usb/host/xhci-ring.c
>> 67:#include <linux/scatterlist.h>
>> 68:#include <linux/slab.h>
>> 69:#include "xhci.h"
>> 70:#include "xhci-trace.h"
>
> Because a header that xhci-ring.c uses includes device.h instead.
>
> drivers/usb/host/xhci/xhci-ring.c includes
> drivers/usb/host/xhci.h which includes
> include/linux/usb.h which includes
> include/linux/device.h
>
> All USB host controllers depend on including usb.h, so I don't think
> there's a need for the driver to explicitly include device.h.
>

Thanks for the explanations.
On the one hand it is a fine thingie to place include-files at one
single place - think of renamed or moved (uapi) include-files.
Looking at xhci-ring.c means for me to dig through 3 or 4 files as
someone not dealing everyday with USB stuff.

What is the effect of CONFIG_DYNAMIC_DEBUG=[y|n] in the affected code?

- Sedat -

P.S.: The forgotten patch is now in usb-next, but I don't see any
credits, coins, gold, platin...
