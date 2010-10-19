From: Eric Paris <eparis@redhat.com>
Subject: Re: linux-next: build failure after merge of the security-testing
 tree
Date: Tue, 19 Oct 2010 00:09:06 -0400
Message-ID: <1287461346.2530.128.camel@localhost.localdomain>
References: <20101019145747.f828be03.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47407 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751081Ab0JSEKV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Oct 2010 00:10:21 -0400
In-Reply-To: <20101019145747.f828be03.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Moore <paul.moore@hp.com>, Patrick McHardy <kaber@trash.net>

On Tue, 2010-10-19 at 14:57 +1100, Stephen Rothwell wrote:
> Hi James,
> 
> After merging the security-testing tree, today's linux-next build (powerpc_ppc64_defconfig)
> failed like this:
> 
> net/netfilter/nf_conntrack_netlink.c: In function 'ctnetlink_conntrack_event':
> net/netfilter/nf_conntrack_netlink.c:585: error: 'struct nf_conn' has no member named 'secmark'
> 
> Caused by commit fd0194de4cf2e64514aec35f40de458fca766656 ("conntrack:
> export lsm context rather than internal secid via netlink").  This build
> has CONFIG_NF_CONNTRACK_SECMARK not set ...
> 
> If you change a dependency on a CONFIG option, it is always worth build
> testing with and without the option set.
> 
> I have used the security-testing tree from next-20101018 for today.

Ohhh, poop.  I didn't think I changed any config options but I see it
now.  Will fix by tomorrow.  Sorry and thanks for catching it.

-Eric
