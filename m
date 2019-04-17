From: Chao Yu <yuchao0@huawei.com>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Wed, 17 Apr 2019 18:05:32 +0800
Message-ID: <0879e11b-c84c-65b8-581f-bf7adcb5e231@huawei.com>
References: <20190417123125.3de22f73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417123125.3de22f73@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Jaegeuk,

On 2019/4/17 10:31, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> fs/f2fs/node.c: In function 'f2fs_remove_inode_page':
> fs/f2fs/node.c:1193:47: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'blkcnt_t' {aka 'long long unsigned int'} [-Wformat=]
>     "Inconsistent i_blocks, ino:%lu, iblocks:%zu",
>                                              ~~^
>                                              %llu
>     inode->i_ino, inode->i_blocks);
>                   ~~~~~~~~~~~~~~~       

Could you please help to fix that as below in your dev branch directly?

"Inconsistent i_blocks, ino:%lu, iblocks:%llu",
inode->i_ino, (unsigned long long)inode->i_blocks)


It looks that we need to fix below commits as well:

f2fs: fix to avoid panic in dec_valid_block_count()
f2fs: fix to avoid panic in dec_valid_node_count()

Thanks,

> 
> Introduced by commit
> 
>   90ae238d9dac ("f2fs: fix to avoid panic in f2fs_remove_inode_page()")
> 
> from the f2fs tree interacting with commit
> 
>   72deb455b5ec ("block: remove CONFIG_LBDAF")
> 
