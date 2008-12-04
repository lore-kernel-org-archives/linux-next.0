From: Christoph Hellwig <hch@infradead.org>
Subject: Re: XFS breakage on m68k (was: Re: linux-next: Tree for December 3)
Date: Thu, 4 Dec 2008 07:13:30 -0500
Message-ID: <20081204121330.GA18815@infradead.org>
References: <20081203183602.c06f8c39.sfr@canb.auug.org.au> <Pine.LNX.4.64.0812040956370.10635@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:33062 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751348AbYLDMNn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Dec 2008 07:13:43 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0812040956370.10635@anakin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Eric Sandeen <sandeen@sandeen.net>, Christoph Hellwig <hch@lst.de>, Lachlan McIlroy <lachlan@sgi.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

On Thu, Dec 04, 2008 at 10:02:15AM +0100, Geert Uytterhoeven wrote:
> On Wed, 3 Dec 2008, Stephen Rothwell wrote:
> > Status of my local build tests will be at
> > http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> > advice about cross compilers/configs that work, we are always open to add
> > more builds.
> 
> On m68k (32-bit only, no compat32), XFS fails to build in linux-next:

Yeah, it's broken on all 32bit platforms.  Today's xfs tree has a fix
for it.
