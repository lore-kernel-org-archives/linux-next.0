From: Carles Pey <carles.pey@gmail.com>
Subject: linux-next: build failure
Date: Fri, 23 Dec 2011 00:55:00 +0100
Message-ID: <CAHfT02tghwTyzEFSjF4dP+dtHBxwjmOpHLd_JmgiV0py3EFb8g@mail.gmail.com>
References: <CAHfT02u5as-YvAvwznMveNY_FbeDWLbj0NL6O78MRfeLQ5mpsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:43205 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753446Ab1LVXzB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Dec 2011 18:55:01 -0500
Received: by pbdu13 with SMTP id u13so3849571pbd.19
        for <linux-next@vger.kernel.org>; Thu, 22 Dec 2011 15:55:00 -0800 (PST)
In-Reply-To: <CAHfT02u5as-YvAvwznMveNY_FbeDWLbj0NL6O78MRfeLQ5mpsA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Hi all,

It failed while building today's linux-next commit 4765f871e50f0 on i68=
6:

drivers/block/paride/bpck6.c:24: error: expected =91=3D=92, =91,=92, =91=
;=92, =91asm=92
or =91__attribute__=92 before =91verbose=92
drivers/block/paride/bpck6.c: In function =91bpck6_connect=92:
drivers/block/paride/bpck6.c:94: error: =91verbose=92 undeclared (first
use in this function)
drivers/block/paride/bpck6.c:94: error: (Each undeclared identifier is
reported only once
drivers/block/paride/bpck6.c:94: error: for each function it appears in=
=2E)
drivers/block/paride/bpck6.c: In function =91bpck6_disconnect=92:
drivers/block/paride/bpck6.c:118: error: =91verbose=92 undeclared (firs=
t
use in this function)
drivers/block/paride/bpck6.c: In function =91bpck6_test_port=92:
drivers/block/paride/bpck6.c:128: error: =91verbose=92 undeclared (firs=
t
use in this function)
drivers/block/paride/bpck6.c: In function =91bpck6_probe_unit=92:
drivers/block/paride/bpck6.c:162: error: =91verbose=92 undeclared (firs=
t
use in this function)
drivers/block/paride/bpck6.c: In function =91bpck6_init=92:
drivers/block/paride/bpck6.c:253: error: =91verbose=92 undeclared (firs=
t
use in this function)
drivers/block/paride/bpck6.c: In function =91__check_verbose=92:
drivers/block/paride/bpck6.c:266: error: =91verbose=92 undeclared (firs=
t
use in this function)
drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92 i=
n
declaration of =91type name=92
drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92 i=
n
declaration of =91type name=92
drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92 i=
n
declaration of =91type name=92
drivers/block/paride/bpck6.c:266: error: size of array =91type name=92 =
is negative
drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92 i=
n
declaration of =91type name=92
drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92 i=
n
declaration of =91type name=92
drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92 i=
n
declaration of =91type name=92
drivers/block/paride/bpck6.c: At top level:
drivers/block/paride/bpck6.c:266: error: =91verbose=92 undeclared here
(not in a function)
drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92 i=
n
declaration of =91type name=92
make[2]: *** [drivers/block/paride/bpck6.o] Error 1
make[1]: *** [drivers/block/paride] Error 2
make: *** [drivers] Error 2

Apparently due to the change in commit a367680f90a94

Carles
