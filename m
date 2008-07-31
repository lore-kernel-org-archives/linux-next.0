From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the m68k tree
Date: Thu, 31 Jul 2008 09:02:17 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807310900540.10810@anakin>
References: <20080731140557.a9c66bb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:38284 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752958AbYGaHCU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Jul 2008 03:02:20 -0400
In-Reply-To: <20080731140557.a9c66bb3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Stephen,

On Thu, 31 Jul 2008, Stephen Rothwell wrote:
> Today's linux-next merge of the m68k tree got a conflict in init/main.c

Sorry, still haven't updated my queue after OLS...

> between commit bd673c7c3b1681dbfabab0062e67398dadf806af ("initrd: cast
> `initrd_start' to `void *'") from Linus' tree and commit
> d9c4ef589d1eda15333fb3d307bf4df85337820a ("initrd: Fix virtual/physical
> mix-up in overwrite test") from the m68k tree (which is also in Linus'
> tree).

Interesting, so git didn't notice that my version got merged, and an
additional patch was applied on top?

> I took the version from Linus' tree.

Yep, that's the correct one. Thx!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
