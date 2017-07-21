From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Fri, 21 Jul 2017 15:49:31 +0200
Message-ID: <20170721134931.GH2866@suse.cz>
References: <20170718101802.720dab22@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170718101802.720dab22@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Chris Mason <clm@fb.com>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 18, 2017 at 10:18:02AM +1000, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the btrfs-kdave tree got a conflict in:
> 
>   fs/btrfs/extent_io.c
> 
> between commit:
> 
>   e6959b9350c6 ("btrfs: add support for passing in write hints for buffered writes")
> 
> from Linus' tree and commit:
> 
>   41a3f2a7c062 ("btrfs: merge REQ_OP and REQ_ flags to one parameter in submit_extent_page")
> 
> from the btrfs-kdave tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> You should probably consider rebasing your for-next branch onto (at
> least v4.13-rc1) (or merging v4.13-rc1) to save these sort of
> (unnecessary) conflicts being ongoing during development and the next
> merge window.

tl;dr I'm going to rebase for-next to 4.12 again

I've started rebasing on top of rc1 but found that several tests double
the run time. I've observed something similar already during the merge
window when testing master + pull request branch. The submit bio calls
were particularly visible in the stacks so I'm suspecting some block
layer related change or my system is misconfigured.

In order to be able to debug the problems further, I need a branch that
will reproduce the good results. For that reason I'll rebase back my
for-next branche to the 4.12-rc7. The following merge conflict will
reappear.

> diff --cc fs/btrfs/extent_io.c
> index 0aff9b278c19,ead9e731e01b..000000000000
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@@ -2803,8 -2801,7 +2805,8 @@@ static int submit_extent_page(unsigned 
>   	bio_add_page(bio, page, page_size, offset);
>   	bio->bi_end_io = end_io_func;
>   	bio->bi_private = tree;
>  +	bio->bi_write_hint = page->mapping->host->i_write_hint;
> - 	bio_set_op_attrs(bio, op, op_flags);
> + 	bio->bi_opf = opf;
>   	if (wbc) {
>   		wbc_init_bio(wbc, bio);
>   		wbc_account_io(wbc, page, page_size);
