From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [uml-devel] =?windows-1252?q?=22warning=3A_passing_argument_1_of_?=
 =?windows-1252?q?=91um=5Fexecve=92_discards_qualifiers_from_pointe?=
 =?windows-1252?q?r_target_type=22?=
Date: Thu, 30 Oct 2008 09:31:04 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0810300925590.4898@anakin>
References: <804dabb00810291851xc617690wac1404176437fb84@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yorgi.telenet-ops.be ([195.130.133.69]:57883 "EHLO
	yorgi.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753306AbYJ3Ibj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Oct 2008 04:31:39 -0400
Received: from monty.telenet-ops.be (monty.telenet-ops.be [195.130.132.56])
	by yorgi.telenet-ops.be (Postfix) with ESMTP id 035F1680C43
	for <linux-next@vger.kernel.org>; Thu, 30 Oct 2008 09:31:37 +0100 (CET)
In-Reply-To: <804dabb00810291851xc617690wac1404176437fb84@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Teoh <htmldeveloper@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: uml-devel <user-mode-linux-devel@lists.sourceforge.net>, linux-next@vger.kernel.org

On Thu, 30 Oct 2008, Peter Teoh wrote:
> While compiling the latest 2.6.28-rc2 (make linux ARCH=um O=uml):
> 
>   CC      arch/um/kernel/syscall.o
> /hdc1/download/2.6/linux26-acer/arch/um/kernel/syscall.c: In function
> 'kernel_execve':
> /hdc1/download/2.6/linux26-acer/arch/um/kernel/syscall.c:130: warning:
> passing argument 1 of 'um_execve' discards qualifiers from pointer
> target type
> /hdc1/download/2.6/linux26-acer/arch/um/kernel/syscall.c:130: warning:
> passing argument 2 of 'um_execve' discards qualifiers from pointer
> target type
> /hdc1/download/2.6/linux26-acer/arch/um/kernel/syscall.c:130: warning:
> passing argument 3 of 'um_execve' discards qualifiers from pointer
> target type
> u  CC      arch/um/kernel/sysrq.o
>   CC      arch/um/kernel/time.o
> 
> snip
> 
>   CC      kernel/trace/trace.o
> /hdc1/download/2.6/linux26-acer/kernel/trace/trace.c: In function
> 'tracing_generic_entry_update':
> /hdc1/download/2.6/linux26-acer/kernel/trace/trace.c:659: error:
> implicit declaration of function 'irqs_disabled_flags'
> make[3]: *** [kernel/trace/trace.o] Error 1
> make[2]: *** [kernel/trace] Error 2
> make[1]: *** [kernel] Error 2
> make: *** [sub-make] Error 2
> 
> The .config as per attached.

I see there are no UML builds yet on
http://kisskb.ellerman.id.au/kisskb/matrix/.
Perhaps it would be a good idea to add them?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
