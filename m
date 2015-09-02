From: Roger Willcocks <roger@filmlight.ltd.uk>
Subject: Re: linux-next: manual merge of the block tree with the xfs tree
Date: Wed, 02 Sep 2015 14:34:51 +0100
Message-ID: <1441200891.17400.1277.camel@localhost.localdomain>
References: <20150902121649.7a686b6c@canb.auug.org.au>
	 <C57DF728-E46C-433C-AA9D-209557D795E2@filmlight.ltd.uk>
	 <20150902230342.125e23ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from c.mx.filmlight.ltd.uk ([54.76.112.217]:60166 "EHLO
	c.mx.filmlight.ltd.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856AbbIBNex (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2015 09:34:53 -0400
In-Reply-To: <20150902230342.125e23ce@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, David Jeffery <djeffery@redhat.com>, linux-kernel@vger.kernel.org, xfs@oss.sgi.com, Ben Myers <bpm@sgi.com>, linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>


On Wed, 2015-09-02 at 23:03 +1000, Stephen Rothwell wrote:
> Hi Roger,
> 
> On Wed, 2 Sep 2015 10:45:29 +0100 Roger Willcocks <roger@filmlight.ltd.uk> wrote:
> >
> > On 2 Sep 2015, at 03:16, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 

> > > ++	if (!ioend->io_error)
> > > ++		ioend->io_error = bio->bi_error;

> > 
> > This is incorrect; it can clear an earlier error status. It should probably read:
> > 
> >  	if (!ioend->io_error && bio->bi_error)
> >  		ioend->io_error = bio->bi_error;
> 
> Thanks, I will use that from tomorrow.
> 

Huh, now I've had my coffee, that extra check doesn't add anything.
(There's no harm done in assigning zero to io_error if it's already
zero.) Apologies for the noise.

-- 
Roger Willcocks <roger@filmlight.ltd.uk>
