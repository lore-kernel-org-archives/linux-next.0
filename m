From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the selinux tree with the net-next
 tree
Date: Wed, 07 Mar 2018 12:45:00 -0500 (EST)
Message-ID: <20180307.124500.1863183408172828694.davem@davemloft.net>
References: <CAHC9VhST6LhUj6H28Ws96EaRzkp4FN91h46iGKpd2Yk44H7Jpw@mail.gmail.com>
        <20180307.114139.680250568317481879.davem@davemloft.net>
        <CAHC9VhTUORhy1dADEza8tr4DW6gTjqxXyg0wb0cwFCRy+WRkMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhTUORhy1dADEza8tr4DW6gTjqxXyg0wb0cwFCRy+WRkMQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paul@paul-moore.com
Cc: lucien.xin@gmail.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, richard_c_haines@btinternet.com
List-Id: linux-next.vger.kernel.org

From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 Mar 2018 12:27:52 -0500

> I'm not sure we could have cleanly separated the core network stack
> changes from the rest of the SELinux/SCTP enablement, regardless it's
> a bit late at this point.  The only other thought would have been to
> simply push Xin Long's cleanup patches until after the next merge
> window, but that would only be worth considering if they truly were
> just cleanup patches, and even then it doesn't seem very fair to Xin
> Long to have to wait.

I think you wanted to have more integration, rather than less.

What others have done in the past, is they simply pull my networking
tree into their's.

I never rebase, ever.

My tree often goes in reasonable early in the merge window.

So you would only have to wait until my tree went in before
sending your pull request.

That's really the way to handle something like this.
