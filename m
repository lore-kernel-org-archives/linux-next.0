From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [-next] error: 'PRID_IMP_M5150' undeclared (first use in this function)
Date: Tue, 11 Mar 2014 09:46:43 +0100
Message-ID: <CAMuHMdVspeUUMCfiuf4g5iQ6uryZMKLqsR9WLHQ6=GygTtv9-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:44014 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753446AbaCKIqp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Mar 2014 04:46:45 -0400
Received: by mail-pb0-f41.google.com with SMTP id jt11so8540484pbb.28
        for <linux-next@vger.kernel.org>; Tue, 11 Mar 2014 01:46:44 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux-Next <linux-next@vger.kernel.org>

Hi Ralf,

http://kisskb.ellerman.id.au/kisskb/buildresult/10701849/
arch/mips/kernel/cpu-probe.c:856:7: error: 'PRID_IMP_M5150' undeclared
(first use in this function)
arch/mips/kernel/cpu-probe.c:857:16: error: 'CPU_M5150' undeclared
(first use in this function)

Apparently you've applied on patch [3/3] of the series, and forgot the 2
prerequisites?

https://patchwork.linux-mips.org/patch/6595/
https://patchwork.linux-mips.org/patch/6596/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
