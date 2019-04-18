From: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Thu, 18 Apr 2019 07:01:04 -0700
Message-ID: <20190418140104.GA52314@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190417123125.3de22f73@canb.auug.org.au>
 <0879e11b-c84c-65b8-581f-bf7adcb5e231@huawei.com>
 <20190417140305.GB23731@jaegeuk-macbookpro.roam.corp.google.com>
 <b1fcb057-6d89-9846-766b-dd1b710f7654@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b1fcb057-6d89-9846-766b-dd1b710f7654@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chao Yu <yuchao0@huawei.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On 04/18, Chao Yu wrote:
> On 2019/4/17 22:03, Jaegeuk Kim wrote:
> > On 04/17, Chao Yu wrote:
> >> Hi Jaegeuk,
> >>
> >> On 2019/4/17 10:31, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> After merging the block tree, today's linux-next build (x86_64
> >>> allmodconfig) produced this warning:
> >>>
> >>> fs/f2fs/node.c: In function 'f2fs_remove_inode_page':
> >>> fs/f2fs/node.c:1193:47: warning: format '%zu' expects argument of type 'size_t', but argument 5 has type 'blkcnt_t' {aka 'long long unsigned int'} [-Wformat=]
> >>>     "Inconsistent i_blocks, ino:%lu, iblocks:%zu",
> >>>                                              ~~^
> >>>                                              %llu
> >>>     inode->i_ino, inode->i_blocks);
> >>>                   ~~~~~~~~~~~~~~~       
> >>
> >> Could you please help to fix that as below in your dev branch directly?
> >>
> >> "Inconsistent i_blocks, ino:%lu, iblocks:%llu",
> > 
> > We can just use "%lu"?
> 
> We'd better follow sample in Documentation/core-api/printk-formats.rst:
> 
> If <type> is dependent on a config option for its size (e.g., sector_t,
> blkcnt_t) or is architecture-dependent for its size (e.g., tcflag_t), use a
> format specifier of its largest possible type and explicitly cast to it.

Great, done. :)

Thanks,

> 
> Example::
> 
>         printk("test: sector number/total blocks: %llu/%llu\n",
>                 (unsigned long long)sector, (unsigned long long)blockcount);
> 
> Thanks,
> 
> > 
> >> inode->i_ino, (unsigned long long)inode->i_blocks)
> >>
> >>
> >> It looks that we need to fix below commits as well:
> >>
> >> f2fs: fix to avoid panic in dec_valid_block_count()
> >> f2fs: fix to avoid panic in dec_valid_node_count()
> >>
> >> Thanks,
> >>
> >>>
> >>> Introduced by commit
> >>>
> >>>   90ae238d9dac ("f2fs: fix to avoid panic in f2fs_remove_inode_page()")
> >>>
> >>> from the f2fs tree interacting with commit
> >>>
> >>>   72deb455b5ec ("block: remove CONFIG_LBDAF")
> >>>
> > .
> > 
