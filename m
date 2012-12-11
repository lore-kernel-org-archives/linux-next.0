From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: some merging notes
Date: Wed, 12 Dec 2012 10:19:19 +1100
Message-ID: <1355267959.19932.40.camel@pasglop>
References: <20121212091552.02c72c8926f9f9147b080d68@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:44608 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754052Ab2LKXV4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Dec 2012 18:21:56 -0500
In-Reply-To: <20121212091552.02c72c8926f9f9147b080d68@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Greg KH <greg@kroah.com>, Steven Rostedt <srostedt@redhat.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, "N, Mugunthan V" <mugunthanvnm@ti.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Bill Pemberton <wfp5p@virginia.edu>

On Wed, 2012-12-12 at 09:15 +1100, Stephen Rothwell wrote:
> The powerpc tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/benh/powerpc.git#next)
> contains a commit that breaks the building of
> lib/pSeries-reconfig-notifier-error-inject.c.  I applied a patch to
> linux-next to disable CONFIG_PSERIES_RECONFIG_NOTIFIER_ERROR_INJECT.

I will put a fix in before I send the pull request.

Cheers,
Ben.
