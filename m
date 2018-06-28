From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: build failure after merge of the btrfs-kdave tree
Date: Thu, 28 Jun 2018 18:11:03 +0200
Message-ID: <20180628161102.GJ2287@suse.cz>
References: <20180627085936.4f9cc4f2@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180627085936.4f9cc4f2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Borisov <nborisov@suse.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 27, 2018 at 08:59:36AM +1000, Stephen Rothwell wrote:
> After merging the btrfs-kdave tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/btrfs/print-tree.c: In function 'print_extent_item':
> fs/btrfs/print-tree.c:56:3: error: implicit declaration of function 'btrfs_print_v0_err'; did you mean 'btrfs_print_tree'? [-Werror=implicit-function-declaration]
>    btrfs_print_v0_err(eb->fs_info);
>    ^~~~~~~~~~~~~~~~~~
>    btrfs_print_tree

Should be fixed in today's branch.
