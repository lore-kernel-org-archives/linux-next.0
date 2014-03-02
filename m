From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: kissb mkimage doesn't support extensa
Date: Sun, 2 Mar 2014 11:25:07 +0100
Message-ID: <CAMuHMdU2L+m4-dKNAacqrLw66obsFYVKu8x1n6=up7Mkg1HL_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:37399 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751765AbaCBKZH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 2 Mar 2014 05:25:07 -0500
Received: by mail-pd0-f170.google.com with SMTP id v10so504950pde.1
        for <linux-next@vger.kernel.org>; Sun, 02 Mar 2014 02:25:07 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <michael@ellerman.id.au>
Cc: Linux-Next <linux-next@vger.kernel.org>

http://kisskb.ellerman.id.au/kisskb/buildresult/10665903/

Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k,
microblaze, mips, mips64, nios, nios2, ppc, s390, sh, sparc, sparc64,
blackfin, avr32
Usage: /usr/local/bin/mkimage -l image
          -l ==> list image header information
       /usr/local/bin/mkimage [-x] -A arch -O os -T type -C comp -a
addr -e ep -n name -d data_file[:data_file...] image
          -A ==> set architecture to 'arch'
          -O ==> set operating system to 'os'
          -T ==> set image type to 'type'
          -C ==> set compression type 'comp'
          -a ==> set load address to 'addr' (hex)
          -e ==> set entry point to 'ep' (hex)
          -n ==> set image name to 'name'
          -d ==> use image data from 'datafile'
          -x ==> set XIP (execute in place)
make[3]: *** [arch/xtensa/boot/boot-uboot/../uImage] Error 1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
