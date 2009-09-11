From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: drivers/staging/vme/Kconfig:5:warning: type of 'VME' redefined
	from 'boolean' to 'tristate'
Date: Fri, 11 Sep 2009 19:22:16 +0200
Message-ID: <10f740e80909111022t50d8beb9qf94cfd13413fb29e@mail.gmail.com>
References: <10f740e80909110726x313e3e3coe2321c683163e3a5@mail.gmail.com>
	 <20090911150210.GB16593@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f184.google.com ([209.85.222.184]:51212 "EHLO
	mail-pz0-f184.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940AbZIKRWN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Sep 2009 13:22:13 -0400
In-Reply-To: <20090911150210.GB16593@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Martyn Welch <martyn.welch@gefanuc.com>, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>

On Fri, Sep 11, 2009 at 17:02, Greg KH<greg@kroah.com> wrote:
> On Fri, Sep 11, 2009 at 04:26:36PM +0200, Geert Uytterhoeven wrote:
>> http://kisskb.ellerman.id.au/kisskb/buildresult/1221192/:
>> drivers/staging/vme/Kconfig:5:warning: type of 'VME' redefined from
>> 'boolean' to 'tristate'
>> drivers/staging/vme/Kconfig:5:warning: type of 'VME' redefined from
>> 'boolean' to 'tristate'
>>
>> We already have:
>>
>> arch/m68k/Kconfig:config VME
>> arch/m68k/Kconfig: =C2=A0 =C2=A0 =C2=A0bool "VME (Motorola and BVM) =
support"
>> arch/m68k/Kconfig: =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here if you want=
 to build a kernel for
>> a 680x0 based VME
>
> Ah, not good.
>
> Are these a board-specific thing? =C2=A0It's not the "VME bus" is it?

These are to enable support for the original VME-based machines (VME
started it's life on m68k).

=46rom a historical point of view, it's a bit funny to see the new
CONFIG_VME(_BUS) depends on PCI ;-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
