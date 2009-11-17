From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the sysctl tree with Linus' tree
Date: Tue, 17 Nov 2009 00:21:43 -0800
Message-ID: <m1ws1ph888.fsf@fess.ebiederm.org>
References: <20091117190406.108f967d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:47487 "EHLO
	out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753824AbZKQIVm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2009 03:21:42 -0500
In-Reply-To: <20091117190406.108f967d.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Tue\, 17 Nov 2009 19\:04\:06 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> Today's linux-next merge of the sysctl tree got a conflict in
> net/decnet/sysctl_net_decnet.c between commit
> 887e671f324d9898aaedb29a6ece6c853c394067 ("decnet: netdevice refcount
> leak") from Linus' tree and commit
> f8572d8f2a2ba75408b97dc24ef47c83671795d7 ("sysctl net: Remove unused
> binary sysctl code") from the sysctl tree.
>
> The latter removed the code (function dn_def_dev_strategy()) modified by
> the former, so I just used the latter.  I can carry this fix for a while,
> but it can be fixed by merging v2.6.32-rc7 (or just the
> above commit from Linus' tree - which would merge a much smaller number of
> commits) into the sysctl tree. 

Nice.  I had not realized that bug fix had made it into v2.6.32-rc7.
I will look at merging that to remove the conflict.

I looked at cherry-picking the commit earlier when I saw it in the netdev
tree and my experiment failed.  So I think the only resolution that works
in this case is merging it so the whole history is there.

Eric
