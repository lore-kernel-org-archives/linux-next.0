From: Simon Horman <horms@verge.net.au>
Subject: Re: linux-next: build warning after merge of the ipvs-next tree
Date: Tue, 19 Apr 2016 13:44:16 +1000
Message-ID: <20160419034412.GA8968@verge.net.au>
References: <20160415105748.5b8754fc@canb.auug.org.au>
 <20160415095607.GC1561@salvia>
 <20160415123811.GA16196@verge.net.au>
 <20160418090921.GB2807@salvia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38464 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750720AbcDSEDm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Apr 2016 00:03:42 -0400
Content-Disposition: inline
In-Reply-To: <20160418090921.GB2807@salvia>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 18, 2016 at 11:09:21AM +0200, Pablo Neira Ayuso wrote:
> On Fri, Apr 15, 2016 at 10:38:14PM +1000, Simon Horman wrote:
> > On Fri, Apr 15, 2016 at 11:56:07AM +0200, Pablo Neira Ayuso wrote:
> > > On Fri, Apr 15, 2016 at 10:57:48AM +1000, Stephen Rothwell wrote:
> > > > Hi Simon,
> > > > 
> > > > After merging the ipvs-next tree, today's linux-next build (powerpc
> > > > ppc64_defconfig) produced this warning:
> > > > 
> > > > net/netfilter/nf_conntrack_netlink.c:529:15: warning: 'ctnetlink_proto_size' defined but not used [-Wunused-function]
> > > >  static size_t ctnetlink_proto_size(const struct nf_conn *ct)
> > > >                ^
> > > > net/netfilter/nf_conntrack_netlink.c:546:15: warning: 'ctnetlink_acct_size' defined but not used [-Wunused-function]
> > > >  static size_t ctnetlink_acct_size(const struct nf_conn *ct)
> > > >                ^
> > > > net/netfilter/nf_conntrack_netlink.c:556:12: warning: 'ctnetlink_secctx_size' defined but not used [-Wunused-function]
> > > >  static int ctnetlink_secctx_size(const struct nf_conn *ct)
> > > >             ^
> > > > net/netfilter/nf_conntrack_netlink.c:572:15: warning: 'ctnetlink_timestamp_size' defined but not used [-Wunused-function]
> > > >  static size_t ctnetlink_timestamp_size(const struct nf_conn *ct)
> > > >                ^
> > > > Introduced by commit
> > > > 
> > > >   4054ff45454a ("netfilter: ctnetlink: remove unnecessary inlining")
> > > > 
> > > > This build does not set CONFIG_NF_CONNTRACK_EVENTS or
> > > > CONFIG_NETFILTER_NETLINK_GLUE_CT.
> > > 
> > > This is my fault, will fix this asap. Thanks for reporting.
> > 
> > Pablo,
> > 
> > can you let me know when it is fixed in nf-next so I can rebase ipvs-next
> > accordingly?
> 
> No need to rebase, will push an incremental fix for this.

Thanks, understood.
