From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with the
	microblaze tree
Date: Mon, 26 Jul 2010 21:19:38 -0600
Message-ID: <AANLkTik6ERg9G4=f=c2gUivmO7ZAngxNyAya=960aa-W@mail.gmail.com>
References: <20100727131740.38ea876e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:35729 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752202Ab0G0D1s convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Jul 2010 23:27:48 -0400
In-Reply-To: <20100727131740.38ea876e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonas Bonn <jonas@southpole.se>, "Steven J. Magnani" <steve@digidescorp.com>, Michal Simek <michal.simek@petalogix.com>

On Mon, Jul 26, 2010 at 9:17 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> Today's linux-next merge of the devicetree tree got a conflict in
> arch/microblaze/kernel/Makefile between commit
> 117aa948321f3b019d9d8160591dc8256a6035cd ("microblaze: Add stack
> unwinder") from the microblaze tree and commit
> c0dd394ca5e78649b7013c3ce2d6338af9f228f0 ("of: remove
> of_default_bus_ids") from the devicetree tree.
>
> Just context changes. I fixed it up (see below) and can carry the fix=
 as
> necessary.

Thanks Stephen.  Looks right to me.

g.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc arch/microblaze/kernel/Makefile
> index d66ddef,7fcc5f7..0000000
> --- a/arch/microblaze/kernel/Makefile
> +++ b/arch/microblaze/kernel/Makefile
> @@@ -15,9 -15,9 +15,9 @@@ endi
> =A0extra-y :=3D head.o vmlinux.lds
>
> =A0obj-y +=3D dma.o exceptions.o \
> - =A0 =A0 =A0 hw_exception_handler.o init_task.o intc.o irq.o of_devi=
ce.o \
> - =A0 =A0 =A0 of_platform.o process.o prom.o prom_parse.o ptrace.o \
> + =A0 =A0 =A0 hw_exception_handler.o init_task.o intc.o irq.o \
> + =A0 =A0 =A0 process.o prom.o prom_parse.o ptrace.o \
> =A0- =A0 =A0 =A0setup.o signal.o sys_microblaze.o timer.o traps.o res=
et.o
> =A0+ =A0 =A0 =A0reset.o setup.o signal.o sys_microblaze.o timer.o tra=
ps.o unwind.o
>
> =A0obj-y +=3D cpu/
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
