From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [-next] ERROR: "epapr_hypercall_start" [drivers/tty/ehv_bytechan.ko] undefined!
Date: Fri, 10 Aug 2012 09:43:54 +0200
Message-ID: <CAMuHMdV9dgjdHuz3avU1dubyekcZwT70x=5W+CL7iHQuoC1n_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:34359 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751595Ab2HJHnz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Aug 2012 03:43:55 -0400
Received: by vbbff1 with SMTP id ff1so858785vbb.19
        for <linux-next@vger.kernel.org>; Fri, 10 Aug 2012 00:43:54 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@lists.ozlabs.org, Linux-Next <linux-next@vger.kernel.org>

Sicne a few days, powerpc allmodconfig fails with:

ERROR: "epapr_hypercall_start" [drivers/tty/ehv_bytechan.ko] undefined!
make[2]: *** [__modpost] Error 1
make[1]: *** [modules] Error 2

http://kisskb.ellerman.id.au/kisskb/buildresult/6883300/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
