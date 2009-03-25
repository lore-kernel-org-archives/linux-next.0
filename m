From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [patch 1/4] genirq: make irqreturn_t an enum
Date: Wed, 25 Mar 2009 20:51:27 +0100
Message-ID: <10f740e80903251251x33cd3e05gcf03e41e0aaf6308@mail.gmail.com>
References: <20090226131336.423054348@linutronix.de>
	 <20090226131719.393515463@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f169.google.com ([209.85.218.169]:44449 "EHLO
	mail-bw0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754379AbZCYTva convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Mar 2009 15:51:30 -0400
In-Reply-To: <20090226131719.393515463@linutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, Arjan van de Veen <arjan@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Jon Masters <jonathan@jonmasters.org>, linux-next@vger.kernel.org

On Thu, Feb 26, 2009 at 14:28, Thomas Gleixner <tglx@linutronix.de> wro=
te:
> Impact: cleanup
>
> Remove the 2.4 compabiliy cruft

> --- linux-2.6-tip.orig/include/linux/irqreturn.h
> +++ linux-2.6-tip/include/linux/irqreturn.h
> @@ -1,25 +1,17 @@
> -/* irqreturn.h */
> =C2=A0#ifndef _LINUX_IRQRETURN_H
> =C2=A0#define _LINUX_IRQRETURN_H
>
> -/*
> - * For 2.4.x compatibility, 2.4.x can use
> - *
> - * =C2=A0 =C2=A0 typedef void irqreturn_t;
> - * =C2=A0 =C2=A0 #define IRQ_NONE
> - * =C2=A0 =C2=A0 #define IRQ_HANDLED
> - * =C2=A0 =C2=A0 #define IRQ_RETVAL(x)
> - *
> - * To mix old-style and new-style irq handler returns.
> - *
> - * IRQ_NONE means we didn't handle it.
> - * IRQ_HANDLED means that we did have a valid interrupt and handled =
it.
> - * IRQ_RETVAL(x) selects on the two depending on x being non-zero (f=
or handled)
> +/**
> + * enum irqreturn
> + * @IRQ_NONE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt was not fr=
om this device
> + * @IRQ_HANDLED =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0interrupt was handled by this device
> =C2=A0*/
> -typedef int irqreturn_t;
> +enum irqreturn {
> + =C2=A0 =C2=A0 =C2=A0 IRQ_NONE,
> + =C2=A0 =C2=A0 =C2=A0 IRQ_HANDLED,
> +};
>
> -#define IRQ_NONE =C2=A0 =C2=A0 =C2=A0 (0)
> -#define IRQ_HANDLED =C2=A0 =C2=A0(1)
> -#define IRQ_RETVAL(x) =C2=A0((x) !=3D 0)
> +typedef enum irqreturn irqreturn_t;
> +#define IRQ_RETVAL(x) =C2=A0((x) !=3D IRQ_NONE)

JFYI, this causes the following warning in linux-next on m68k:

| arch/m68k/kernel/ints.c:231: warning: assignment from incompatible
pointer type

(cfr. http://kisskb.ellerman.id.au/kisskb/buildresult/271602/)

as struct irq_node in arch/m68k/include/asm/irq_mm.h still has a
`int (*handler)(int, void *);'.

I'll cook a patch, but there may be other users hidden somewhere in
arch-specific code...

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
