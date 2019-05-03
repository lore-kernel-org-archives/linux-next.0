From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
Date: Fri, 3 May 2019 15:37:46 +0200
Message-ID: <20190503133746.GH20156@suse.cz>
References: <20190503102105.13578cc9@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190503102105.13578cc9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josef Bacik <josef@toxicpanda.com>
List-Id: linux-next.vger.kernel.org

On Fri, May 03, 2019 at 10:21:05AM +1000, Stephen Rothwell wrote:
> Hi David,
> 
> After merging the btrfs-kdave tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> fs/btrfs/props.c: In function 'inherit_props':
> fs/btrfs/props.c:389:4: warning: 'num_bytes' may be used uninitialized in this function [-Wmaybe-uninitialized]
>     btrfs_block_rsv_release(fs_info, trans->block_rsv,
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       num_bytes);
>       ~~~~~~~~~~
> 
> Probably introduced by commit
> 
>   b835a4a3faec ("btrfs: use the existing reserved items for our first prop for inheritance")
> 
> Looks like a false positive to me.

Agreed and gcc 8.3.1 does not report that. Kbuild bot reported that as
well and it uses 7.x.
