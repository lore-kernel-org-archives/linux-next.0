From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with Linus' tree
Date: Mon, 18 Jun 2018 07:48:18 -0700
Message-ID: <20180618144818.GT3593@linux.vnet.ibm.com>
References: <20180612104607.69f6f15b@canb.auug.org.au>
 <20180618134849.70831fe2@canb.auug.org.au>
 <20180618134947.477f662e@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180618134947.477f662e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Joerg Roedel <jroedel@suse.de>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 18, 2018 at 01:49:47PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Mon, 18 Jun 2018 13:48:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > I am still getting this.
> 
> Maybe this was a bit premature :-)

Actually, this whole mess was due to me forgetting to do the merge-window
reset of rcu/next to the tree actually submitted to mainline.  :-/

Please accept my apologies for the resulting hassles!

							Thanx, Paul
