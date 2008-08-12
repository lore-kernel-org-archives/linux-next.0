From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: ubifs tree build failure
Date: Tue, 12 Aug 2008 20:24:44 +0200
Message-ID: <20080812182444.GB14420@lst.de>
References: <20080812162409.91834486.sfr@canb.auug.org.au> <48A13DB8.4090003@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:39295 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751052AbYHLSYv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 14:24:51 -0400
Content-Disposition: inline
In-Reply-To: <48A13DB8.4090003@nokia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, linux-next@vger.kernel.org

On Tue, Aug 12, 2008 at 10:37:28AM +0300, Artem Bityutskiy wrote:
> ext Stephen Rothwell wrote:
> >Hi Artem,
> >
> >Today's linux-next build (x86_64 allmodconfig) failed like this:
> >
> >fs/ubifs/super.c: In function 'ubifs_fh_to_dentry':
> >fs/ubifs/super.c:1611: error: implicit declaration of function 
> >'d_alloc_anon'
> >fs/ubifs/super.c:1611: warning: assignment makes pointer from integer 
> >without a cast
> >
> >Caused by interaction between commit
> >95b53e84e8899258a1af011a7216abb978afae26 ("kill d_alloc_anon") from the
> >vfs tree and b51e4badb0248ac75fe3128bb369d987e28b2f88 ("UBIFS: add NFS
> >support") from the ubifs tree.  The former removes d_alloc_anon and the
> >latter adds a new usage.
> >
> >For now, I have reverted the ubifs commit.  Christoph, maybe you could
> >provide a better solution.
> >
> >I have appended the reverted patch below.
> 
> I am not sure how to resolve things like this actually. I am planning to
> send ubifs-2.6.git upstream soon, so probably Christoph will be able to 
> amend
> his stuff after this. Or any other suggestion?

Please back this patch out, it's defintively not ready.
