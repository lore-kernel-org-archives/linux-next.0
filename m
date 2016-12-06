From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
Date: Wed, 7 Dec 2016 09:38:19 +1100
Message-ID: <20161207093819.1d4358b1@canb.auug.org.au>
References: <20161128110230.2e2bda87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56399 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751905AbcLFWiV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Dec 2016 17:38:21 -0500
In-Reply-To: <20161128110230.2e2bda87@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wang Xiaoguang <wangxg.fnst@cn.fujitsu.com>

Hi David,

On Mon, 28 Nov 2016 11:02:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the btrfs-kdave tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/btrfs/inode.c: In function 'run_delalloc_range':
> fs/btrfs/inode.c:1219:9: warning: 'cur_end' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    start = cur_end + 1;
>          ^
> fs/btrfs/inode.c:1172:6: note: 'cur_end' was declared here
>   u64 cur_end;
>       ^
> 
> Introduced by commit
> 
>   cow_file_range_async ("btrfs: Introduce COMPRESS reserve type to fix false enospc for compression")
> 
> Presumably a false positive because ASSERT(0) panics?

Actually it does not if CONFIG_BTRFS_ASSERT is not set (which it isn't
for the above build), so this is not a false positive.  I am still
seeing this.

-- 
Cheers,
Stephen Rothwell
