From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the crypto tree
Date: Mon, 10 Dec 2018 11:29:30 -0800
Message-ID: <20181210192930.GZ4170@linux.ibm.com>
References: <20181210154744.3b35b1c7@canb.auug.org.au>
Reply-To: paulmck@linux.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210154744.3b35b1c7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paulo Flabiano Smorigo <pfsmorigo@linux.vnet.ibm.com>, mingo@kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Dec 10, 2018 at 03:47:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   c97e4df573f2 ("MAINTAINERS: change NX/VMX maintainers")
> 
> from the crypto tree and commit:
> 
>   1dfddcdb95c4 ("MAINTAINERS: Update from @linux.vnet.ibm.com to @linux.ibm.com")
> 
> from the rcu tree.
> 
> I fixed it up (I used the crypto tree version of teh changes) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Agreed, and again adding Ingo.

The author of the conflicting commit is on CC of my commit, FYI.

							Thanx, Paul
