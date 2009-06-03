From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] MFD: PCAP driver
Date: Wed, 3 Jun 2009 16:38:19 +0200
Message-ID: <10f740e80906030738x3b42de18n189367b28a730c56@mail.gmail.com>
References: <1243399356.2263.46.camel@brutus>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f213.google.com ([209.85.220.213]:64692 "EHLO
	mail-fx0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753587AbZFCPKB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 11:10:01 -0400
In-Reply-To: <1243399356.2263.46.camel@brutus>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Ribeiro <drwyrm@gmail.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, Harald Welte <laforge@gnumonks.org>, Philipp Zabel <philipp.zabel@gmail.com>, openezx-devel <openezx-devel@lists.openezx.org>, linux-next@vger.kernel.org

On Wed, May 27, 2009 at 06:42, Daniel Ribeiro <drwyrm@gmail.com> wrote:
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -241,6 +241,13 @@ config PCF50633_GPIO
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Say yes here if you want to include suppo=
rt GPIO for pins on
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 the PCF50633 chip.
>
> +config EZX_PCAP
> + =C2=A0 =C2=A0 =C2=A0 bool "PCAP Support"
> + =C2=A0 =C2=A0 =C2=A0 depends on SPI_MASTER

It also has to depend on GENERIC_HARDIRQS, as it needs set_irq_type():

> + =C2=A0 =C2=A0 =C2=A0 set_irq_type(spi->irq, IRQ_TYPE_EDGE_RISING);

Cfr. the m68k allmodconfig build failure on linux-next
http://kisskb.ellerman.id.au/kisskb/buildresult/595604/:

drivers/mfd/ezx-pcap.c:123: error: implicit declaration of function
'get_irq_chip_data'
drivers/mfd/ezx-pcap.c:179: error: implicit declaration of function
'note_interrupt'
drivers/mfd/ezx-pcap.c:189: error: implicit declaration of function
'get_irq_data'
drivers/mfd/ezx-pcap.c:370: error: implicit declaration of function
'set_irq_chip_and_handler'
drivers/mfd/ezx-pcap.c:426: error: 'handle_simple_irq' undeclared
(first use in this function)
drivers/mfd/ezx-pcap.c:426: error: (Each undeclared identifier is
reported only once
drivers/mfd/ezx-pcap.c:426: error: for each function it appears in.)
drivers/mfd/ezx-pcap.c:427: error: implicit declaration of function
'set_irq_chip_data'
drivers/mfd/ezx-pcap.c:431: error: implicit declaration of function
'set_irq_noprobe'
drivers/mfd/ezx-pcap.c:440: error: implicit declaration of function
'set_irq_type'
drivers/mfd/ezx-pcap.c:441: error: implicit declaration of function
'set_irq_data'
drivers/mfd/ezx-pcap.c:442: error: implicit declaration of function
'set_irq_chained_handler'
drivers/mfd/ezx-pcap.c:443: error: implicit declaration of function
'set_irq_wake'

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
