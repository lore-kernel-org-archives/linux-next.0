From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the selinux tree with the net-next tree
Date: Wed, 7 Mar 2018 18:28:43 -0500
Message-ID: <CAHC9VhRNpw4cZeZJpsce8s2z+DVSMK2NK0Dzu9xHq=TwTiaQ+g@mail.gmail.com>
References: <CAHC9VhTUORhy1dADEza8tr4DW6gTjqxXyg0wb0cwFCRy+WRkMQ@mail.gmail.com>
 <20180307.124500.1863183408172828694.davem@davemloft.net> <CAHC9VhRQb50EYD6BVTxNv2x=S_tTLq57OZBsWbXFdfJEunNUiA@mail.gmail.com>
 <20180307.152616.19450694775691873.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180307.152616.19450694775691873.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: lucien.xin@gmail.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, richard_c_haines@btinternet.com
List-Id: linux-next.vger.kernel.org

On Wed, Mar 7, 2018 at 3:26 PM, David Miller <davem@davemloft.net> wrote:
> From: Paul Moore <paul@paul-moore.com>
> Date: Wed, 7 Mar 2018 15:20:33 -0500
>
>>> So you would only have to wait until my tree went in before
>>> sending your pull request.
>>
>> So you would want me to rebase selinux/next on top of Linus' tree in
>> the middle of the merge window?  I'm sure that isn't what you meant,
>> but that's how I keep reading the above ... which can't be right,
>> because in my experience that's one way to piss off Linus.  Help me
>> understand what you are saying.
>
> I never said you rebase anything.  I wonder where you get that from.

As I said, I was just trying to figure out what you were suggesting.
Your email was not very clear in my opinion.

> I'm saying, you just defer your pull request until Linus takes my
> networking tree in.
>
> No changes or rebasing of your tree is necessary whatsoever.  You just
> ask him to pull your tree as-is.
>
> Again, this is what other smaller subsystem trees do when they have a
> situation like this.

Which gets us back to what I originally suggested in my first email of
this thread: linux-next carries the fixup patch and when we send the
pull requests to Linus we mention this fixup/thread.

For what it's worth, if you mention the potential merge conflict, and
the fixup that Stephen provided, it shouldn't matter when the pull
requests are sent to Linus; he's a smart guy, he'll merge things in
the order he wants.  I've seen more than a few people get burned by
deferring pull requests, I don't intend to have SELinux, or audit for
that matter, run into the same problem.

-- 
paul moore
www.paul-moore.com
