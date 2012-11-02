From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: ccache: FATAL: Could not create /scratch/kisskb/ccache
Date: Fri, 2 Nov 2012 19:44:48 +0100
Message-ID: <CAMuHMdXhYNQ_7JOC3u7CS41mxgSKkuFYA7QdjZgeBawqMZQ9-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:63037 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932260Ab2KBSot (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 2 Nov 2012 14:44:49 -0400
Received: by mail-vc0-f174.google.com with SMTP id fk26so4043935vcb.19
        for <linux-next@vger.kernel.org>; Fri, 02 Nov 2012 11:44:48 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linux-Next <linux-next@vger.kernel.org>

http://kisskb.ellerman.id.au/kisskb/buildresult/7458505/

ccache: FATAL: Could not create
/scratch/kisskb/ccache/d/7/f9e308f728ef43aaa482aefb9a00a2-852386.o.tmp.stdout.Sprygo.5748
(permission denied?)
make[4]: *** [drivers/media/rc/ene_ir.o] Error 1

http://kisskb.ellerman.id.au/kisskb/buildresult/7461979/

ccache: FATAL: Could not create
/scratch/kisskb/ccache/5/e/47d893acad42c07542edec1f826579-1842636.o.tmp.stdout.Sprygo.557
(permission denied?)
make[3]: *** [net/core/sock.o] Error 1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
