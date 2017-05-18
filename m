From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
Date: Thu, 18 May 2017 14:50:00 +0200
Message-ID: <20170518125000.GO4065@suse.cz>
References: <20170518094146.7a1d9a2d@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170518094146.7a1d9a2d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liu Bo <bo.li.liu@oracle.com>
List-Id: linux-next.vger.kernel.org

On Thu, May 18, 2017 at 09:41:46AM +1000, Stephen Rothwell wrote:
> Hi David,
> 
> After merging the btrfs-kdave tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/btrfs/inode.c: In function 'btrfs_submit_direct':
> fs/btrfs/inode.c:8467:14: warning: 'bio' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   struct bio *bio;
>               ^
> 
> I can't tell if it is a false positive or not.

It seems to be a false positive. Patch updated and will be part of the
next for-next.
