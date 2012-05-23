From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for May 23 (uml)
Date: Wed, 23 May 2012 22:51:26 +0200
Message-ID: <CAMuHMdVVtMwuXULhK3dHexdSex+7JSj=Vk9z8fWohfMvrOuCWQ@mail.gmail.com>
References: <20120523170740.ae058d8d5468d471eb948c39@canb.auug.org.au>
	<4FBD090E.5020901@xenotime.net>
	<20120523181917.GN11775@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:61134 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753183Ab2EWUv2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 May 2012 16:51:28 -0400
In-Reply-To: <20120523181917.GN11775@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>

On Wed, May 23, 2012 at 8:19 PM, Al Viro <viro@zeniv.linux.org.uk> wrot=
e:
>> uml defconfig on x86_64:
>>
>> arch/um/kernel/process.c: In function 'interrupt_end':
>> arch/um/kernel/process.c:122:14: error: 'struct task_struct' has no =
member named 'replacement_session_keyring'
>> arch/um/kernel/process.c:123:4: error: implicit declaration of funct=
ion 'key_replace_session_keyring'
>
> Grr... =C2=A0That's a conflict between uml gaining TIF_NOTIFY_RESUME =
(needed
> prereq to task_work_add() series) and patch in said series doing away
> with explicit calls of key_replace_session_keyring(). =C2=A0Fixup is =
to remove
> those two lines in arch/um/process.c, same as done on other architect=
ures
> by "keys: kill the dummy key_replace_session_keyring()" (commit c1cb0=
01).

JFYI, also on m68k:

http://kisskb.ellerman.id.au/kisskb/buildresult/6353103/

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
