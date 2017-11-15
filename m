From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the netfilter-next
 tree
Date: Thu, 16 Nov 2017 09:46:17 +1100
Message-ID: <20171116094617.029257cb@canb.auug.org.au>
References: <20171107110248.7f1924a7@canb.auug.org.au>
        <20171108190052.63dfd8ce@canb.auug.org.au>
        <20171108234014.GA1788@salvia>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20171108234014.GA1788@salvia>
Sender: netfilter-devel-owner@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, NetFilter <netfilter-devel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>
List-Id: linux-next.vger.kernel.org

Hi Pablo,

On Thu, 9 Nov 2017 00:40:14 +0100 Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Wed, Nov 08, 2017 at 07:00:52PM +1100, Stephen Rothwell wrote:
> > 
> > On Tue, 7 Nov 2017 11:02:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > >
> > > After merging the netfilter-next tree, today's linux-next build (powerpc
> > > ppc64_defconfig) produced this warning:
> > > 
> > > net/netfilter/nf_conntrack_netlink.c:536:15: warning: 'ctnetlink_proto_size' defined but not used [-Wunused-function]
> > >  static size_t ctnetlink_proto_size(const struct nf_conn *ct)
> > >                ^
> > > 
> > > Introduced by commit
> > > 
> > >   5caaed151a68 ("netfilter: conntrack: don't cache nlattr_tuple_size result in nla_size")  
> > 
> > I assume that this warning will now be in the net-next tree ...  
> 
> It's my fault, I'll fix this in my next batch, sorry for the inconvenience.

This has now made it into Linus' tree :-(

-- 
Cheers,
Stephen Rothwell
