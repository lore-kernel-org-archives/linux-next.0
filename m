From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the ia64 tree with the asm-generic tree
Date: Mon, 08 Oct 2012 17:25:26 +0100
Message-ID: <29959.1349713526@warthog.procyon.org.uk>
References: <20121008101131.a99cc80086482d0b1fc2c230@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46703 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751200Ab2JHQZk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Oct 2012 12:25:40 -0400
In-Reply-To: <20121008101131.a99cc80086482d0b1fc2c230@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, "Luck, Tony" <tony.luck@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Arnd Bergmann <arnd@arndb.de>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the ia64 tree got a conflict in
> arch/ia64/include/asm/Kbuild between commit e7a570ff7dff ("asm-generic:
> Add default clkdev.h") from the asm-generic tree and commit f68301fee715
> ("UAPI: (Scripted) Disintegrate arch/ia64/include/asm") from the ia64
> tree.
> 
> I fixed it up (see below - I am not sure if this is the correct fix) and
> can carry the fix as necessary (no action is required).

It is.

"header +=" and "genhdr +=" belong in the UAPI Kbuild; "generic +=" belongs in
the original Kbuild.

In his pull request, Arnd said:

	There may be a few small merge conflicts between Mark's patch and the
 	following arch header file split patches. In each case the solution
 	will be to keep the new "generic-y += clkdev.h" line, even if it ends
 	up being the only line in the Kbuild file.

David
