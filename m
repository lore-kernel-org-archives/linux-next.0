From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Recent frv breakage
Date: Tue, 25 Sep 2012 23:10:25 +0200
Message-ID: <CAMuHMdXcAF+QERx6gzniUfhS=vhfnSMC5cnZWEo89xVeABb8sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:38077 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757997Ab2IYVK0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Sep 2012 17:10:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>
Cc: Linux-Next <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org

http://kisskb.ellerman.id.au/kisskb/buildresult/7270498/

> arch/frv/kernel/entry.S:871: Error: VLIW packing constraint violation

What's wrong there? Introduced by "frv: split ret_from_fork, simplify
kernel_thread() a lot"

> make[2]: *** [arch/frv/kernel/entry.o] Error 1
> arch/frv/kernel/process.c:197:3: error: 'chilregs' undeclared (first use in this function)

typo in "frv: switch to generic kernel_thread()", should be "childregs"

> make[2]: *** [arch/frv/kernel/process.o] Error 1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
