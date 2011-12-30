From: Carles Pey <carles.pey@gmail.com>
Subject: Re: linux-next: build failure
Date: Fri, 30 Dec 2011 20:43:42 +0100
Message-ID: <CAHfT02tn+Hcp1A7BOF1JBGMJOa8xoDtxTzvmRunyp2_WXL4pSw@mail.gmail.com>
References: <CAHfT02u5as-YvAvwznMveNY_FbeDWLbj0NL6O78MRfeLQ5mpsA@mail.gmail.com>
	<CAHfT02tghwTyzEFSjF4dP+dtHBxwjmOpHLd_JmgiV0py3EFb8g@mail.gmail.com>
	<20111223170855.4af1442474b6d72afa7574b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:50990 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237Ab1L3Tno convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Dec 2011 14:43:44 -0500
Received: by dajs34 with SMTP id s34so8936516daj.19
        for <linux-next@vger.kernel.org>; Fri, 30 Dec 2011 11:43:43 -0800 (PST)
In-Reply-To: <20111223170855.4af1442474b6d72afa7574b8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

2011/12/23 Stephen Rothwell <sfr@canb.auug.org.au>:
> [Just letting Rusty know]
>
> On Fri, 23 Dec 2011 00:55:00 +0100 Carles Pey <carles.pey@gmail.com> =
wrote:
>>
>> Hi all,
>>
>> It failed while building today's linux-next commit 4765f871e50f0 on =
i686:
>>
>> drivers/block/paride/bpck6.c:24: error: expected =91=3D=92, =91,=92,=
 =91;=92, =91asm=92
>> or =91__attribute__=92 before =91verbose=92
>> drivers/block/paride/bpck6.c: In function =91bpck6_connect=92:
>> drivers/block/paride/bpck6.c:94: error: =91verbose=92 undeclared (fi=
rst
>> use in this function)
>> drivers/block/paride/bpck6.c:94: error: (Each undeclared identifier =
is
>> reported only once
>> drivers/block/paride/bpck6.c:94: error: for each function it appears=
 in.)
>> drivers/block/paride/bpck6.c: In function =91bpck6_disconnect=92:
>> drivers/block/paride/bpck6.c:118: error: =91verbose=92 undeclared (f=
irst
>> use in this function)
>> drivers/block/paride/bpck6.c: In function =91bpck6_test_port=92:
>> drivers/block/paride/bpck6.c:128: error: =91verbose=92 undeclared (f=
irst
>> use in this function)
>> drivers/block/paride/bpck6.c: In function =91bpck6_probe_unit=92:
>> drivers/block/paride/bpck6.c:162: error: =91verbose=92 undeclared (f=
irst
>> use in this function)
>> drivers/block/paride/bpck6.c: In function =91bpck6_init=92:
>> drivers/block/paride/bpck6.c:253: error: =91verbose=92 undeclared (f=
irst
>> use in this function)
>> drivers/block/paride/bpck6.c: In function =91__check_verbose=92:
>> drivers/block/paride/bpck6.c:266: error: =91verbose=92 undeclared (f=
irst
>> use in this function)
>> drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92=
 in
>> declaration of =91type name=92
>> drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92=
 in
>> declaration of =91type name=92
>> drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92=
 in
>> declaration of =91type name=92
>> drivers/block/paride/bpck6.c:266: error: size of array =91type name=92=
 is negative
>> drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92=
 in
>> declaration of =91type name=92
>> drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92=
 in
>> declaration of =91type name=92
>> drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92=
 in
>> declaration of =91type name=92
>> drivers/block/paride/bpck6.c: At top level:
>> drivers/block/paride/bpck6.c:266: error: =91verbose=92 undeclared he=
re
>> (not in a function)
>> drivers/block/paride/bpck6.c:266: warning: type defaults to =91int=92=
 in
>> declaration of =91type name=92
>> make[2]: *** [drivers/block/paride/bpck6.o] Error 1
>> make[1]: *** [drivers/block/paride] Error 2
>> make: *** [drivers] Error 2
>>
>> Apparently due to the change in commit a367680f90a94
>>
>> Carles
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/

I moved the declaration after the includes:

diff --git a/drivers/block/paride/bpck6.c b/drivers/block/paride/bpck6.=
c
index 16dcfa9..54cc34e 100644
--- a/drivers/block/paride/bpck6.c
+++ b/drivers/block/paride/bpck6.c
@@ -21,7 +21,6 @@


 /* PARAMETERS */
-static bool verbose; /* set this to 1 to see debugging messages and wh=
atnot */

 #define BACKPACK_VERSION "2.0.2"

@@ -37,6 +36,7 @@ static bool verbose; /* set this to 1 to see
debugging messages and whatnot */
 #include "paride.h"


+static bool verbose; /* set this to 1 to see debugging messages and wh=
atnot */

 #define PPCSTRUCT(pi) ((Interface *)(pi->private))


Carles
