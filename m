From: Jeff Layton <jlayton@poochiereds.net>
Subject: Re: linux-next: manual merge of the kspp tree with the file-locks
 tree
Date: Mon, 03 Jul 2017 06:27:27 -0400
Message-ID: <1499077647.4737.2.camel@poochiereds.net>
References: <20170621163211.35abbb57@canb.auug.org.au>
         <20170703114807.70d7624d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170703114807.70d7624d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook <keescook@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2017-07-03 at 11:48 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> With the merge window opening, just a reminder that this conflict still
> exists.
> 
> On Wed, 21 Jun 2017 16:32:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > Today's linux-next merge of the kspp tree got a conflict in:
> > 
> >   include/linux/fs.h
> > 
> > between commits:
> > 
> >   7356fd927059 ("fs: new infrastructure for writeback error handling and reporting")
> >   c7fe314be636 ("fs: add f_md_wb_err field to struct file for tracking metadata errors")
> > 
> > from the file-locks tree and commit:
> > 
> >   1a12979f61e4 ("randstruct: Mark various structs for randomization")
> > 
> > from the kspp tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc include/linux/fs.h
> > index 39e4603cd17a,8f28143486c4..000000000000
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@@ -397,8 -392,7 +397,8 @@@ struct address_space 
> >   	gfp_t			gfp_mask;	/* implicit gfp mask for allocations */
> >   	struct list_head	private_list;	/* ditto */
> >   	void			*private_data;	/* ditto */
> >  +	errseq_t		wb_err;
> > - } __attribute__((aligned(sizeof(long))));
> > + } __attribute__((aligned(sizeof(long)))) __randomize_layout;
> >   	/*
> >   	 * On most architectures that alignment is already the case; but
> >   	 * must be enforced here for CRIS, to let the least significant bit
> > @@@ -875,8 -868,8 +875,9 @@@ struct file 
> >   	struct list_head	f_tfile_llink;
> >   #endif /* #ifdef CONFIG_EPOLL */
> >   	struct address_space	*f_mapping;
> >  +	errseq_t		f_md_wb_err; /* metadata wb error tracking */
> > - } __attribute__((aligned(4)));	/* lest something weird decides that 2 is OK */
> > + } __randomize_layout
> > +   __attribute__((aligned(4)));	/* lest something weird decides that 2 is OK */
> >   
> >   struct file_handle {
> >   	__u32 handle_bytes;
> 
> 

Thanks.

I think this is fairly trivial conflict -- Kees is adding the
__randomize_layout attribute here, and I'm just adding a field to each
of these structs.

The main catch is that both of these branches have a fair number of
preparatory patches before the above changes occur, so pulling one into
the other is not trivial.

Would it be best to just send the PRs to Linus and have him fix this up
in the final merge?
-- 
Jeff Layton <jlayton@poochiereds.net>
