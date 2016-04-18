From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: linux-next: build warning after merge of the ipvs-next tree
Date: Mon, 18 Apr 2016 11:09:21 +0200
Message-ID: <20160418090921.GB2807@salvia>
References: <20160415105748.5b8754fc@canb.auug.org.au>
 <20160415095607.GC1561@salvia>
 <20160415123811.GA16196@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.us.es ([193.147.175.20]:60750 "EHLO mail.us.es"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751355AbcDRJJ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Apr 2016 05:09:28 -0400
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
	by mail.us.es (Postfix) with ESMTP id 00F57EAA6D
	for <linux-next@vger.kernel.org>; Mon, 18 Apr 2016 11:09:25 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id E24DC179E4E
	for <linux-next@vger.kernel.org>; Mon, 18 Apr 2016 11:09:24 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id B071B1B3037
	for <linux-next@vger.kernel.org>; Mon, 18 Apr 2016 11:09:22 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <20160415123811.GA16196@verge.net.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Simon Horman <horms@verge.net.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 15, 2016 at 10:38:14PM +1000, Simon Horman wrote:
> On Fri, Apr 15, 2016 at 11:56:07AM +0200, Pablo Neira Ayuso wrote:
> > On Fri, Apr 15, 2016 at 10:57:48AM +1000, Stephen Rothwell wrote:
> > > Hi Simon,
> > > 
> > > After merging the ipvs-next tree, today's linux-next build (powerpc
> > > ppc64_defconfig) produced this warning:
> > > 
> > > net/netfilter/nf_conntrack_netlink.c:529:15: warning: 'ctnetlink_proto_size' defined but not used [-Wunused-function]
> > >  static size_t ctnetlink_proto_size(const struct nf_conn *ct)
> > >                ^
> > > net/netfilter/nf_conntrack_netlink.c:546:15: warning: 'ctnetlink_acct_size' defined but not used [-Wunused-function]
> > >  static size_t ctnetlink_acct_size(const struct nf_conn *ct)
> > >                ^
> > > net/netfilter/nf_conntrack_netlink.c:556:12: warning: 'ctnetlink_secctx_size' defined but not used [-Wunused-function]
> > >  static int ctnetlink_secctx_size(const struct nf_conn *ct)
> > >             ^
> > > net/netfilter/nf_conntrack_netlink.c:572:15: warning: 'ctnetlink_timestamp_size' defined but not used [-Wunused-function]
> > >  static size_t ctnetlink_timestamp_size(const struct nf_conn *ct)
> > >                ^
> > > Introduced by commit
> > > 
> > >   4054ff45454a ("netfilter: ctnetlink: remove unnecessary inlining")
> > > 
> > > This build does not set CONFIG_NF_CONNTRACK_EVENTS or
> > > CONFIG_NETFILTER_NETLINK_GLUE_CT.
> > 
> > This is my fault, will fix this asap. Thanks for reporting.
> 
> Pablo,
> 
> can you let me know when it is fixed in nf-next so I can rebase ipvs-next
> accordingly?

No need to rebase, will push an incremental fix for this.
