From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the selinux tree with the net-next
 tree
Date: Wed, 07 Mar 2018 15:26:16 -0500 (EST)
Message-ID: <20180307.152616.19450694775691873.davem@davemloft.net>
References: <CAHC9VhTUORhy1dADEza8tr4DW6gTjqxXyg0wb0cwFCRy+WRkMQ@mail.gmail.com>
        <20180307.124500.1863183408172828694.davem@davemloft.net>
        <CAHC9VhRQb50EYD6BVTxNv2x=S_tTLq57OZBsWbXFdfJEunNUiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhRQb50EYD6BVTxNv2x=S_tTLq57OZBsWbXFdfJEunNUiA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paul@paul-moore.com
Cc: lucien.xin@gmail.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, richard_c_haines@btinternet.com
List-Id: linux-next.vger.kernel.org

From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 Mar 2018 15:20:33 -0500

>> So you would only have to wait until my tree went in before
>> sending your pull request.
> 
> So you would want me to rebase selinux/next on top of Linus' tree in
> the middle of the merge window?  I'm sure that isn't what you meant,
> but that's how I keep reading the above ... which can't be right,
> because in my experience that's one way to piss off Linus.  Help me
> understand what you are saying.

I never said you rebase anything.  I wonder where you get that from.

I'm saying, you just defer your pull request until Linus takes my
networking tree in.

No changes or rebasing of your tree is necessary whatsoever.  You just
ask him to pull your tree as-is.

Again, this is what other smaller subsystem trees do when they have a
situation like this.
