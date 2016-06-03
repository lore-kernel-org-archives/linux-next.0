From: Bart Van Assche <bart.vanassche@sandisk.com>
Subject: Re: Re: linux-next memleak after IO on dax mountpoint
Date: Fri, 3 Jun 2016 09:48:27 -0700
Message-ID: <f1595b85-8fdc-fc8a-4ac5-e379837d61d9@sandisk.com>
References: <20160527084617.GD2933@dhcp12-144.nay.redhat.com>
 <20160528040554.GA23685@dhcp12-144.nay.redhat.com>
 <CAHse=S-H_yMhZKNmMZpb41M+o+2tMRyxiUG9wQoemewBXXYTPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bn1on0096.outbound.protection.outlook.com ([157.56.110.96]:15456
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932150AbcFCQsk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Jun 2016 12:48:40 -0400
In-Reply-To: <CAHse=S-H_yMhZKNmMZpb41M+o+2tMRyxiUG9wQoemewBXXYTPw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Drysdale <drysdale@google.com>, Xiong Zhou <xzhou@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, axboe@fb.com, linux-next@vger.kernel.org, linux-nvdimm@ml01.01.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

On 06/02/2016 08:22 AM, David Drysdale wrote:
> FWIW, I'm also seeing kmemleak report a leak with v4.7-rc1, in
> a different scenario (just normal desktop use).  Not done much
> digging so far, but this commit (9082e87bf) looks like it might be
> relevant -- lots of the following:
>
> unreferenced object 0xffff8800c288e900 (size 256):
>   comm "dconf-service", pid 1461, jiffies 4294895636 (age 48.028s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 c0 a4 c0 c6 00 88 ff ff  ................
>     02 20 00 20 00 00 00 00 11 00 00 00 00 00 00 00  . . ............
>   backtrace:
>     [<ffffffff81955228>] kmemleak_alloc+0x28/0x50
>     [<ffffffff81268bdc>] kmem_cache_alloc+0xfc/0x360
>     [<ffffffff81203275>] mempool_alloc_slab+0x15/0x20
>     [<ffffffff812030de>] mempool_alloc+0x6e/0x170
>     [<ffffffff815014e8>] bio_alloc_bioset+0xb8/0x230
>     [<ffffffff81514174>] next_bio+0x24/0x50
>     [<ffffffff815145ef>] blkdev_issue_zeroout+0xdf/0x1d0
>     [<ffffffff8132ce79>] ext4_issue_zeroout+0x39/0x50
>     [<ffffffff81357abf>] ext4_ext_zeroout+0x2f/0x40
>     [<ffffffff8135ece0>] ext4_ext_map_blocks+0x1870/0x2190
>     [<ffffffff8132cfa1>] ext4_map_blocks+0x111/0x620
>     [<ffffffff81330dc8>] ext4_writepages+0x7c8/0x10a0
>     [<ffffffff81211851>] do_writepages+0x21/0x30
>     [<ffffffff812012ba>] __filemap_fdatawrite_range+0xaa/0xf0
>     [<ffffffff812013fd>] filemap_write_and_wait_range+0x2d/0x70
>     [<ffffffff81326f6d>] ext4_sync_file+0x18d/0x500

(+Christoph)

With kernel v4.7-rc1 and XFS I see that the blkdev_issue_zeroout() calls 
triggered by xfstests make kmemleak complain. I hadn't seen this with 
any previous kernel version.

Bart.
