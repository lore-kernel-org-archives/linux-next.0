From: Russell King <rmk@armlinux.org.uk>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
Date: Wed, 1 Jun 2016 09:52:58 +0100
Message-ID: <20160601085258.GP27249@flint.armlinux.org.uk>
References: <20160601100746.7a731254@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160601100746.7a731254@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Yao <mark.yao@rock-chips.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 01, 2016 at 10:07:46AM +1000, Stephen Rothwell wrote:
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

That wasn't intentional - I guess the "component" branch got included
in for-next when I rebuilt that branch.

The conflict has been around for a while (it's a conflict between code
merged during the merge window, and my changes) and it will get cleaned
up when I rebase my development onto -rc1.

Thanks anyway.

-- 
Russell King
ARM architecture Linux Kernel maintainer
