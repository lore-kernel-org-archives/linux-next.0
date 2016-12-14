From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
Date: Wed, 14 Dec 2016 16:19:04 +0100
Message-ID: <20161214151904.GE3620@suse.cz>
References: <20161128110230.2e2bda87@canb.auug.org.au>
 <20161207093819.1d4358b1@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55703 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753439AbcLNPTW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Dec 2016 10:19:22 -0500
Content-Disposition: inline
In-Reply-To: <20161207093819.1d4358b1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wang Xiaoguang <wangxg.fnst@cn.fujitsu.com>

On Wed, Dec 07, 2016 at 09:38:19AM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> On Mon, 28 Nov 2016 11:02:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the btrfs-kdave tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> > 
> > fs/btrfs/inode.c: In function 'run_delalloc_range':
> > fs/btrfs/inode.c:1219:9: warning: 'cur_end' may be used uninitialized in this function [-Wmaybe-uninitialized]
> >    start = cur_end + 1;
> >          ^
> > fs/btrfs/inode.c:1172:6: note: 'cur_end' was declared here
> >   u64 cur_end;
> >       ^
> > 
> > Introduced by commit
> > 
> >   cow_file_range_async ("btrfs: Introduce COMPRESS reserve type to fix false enospc for compression")
> > 
> > Presumably a false positive because ASSERT(0) panics?
> 
> Actually it does not if CONFIG_BTRFS_ASSERT is not set (which it isn't
> for the above build), so this is not a false positive.  I am still
> seeing this.

Sorry for late reply. I've updatd the for-next branch now, the patches
introducing the warning have been removed temporarily. Arnd Bergmann
sent a patch to fix the warning, I'll make sure to include it so the
warning does not reappear.
