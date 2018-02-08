From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build failure after merge of the btrfs-kdave tree
Date: Fri, 9 Feb 2018 00:48:46 +0100
Message-ID: <20180208234846.GF3003@suse.cz>
References: <20180209104057.0e999c19@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180209104057.0e999c19@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Borisov <nborisov@suse.com>, Qu Wenruo <wqu@suse.com>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 09, 2018 at 10:40:57AM +1100, Stephen Rothwell wrote:
> Hi David,
> 
> [Seems I somehow failed to actually send the following message a couple
> of days ago, sorry.]
> 
> After merging the btrfs-kdave tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/btrfs/tree-checker.c:33:10: fatal error: hash.h: No such file or directory
>  #include "hash.h"
>           ^~~~~~~~
> 
> Caused by commit
> 
>   8bd2a9b19fd7 ("btrfs: Remove custom crc32c init code")
> 
> interacting with commit
> 
>   ad7b0368f33c ("btrfs: tree-checker: Add checker for dir item")
> 
> from Linus' tree.
> 
> It should have been fixed up in commit
> 
>   99ca8d38ea90 ("Merge branch 'ext/nikbor/libcrc32c' into for-next-next-v4.16-20180206")

Right, I had fixed it in my local branch but did not push the update,
sorry.  Current for-next, top commit 993b08a92e32 builds fine.
