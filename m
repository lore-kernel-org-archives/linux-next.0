From: Vegard Nossum <vegard.nossum@gmail.com>
Subject: Re: linux-next: manual merge of the kmemcheck tree with the tracing
	tree
Date: Fri, 6 Mar 2009 09:14:26 +0100
Message-ID: <19f34abd0903060014p4895f169vc6759b672aa399aa@mail.gmail.com>
References: <20090306172721.40347f41.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f176.google.com ([209.85.220.176]:64279 "EHLO
	mail-fx0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754170AbZCFIOa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2009 03:14:30 -0500
Received: by fxm24 with SMTP id 24so262362fxm.37
        for <linux-next@vger.kernel.org>; Fri, 06 Mar 2009 00:14:27 -0800 (PST)
In-Reply-To: <20090306172721.40347f41.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org

2009/3/6 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> Today's linux-next merge of the kmemcheck tree got a conflict in
> kernel/trace/ring_buffer.c between commit
> a81bd80a0b0a405dc0483e2c428332d69da2c79f ("ring-buffer: use generic
> version of in_nmi") from the tracing tree and commit
> 9b7ff384ee76ced9638ab236db588a6f13916336 ("trace: annotate bitfields =
in
> struct ring_buffer_event") from the kmemcheck tree.
>
> Just simple overlapping additions. =C2=A0I fixed it up (see below) an=
d can
> carry the fix as necessary.
> --
> Cheers,
> Stephen Rothwell =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>
> diff --cc kernel/trace/ring_buffer.c
> index f747364,b1f2f60..0000000
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@@ -9,7 -7,7 +9,8 @@@
> =C2=A0#include <linux/spinlock.h>
> =C2=A0#include <linux/debugfs.h>
> =C2=A0#include <linux/uaccess.h>
> =C2=A0+#include <linux/hardirq.h>
> + #include <linux/kmemcheck.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/percpu.h>
> =C2=A0#include <linux/mutex.h>
>

Isn't it amazing how we both managed to put our new include in exactly
the same spot? :-D

Anyway, thanks for fixing these up, it looks good to me!


Vegard

--=20
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
