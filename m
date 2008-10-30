From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Fri, 31 Oct 2008 00:03:55 +0100
Message-ID: <20081030230355.GA918@elte.hu>
References: <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com> <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com> <49008D12.5090204@gmail.com> <Pine.LNX.4.64.0810231635440.18978@anakin> <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com> <Pine.LNX.4.64.0810231727430.18978@anakin> <4900B414.7090002@gmail.com> <20081023163433.GA3160@x200.localdomain> <20081030214910.GA14679@x200.localdomain> <c62985530810301557x2c92a78ay49cdc72931b6caae@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:59857 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753616AbYJ3XEI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Oct 2008 19:04:08 -0400
Content-Disposition: inline
In-Reply-To: <c62985530810301557x2c92a78ay49cdc72931b6caae@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>


* Fr=E9d=E9ric Weisbecker <fweisbec@gmail.com> wrote:

> 2008/10/30 Alexey Dobriyan <adobriyan@gmail.com>:
> > On Thu, Oct 23, 2008 at 08:34:33PM +0400, Alexey Dobriyan wrote:
> >> On Thu, Oct 23, 2008 at 07:27:48PM +0200, Frederic Weisbecker wrot=
e:
> >> > When tracing is enabled, some arch have included <linux/irqflags=
=2Eh>
> >> > on their <asm/system.h> but others like alpha or m68k don't.
> >> >
> >> > Build error on alpha:
> >> >
> >> > kernel/trace/trace.c: In function 'tracing_generic_entry_update'=
:
> >> > kernel/trace/trace.c:658: error: implicit declaration of functio=
n 'irqs_disabled_flags'
> >
> > FYI, this error still exists in mainline (7f82f000ed030d1108b4de47d=
9e2d556092980c6).
> >
>=20
> Thanks.
>=20
> Yes Steven sent a patch to correct it: http://lkml.org/lkml/2008/10/2=
4/205
> But it has not been applied yet (still in discussion?).

i've just applied it to tip/tracing/urgent - should get to Linus=20
tomorrow-ish.

	Ingo
