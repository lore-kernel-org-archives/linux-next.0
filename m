From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Signed-off-by missing for commit in the net-next
 tree
Date: Wed, 16 Jan 2019 14:13:57 -0800 (PST)
Message-ID: <20190116.141357.190931605071987791.davem@davemloft.net>
References: <20190117080619.5a632a41@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117080619.5a632a41@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ytht.net@gmail.com, stefanha@redhat.com
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 17 Jan 2019 08:06:19 +1100

> Hi all,
> 
> Commit
> 
>   a22d3251423f ("Fix ERROR:do not initialise statics to 0 in af_vsock.c")
> 
> is missing a Signed-off-by from its author.

I know, I caught it right after I pushed out, sorry :(

I really have to go back to working on that automation so this stops
happening.  My bad.
