From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: linux-next: manual merge of the pm tree with the omap tree
Date: Mon, 19 Oct 2015 08:16:03 +0100
Message-ID: <20151019081603.0c5fbba8@arm.com>
References: <20151019115908.7f4d59d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47981 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751618AbbJSHQN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Oct 2015 03:16:13 -0400
In-Reply-To: <20151019115908.7f4d59d2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Tony Lindgren <tony@atomide.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>

On Mon, 19 Oct 2015 11:59:08 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

Hi Stephen,

> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in:
> 
>   arch/arm/mach-omap2/timer.c
> 
> between commits:
> 
>   3afbb9afe2c4 ("arm: omap2: timer: move realtime_counter_init() around")
>   9c46ffcd5214 ("arm: omap2: timer: always call clocksource_of_init() when DT")
> 
> from the omap tree and commit:
> 
>   3722ed2380ad ("clocksource: cosmetic: Drop OF 'dependency' from symbols")
> 
> from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 

[...]

Looks great, thanks!

	M.
-- 
Jazz is not dead. It just smells funny.
