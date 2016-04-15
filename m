From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: linux-next: build warning after merge of the ipvs-next tree
Date: Fri, 15 Apr 2016 11:56:07 +0200
Message-ID: <20160415095607.GC1561@salvia>
References: <20160415105748.5b8754fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.us.es ([193.147.175.20]:51500 "EHLO mail.us.es"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750802AbcDOJ4O (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Apr 2016 05:56:14 -0400
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
	by mail.us.es (Postfix) with ESMTP id 26CFBE83AD
	for <linux-next@vger.kernel.org>; Fri, 15 Apr 2016 11:56:11 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id 176F79D0FC
	for <linux-next@vger.kernel.org>; Fri, 15 Apr 2016 11:56:11 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id 06BDF9D0F6
	for <linux-next@vger.kernel.org>; Fri, 15 Apr 2016 11:56:09 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <20160415105748.5b8754fc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simon Horman <horms@verge.net.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 15, 2016 at 10:57:48AM +1000, Stephen Rothwell wrote:
> Hi Simon,
> 
> After merging the ipvs-next tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> net/netfilter/nf_conntrack_netlink.c:529:15: warning: 'ctnetlink_proto_size' defined but not used [-Wunused-function]
>  static size_t ctnetlink_proto_size(const struct nf_conn *ct)
>                ^
> net/netfilter/nf_conntrack_netlink.c:546:15: warning: 'ctnetlink_acct_size' defined but not used [-Wunused-function]
>  static size_t ctnetlink_acct_size(const struct nf_conn *ct)
>                ^
> net/netfilter/nf_conntrack_netlink.c:556:12: warning: 'ctnetlink_secctx_size' defined but not used [-Wunused-function]
>  static int ctnetlink_secctx_size(const struct nf_conn *ct)
>             ^
> net/netfilter/nf_conntrack_netlink.c:572:15: warning: 'ctnetlink_timestamp_size' defined but not used [-Wunused-function]
>  static size_t ctnetlink_timestamp_size(const struct nf_conn *ct)
>                ^
> Introduced by commit
> 
>   4054ff45454a ("netfilter: ctnetlink: remove unnecessary inlining")
> 
> This build does not set CONFIG_NF_CONNTRACK_EVENTS or
> CONFIG_NETFILTER_NETLINK_GLUE_CT.

This is my fault, will fix this asap. Thanks for reporting.
