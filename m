From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Consult] About only one Signed-of-by for the patches
Date: Tue, 27 May 2014 09:23:38 +0800
Message-ID: <5383E91A.4010208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:51433 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751443AbaE0BXn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 May 2014 21:23:43 -0400
Received: by mail-pb0-f53.google.com with SMTP id md12so8356091pbc.40
        for <linux-next@vger.kernel.org>; Mon, 26 May 2014 18:23:42 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guan Xuetao <gxt@mprc.pku.edu.cn>, sfr@canb.auug.org.au, linux-next@vger.kernel.org

Hello Maintainers:

I find some of patches are only Signed-of-by me, are they OK?

e.g:

commit d7de15786d1a10fa18b80fd44026d442e7a84bd2
Author: Chen Gang <gang.chen.5i5j@gmail.com>
Date:   Tue Apr 15 09:21:30 2014 +0800

    arch:unicore32:mm: add devmem_is_allowed() to support STRICT_DEVMEM
   =20
    unicore32 supports STRICT_DEVMEM, so it needs devmem_is_allowed(), =
like
    some of other architectures have done (e.g. arm, powerpc, x86 ...).
   =20
    The related error with allmodconfig:
   =20
        CC      drivers/char/mem.o
      drivers/char/mem.c: In function =E2<U+0080><U+0098>range_is_allow=
ed=E2<U+0080><U+0099>:
      drivers/char/mem.c:69: error: implicit declaration of function =E2=
<U+0080><U+0098>devmem_is_allowed=E2<U+0080><U+0099>
      make[2]: *** [drivers/char/mem.o] Error 1
      make[1]: *** [drivers/char] Error 2
      make: *** [drivers] Error 2
   =20
    Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
    Acked-by: Xuetao Guan <gxt@mprc.pku.edu.cn>


Thanks.
--=20
Chen Gang

Open, share, and attitude like air, water, and life which God blessed
