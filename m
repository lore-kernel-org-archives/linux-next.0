From: Omar Sandoval <osandov@osandov.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 btrfs-kdave tree
Date: Fri, 5 Oct 2018 11:29:22 -0700
Message-ID: <20181005182922.GJ25437@vader>
References: <20181005154721.4bfde639@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181005154721.4bfde639@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Sterba <dsterba@suse.cz>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Omar Sandoval <osandov@fb.com>, Huang Ying <ying.huang@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 05, 2018 at 03:47:21PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   include/linux/swap.h
> 
> between commit:
> 
>   0f83d16b8f1f ("mm: split SWP_FILE into SWP_ACTIVATED and SWP_FS")
> 
> from the btrfs-kdave tree and commit:
> 
>   26833300651e ("mm, swap: fix race between swapoff and some swap operations")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell

Thanks, Stephen, that looks good.

This reminds that Dave suggested that we chould route the two mm patches
in my series through Andrew's mm tree for 4.20 and get the Btrfs bits in
for 4.21. Would that make things harder for linux-next? If not, I can
resend "mm: split SWP_FILE into SWP_ACTIVATED and SWP_FS" and "mm:
export add_swap_extent()" rebased on mmotm.
