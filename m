From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Mon, 29 Jun 2009 13:50:38 +0200
Message-ID: <20090629115038.GD9321@osiris.boeblingen.de.ibm.com>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com> <20090629103943.GA31299@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.de.ibm.com ([195.212.29.155]:49780 "EHLO
	mtagate6.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751549AbZF2Luh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2009 07:50:37 -0400
Content-Disposition: inline
In-Reply-To: <20090629103943.GA31299@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Sachin Sant <sachinp@in.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Mon, Jun 29, 2009 at 12:39:43PM +0200, Nick Piggin wrote:
> On Mon, Jun 29, 2009 at 12:31:23PM +0200, Heiko Carstens wrote:
> > On Mon, Jun 29, 2009 at 03:14:40PM +0530, Sachin Sant wrote:
> > > I still have problems booting next with SLQB on a s390 box.
> > >
> > > Write protected kernel read-only data: 0x12000 - 0x446fff
> > > Experimental hierarchical RCU implementation.
> > > Experimental hierarchical RCU init done.
> > > console =DDttyS0=A8 enabled
> > > Unable to handle kernel pointer dereference at virtual kernel add=
ress (null)
>=20
> This could I suppose be due to failed allocation where the caller
> isn't expecting failure (or using SLAB_PANIC).
>=20
> Did you manage to test with the prink debugging patch for SLQB that
> I sent for the power6 boot failure? I don't think I saw a reply from
> you but maybe I missed it?

Could you send me the debug patch as well? I can give it a quick run as=
 well.
