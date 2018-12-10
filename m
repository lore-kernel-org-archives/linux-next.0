From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the net-next tree
Date: Mon, 10 Dec 2018 11:21:17 -0800
Message-ID: <20181210192117.GY4170@linux.ibm.com>
References: <20181207154707.35322397@canb.auug.org.au>
Reply-To: paulmck@linux.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181207154707.35322397@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nikolay Aleksandrov <nikolay@cumulusnetworks.com>, mingo@kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, Dec 07, 2018 at 03:47:07PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got conflicts in:
> 
>   net/bridge/br_mdb.c
>   net/bridge/br_multicast.c
> 
> between commits:
> 
>   19e3a9c90c53 ("net: bridge: convert multicast to generic rhashtable")
>   4329596cb10d ("net: bridge: multicast: use non-bh rcu flavor")
> 
> from the net-next tree and commit:
> 
>   1a56f7d53b5c ("net/bridge: Replace call_rcu_bh() and rcu_barrier_bh()")
> 
> from the rcu tree.
> 
> I fixed it up (I used the versions form net-next) and can carry the fix
> as necessary. This is now fixed as far as linux-next is concerned, but
> any non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This one is already in -tip, so there is no time like the present to
notify my upstream maintainer, who I have added on CC.

Ingo, I agree with Stephen's analysis, so please feel free to revert
1a56f7d53b5c ("net/bridge: Replace call_rcu_bh() and rcu_barrier_bh()").
Or let me know if some other approach would be preferable.

I really did get an Acked-by, but perhaps my long development cycles for
RCU-related patches resulted in this being lost or forgotten.  Been
there myself...  ;-)

							Thanx, Paul
