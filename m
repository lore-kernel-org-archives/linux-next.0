From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the block tree with the xfs tree
Date: Wed, 2 Sep 2015 23:03:42 +1000
Message-ID: <20150902230342.125e23ce@canb.auug.org.au>
References: <20150902121649.7a686b6c@canb.auug.org.au>
	<C57DF728-E46C-433C-AA9D-209557D795E2@filmlight.ltd.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42134 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754671AbbIBNDo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Sep 2015 09:03:44 -0400
In-Reply-To: <C57DF728-E46C-433C-AA9D-209557D795E2@filmlight.ltd.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roger Willcocks <roger@filmlight.ltd.uk>
Cc: Jens Axboe <axboe@kernel.dk>, Ben Myers <bpm@sgi.com>, David Chinner <david@fromorbit.com>, xfs@oss.sgi.com, David Jeffery <djeffery@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Roger,

On Wed, 2 Sep 2015 10:45:29 +0100 Roger Willcocks <roger@filmlight.ltd.uk> wrote:
>
> On 2 Sep 2015, at 03:16, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Today's linux-next merge of the block tree got a conflict in:
> > 
> >  fs/xfs/xfs_aops.c
> > 
> > between commit:
> > 
> >  c9eb256eda44 ("xfs: return errors from partial I/O failures to files")
> > 
> > from the xfs tree and commit:
> > 
> >  4246a0b63bd8 ("block: add a bi_error field to struct bio")
> > 
> > from the block tree.
> > 
> > I fixed it up (I think - see below) and can carry the fix as necessary
> > (no action is required).
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > 
> > diff --cc fs/xfs/xfs_aops.c
> > index c8637073ef25,c77499bcbd7a..000000000000
> > --- a/fs/xfs/xfs_aops.c
> > +++ b/fs/xfs/xfs_aops.c
> > @@@ -354,8 -355,7 +353,8 @@@ xfs_end_bio
> >  {
> >  	xfs_ioend_t		*ioend = bio->bi_private;
> > 
> > - 	if (!ioend->io_error && !test_bit(BIO_UPTODATE, &bio->bi_flags))
> > - 		ioend->io_error = error;
> > -	ioend->io_error = bio->bi_error;
> > ++	if (!ioend->io_error)
> > ++		ioend->io_error = bio->bi_error;
> > 
> >  	/* Toss bio and pass work off to an xfsdatad thread */
> >  	bio->bi_private = NULL;
> > 
> > 
> 
> This is incorrect; it can clear an earlier error status. It should probably read:
> 
>  	if (!ioend->io_error && bio->bi_error)
>  		ioend->io_error = bio->bi_error;

Thanks, I will use that from tomorrow.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
