From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree with the
	tracing tree
Date: Fri, 6 Mar 2009 11:27:09 +0100
Message-ID: <20090306102709.GB31042@elte.hu>
References: <20090306172721.40347f41.sfr@canb.auug.org.au> <19f34abd0903060014p4895f169vc6759b672aa399aa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:44942 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751055AbZCFK1T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 05:27:19 -0500
Content-Disposition: inline
In-Reply-To: <19f34abd0903060014p4895f169vc6759b672aa399aa@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org


* Vegard Nossum <vegard.nossum@gmail.com> wrote:

> 2009/3/6 Stephen Rothwell <sfr@canb.auug.org.au>:
> > Hi all,
> >
> > Today's linux-next merge of the kmemcheck tree got a conflict in
> > kernel/trace/ring_buffer.c between commit
> > a81bd80a0b0a405dc0483e2c428332d69da2c79f ("ring-buffer: use generic
> > version of in_nmi") from the tracing tree and commit
> > 9b7ff384ee76ced9638ab236db588a6f13916336 ("trace: annotate bitfield=
s in
> > struct ring_buffer_event") from the kmemcheck tree.
> >
> > Just simple overlapping additions. =A0I fixed it up (see below) and=
 can
> > carry the fix as necessary.
> > --
> > Cheers,
> > Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.au=
ug.org.au
> > http://www.canb.auug.org.au/~sfr/
> >
> > diff --cc kernel/trace/ring_buffer.c
> > index f747364,b1f2f60..0000000
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@@ -9,7 -7,7 +9,8 @@@
> > =A0#include <linux/spinlock.h>
> > =A0#include <linux/debugfs.h>
> > =A0#include <linux/uaccess.h>
> > =A0+#include <linux/hardirq.h>
> > + #include <linux/kmemcheck.h>
> > =A0#include <linux/module.h>
> > =A0#include <linux/percpu.h>
> > =A0#include <linux/mutex.h>
> >
>=20
> Isn't it amazing how we both managed to put our new include in=20
> exactly the same spot? :-D

Yeah - i tend to shuffle patches and order include file sections=20
of headers to reduce it - but most of the time it doesnt matter=20
as fixing such a conflict is about 2 seconds.

> Anyway, thanks for fixing these up, it looks good to me!

I suspect it's the same resolution like what i did in tip:master=20
a few days ago or so? I dont send out notifications about=20
trivial conflicts, only about non-trivial conflicts that i'm=20
unsure about. That's rare - when i see a non-trivial conflict i=20
work on eliminating it.

	Ingo
