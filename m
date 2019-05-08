From: Gao Xiang <gaoxiang25@huawei.com>
Subject: Re: linux-next: manual merge of the staging tree with the block tree
Date: Wed, 8 May 2019 14:02:19 +0800
Message-ID: <b864d776-d671-b95e-e8bc-85c00bfb669f@huawei.com>
References: <20190501170528.2d86d133@canb.auug.org.au>
 <20190508134413.26a13d00@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508134413.26a13d00@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Greg KH <greg@kroah.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 2019/5/8 11:44, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 1 May 2019 17:05:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the staging tree got conflicts in:
>>
>>   drivers/staging/erofs/data.c
>>   drivers/staging/erofs/unzip_vle.c
>>
>> between commit:
>>
>>   2b070cfe582b ("block: remove the i argument to bio_for_each_segment_all")
>>
>> from the block tree and commit:
>>
>>   14a56ec65bab ("staging: erofs: support IO read error injection")
>>
>> from the staging tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc drivers/staging/erofs/data.c
>> index 9f04d7466c55,c64ec76643d4..000000000000
>> --- a/drivers/staging/erofs/data.c
>> +++ b/drivers/staging/erofs/data.c
>> @@@ -17,11 -17,18 +17,17 @@@
>>   
>>   static inline void read_endio(struct bio *bio)
>>   {
>> + 	struct super_block *const sb = bio->bi_private;
>>  -	int i;
>>   	struct bio_vec *bvec;
>> - 	const blk_status_t err = bio->bi_status;
>> + 	blk_status_t err = bio->bi_status;
>>   	struct bvec_iter_all iter_all;
>>   
>> + 	if (time_to_inject(EROFS_SB(sb), FAULT_READ_IO)) {
>> + 		erofs_show_injection_info(FAULT_READ_IO);
>> + 		err = BLK_STS_IOERR;
>> + 	}
>> + 
>>  -	bio_for_each_segment_all(bvec, bio, i, iter_all) {
>>  +	bio_for_each_segment_all(bvec, bio, iter_all) {
>>   		struct page *page = bvec->bv_page;
>>   
>>   		/* page is already locked */
>> diff --cc drivers/staging/erofs/unzip_vle.c
>> index 59b9f37d5c00,a2e03c932102..000000000000
>> --- a/drivers/staging/erofs/unzip_vle.c
>> +++ b/drivers/staging/erofs/unzip_vle.c
>> @@@ -843,14 -844,13 +844,12 @@@ static void z_erofs_vle_unzip_kickoff(v
>>   
>>   static inline void z_erofs_vle_read_endio(struct bio *bio)
>>   {
>> - 	const blk_status_t err = bio->bi_status;
>> + 	struct erofs_sb_info *sbi = NULL;
>> + 	blk_status_t err = bio->bi_status;
>>  -	unsigned int i;
>>   	struct bio_vec *bvec;
>> - #ifdef EROFS_FS_HAS_MANAGED_CACHE
>> - 	struct address_space *mc = NULL;
>> - #endif
>>   	struct bvec_iter_all iter_all;
>>   
>>  -	bio_for_each_segment_all(bvec, bio, i, iter_all) {
>>  +	bio_for_each_segment_all(bvec, bio, iter_all) {
>>   		struct page *page = bvec->bv_page;
>>   		bool cachemngd = false;
>>   
> 
> This conflict is now between the block tree and Linus' tree.

It seems that the conflict has been resolved in linus' tree:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2b070cfe582b8e99fec6ada57d2e59e194aae202

Thanks,
Gao Xiang


> 
