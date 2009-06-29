From: Nick Piggin <npiggin@suse.de>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Mon, 29 Jun 2009 12:39:43 +0200
Message-ID: <20090629103943.GA31299@wotan.suse.de>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:43560 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751421AbZF2Kjp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jun 2009 06:39:45 -0400
Content-Disposition: inline
In-Reply-To: <20090629103123.GC9321@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Sachin Sant <sachinp@in.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Mon, Jun 29, 2009 at 12:31:23PM +0200, Heiko Carstens wrote:
> On Mon, Jun 29, 2009 at 03:14:40PM +0530, Sachin Sant wrote:
> > I still have problems booting next with SLQB on a s390 box.
> >
> > Write protected kernel read-only data: 0x12000 - 0x446fff
> > Experimental hierarchical RCU implementation.
> > Experimental hierarchical RCU init done.
> > console =DDttyS0=A8 enabled
> > Unable to handle kernel pointer dereference at virtual kernel addre=
ss (null)

This could I suppose be due to failed allocation where the caller
isn't expecting failure (or using SLAB_PANIC).

Did you manage to test with the prink debugging patch for SLQB that
I sent for the power6 boot failure? I don't think I saw a reply from
you but maybe I missed it?

Thanks,
Nick
