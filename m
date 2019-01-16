From: Ming Lei <ming.lei@redhat.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 16 Jan 2019 10:50:50 +0800
Message-ID: <20190116025048.GB26146@ming.t460p>
References: <20190116134824.74c2d7da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190116134824.74c2d7da@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 16, 2019 at 01:48:24PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> fs/gfs2/lops.c: In function 'gfs2_end_log_read':
> fs/gfs2/lops.c:394:39: error: macro "bio_for_each_segment_all" requires 4 arguments, but only 3 given
>   bio_for_each_segment_all(bvec, bio, i) {
>                                        ^
> fs/gfs2/lops.c:394:2: error: 'bio_for_each_segment_all' undeclared (first use in this function); did you mean 'bio_first_page_all'?
>   bio_for_each_segment_all(bvec, bio, i) {
>   ^~~~~~~~~~~~~~~~~~~~~~~~
>   bio_first_page_all
> fs/gfs2/lops.c:394:2: note: each undeclared identifier is reported only once for each function it appears in
> fs/gfs2/lops.c:394:26: error: expected ';' before '{' token
>   bio_for_each_segment_all(bvec, bio, i) {
>                           ^              ~
>                           ;
> 
> Caused by commit
> 
>   eb754eb2a953 ("block: allow bio_for_each_segment_all() to iterate over multi-page bvec")
> 
> One instance of bio_for_each_segment_all() was missed.
> 
> I have applied the following fix patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 16 Jan 2019 13:44:02 +1100
> Subject: [PATCH] block: fix up for bio_for_each_segment_all() API change
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/gfs2/lops.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index ef68bf6232e7..15deefeaafd0 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -390,8 +390,9 @@ static void gfs2_end_log_read(struct bio *bio)
>  	struct page *page;
>  	struct bio_vec *bvec;
>  	int i;
> +	struct bvec_iter_all iter_all;
>  
> -	bio_for_each_segment_all(bvec, bio, i) {
> +	bio_for_each_segment_all(bvec, bio, i, iter_all) {
>  		page = bvec->bv_page;
>  		if (bio->bi_status) {
>  			int err = blk_status_to_errno(bio->bi_status);

Yeah, we need the fix, and I just posted it minutes ago, sorry for
the trouble, :-(

https://marc.info/?l=linux-block&m=154760499205773&w=2

Thanks,
Ming
