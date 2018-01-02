From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: linux-next: build warning after merge of the netfilter-next tree
Date: Tue, 2 Jan 2018 16:30:01 +0100
Message-ID: <20180102153001.34ot5wwfwbgdkumy@salvia>
References: <20180102121451.3f8f792d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.us.es ([193.147.175.20]:44292 "EHLO mail.us.es"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751640AbeABPaH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jan 2018 10:30:07 -0500
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
        by mail.us.es (Postfix) with ESMTP id 0DAFA26E26
        for <linux-next@vger.kernel.org>; Tue,  2 Jan 2018 16:30:06 +0100 (CET)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
        by antivirus1-rhel7.int (Postfix) with ESMTP id F3BE5DA3AB
        for <linux-next@vger.kernel.org>; Tue,  2 Jan 2018 16:30:05 +0100 (CET)
Content-Disposition: inline
In-Reply-To: <20180102121451.3f8f792d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: NetFilter <netfilter-devel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen,

On Tue, Jan 02, 2018 at 12:14:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the netfilter-next tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> In file included from net/ipv6/af_inet6.c:45:0:
> include/linux/netfilter_ipv6.h:38:51: warning: 'struct nf_queue_entry' declared inside parameter list
>   int (*reroute)(struct sk_buff *skb, const struct nf_queue_entry *entry);
>                                                    ^

Arnd sent a fix for this, thanks for reporting!

https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git/commit/
