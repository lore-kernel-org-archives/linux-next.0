From: Ingo Molnar <mingo@elte.hu>
Subject: [PATCH] tracing, tty: fix warnings caused by branch tracing and
	tty_kref_get()
Date: Tue, 25 Nov 2008 13:19:56 +0100
Message-ID: <20081125121956.GA26727@elte.hu>
References: <20081125133828.8f9b49df.sfr@canb.auug.org.au> <20081125102515.54282c0d@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:42929 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751363AbYKYMUY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 07:20:24 -0500
Content-Disposition: inline
In-Reply-To: <20081125102515.54282c0d@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>, Alan Cox <alan@redhat.com>


* Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:

> On Tue, 25 Nov 2008 13:38:28 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Hi all,
> >=20
> > Today's linux-next build (x86_64 allmodconfig) produced lots of the=
se
> > warnings:
> >=20
> > include/linux/tty.h:330: warning: '______f' is static but declared =
in inline function 'tty_kref_get' which is not static
> >=20
> > Caused by commit 2bcd521a684cc94befbe2ce7d5b613c841b0d304 ("trace:
> > profile all if conditionals").  Something needs to be done about
> > this ...  maybe tty_kref_get needs to be "static inline" instead of
> > "extern inline"?
>=20
> If someone from the ftrace crew can sort the problem out and send me=20
> a diff for the ttydev tree that shouldn't be a problem, but really=20
> it looks like a problem with ftrace as that can't be the only case=20
> this happens surely ?

i've done quite wide build testing of it and tty.h seems to be the=20
only affected file triggering a warning due to this. ('extern inline'=20
has been eliminated from most of the kernel in recent cycles)

	Ingo

---------------->
=46rom 14bfc987e395797dfe03e915e8b4c7fc9e5078e4 Mon Sep 17 00:00:00 200=
1
=46rom: Ingo Molnar <mingo@elte.hu>
Date: Tue, 25 Nov 2008 08:58:11 +0100
Subject: [PATCH] tracing, tty: fix warnings caused by branch tracing an=
d tty_kref_get()
MIME-Version: 1.0
Content-Type: text/plain; charset=3Dutf-8
Content-Transfer-Encoding: 8bit

Stephen Rothwell reported tht this warning started triggering in
linux-next:

  In file included from init/main.c:27:
  include/linux/tty.h: In function =E2=80=98tty_kref_get=E2=80=99:
  include/linux/tty.h:330: warning: =E2=80=98______f=E2=80=99 is static=
 but declared in inline function =E2=80=98tty_kref_get=E2=80=99 which i=
s not static

Which gcc emits for 'extern inline' functions that nevertheless define
static variables. Change it to 'static inline', which is the norm
in the kernel anyway.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 include/linux/tty.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/tty.h b/include/linux/tty.h
index 3b8121d..eaec37c 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -325,7 +325,7 @@ extern struct class *tty_class;
  *	go away
  */
=20
-extern inline struct tty_struct *tty_kref_get(struct tty_struct *tty)
+static inline struct tty_struct *tty_kref_get(struct tty_struct *tty)
 {
 	if (tty)
 		kref_get(&tty->kref);
