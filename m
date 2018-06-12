From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with Linus' tree
Date: Mon, 11 Jun 2018 18:01:21 -0700
Message-ID: <20180612010121.GZ3593@linux.vnet.ibm.com>
References: <20180612104607.69f6f15b@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180612104607.69f6f15b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Joerg Roedel <jroedel@suse.de>
List-Id: linux-next.vger.kernel.org

On Tue, Jun 12, 2018 at 10:46:07AM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   drivers/iommu/amd_iommu.c
> 
> between commit:
> 
>   94c793accacd ("iommu/amd: Hide unused iommu_table_lock")
> 
> from Linus' tree and commit:
> 
>   1df9bb146146 ("EXP iommu: Placeholder for fix in mainline")
> 
> from the rcu tree.
> 
> I fixed it up (they share some code change) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

I expect to be dropping my commit as soon as I rebase to v4.18-rc1.
In the meantime, please accept my apologies for the noise!

							Thanx, Paul
