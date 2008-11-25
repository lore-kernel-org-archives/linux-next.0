From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 08:28:01 +0100
Message-ID: <20081125072801.GA15592@elte.hu>
References: <20081125140719.03a8cdfb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:40696 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751170AbYKYH2h (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 02:28:37 -0500
Content-Disposition: inline
In-Reply-To: <20081125140719.03a8cdfb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> net/wireless/reg.c:348:29: error: macro "if" passed 2 arguments, but takes just 1
> net/wireless/reg.c: In function 'ignore_request':
> net/wireless/reg.c:349: error: expected '(' before 'return'
> 
> This is clearly a bug in in the above file and should be fixed there, so
> I have applied the following patch for today.  I expect some patch to fix
> this to appear in the wireless-current or net-current tree very soon.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> diff --git a/net/wireless/reg.c b/net/wireless/reg.c
> index 626dbb6..648c765 100644
> --- a/net/wireless/reg.c
> +++ b/net/wireless/reg.c
> @@ -343,9 +343,7 @@ static int ignore_request(struct wiphy *wiphy, enum reg_set_by set_by,
>  				return 0;
>  			return -EALREADY;
>  		}
> -		if (WARN_ON(!is_alpha2_set(alpha2) || !is_an_alpha2(alpha2)),
> -				"Invalid Country IE regulatory hint passed "
> -				"to the wireless core\n")
> +		if (WARN_ON(!is_alpha2_set(alpha2) || !is_an_alpha2(alpha2)))

this fix is wrong - the intention of that line was to add a proper 
WARN(), not a WARN_ON(). Your change loses the message that WARN() 
prints.

i posted a tested fix for this two days ago:

  http://marc.info/?l=linux-kernel&m=122745649425646&w=2

see it also below.

	Ingo

--------------->
>From de734ba59d249ee785a1ead600e5a6ea1dd62639 Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 23 Nov 2008 20:09:54 +0100
Subject: [PATCH] net/wireless/reg.c: fix

fix:

  net/wireless/reg.c:348:29: error: macro "if" passed 2 arguments, but takes just 1

triggered by the branch-tracer.

Signed-off-by: Ingo Molnar <mingo@elte.hu>
 # Please enter the commit message for your changes. Lines starting
---
 net/wireless/reg.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 626dbb6..eb3b1a9 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -343,9 +343,9 @@ static int ignore_request(struct wiphy *wiphy, enum reg_set_by set_by,
 				return 0;
 			return -EALREADY;
 		}
-		if (WARN_ON(!is_alpha2_set(alpha2) || !is_an_alpha2(alpha2)),
+		if (WARN(!is_alpha2_set(alpha2) || !is_an_alpha2(alpha2),
 				"Invalid Country IE regulatory hint passed "
-				"to the wireless core\n")
+				"to the wireless core\n"))
 			return -EINVAL;
 		/* We ignore Country IE hints for now, as we haven't yet
 		 * added the dot11MultiDomainCapabilityEnabled flag
