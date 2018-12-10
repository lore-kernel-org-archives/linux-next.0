From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Sun, 09 Dec 2018 16:54:43 -0800 (PST)
Message-ID: <20181209.165443.617494663676711708.davem@davemloft.net>
References: <20181209232722.GA4425@bistromath.localdomain>
        <20181209.163152.1641648923109797638.davem@davemloft.net>
        <20181210114848.3f726482@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210114848.3f726482@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: sd@queasysnail.net, andrew@lunn.ch, hkallweit1@gmail.com, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 10 Dec 2018 11:48:48 +1100

> That is fine as a last resort, but it is probably less disruptive to
> find these things before you try to push i.e. as part of the "apply the
> patch" otherwise you could end up having to rebase a whole lot of later
> commits.

I meant to imply that we should do both, something I do pre-commit
and something that double checks again when I push.

Sorry if I wasn't clear.

> Anyway, here's my current version of my script.  It just takes a commit
> range (anything you can pass to "git log").  You may want to drop the
> gitk invocation at the end.

Thanks!
