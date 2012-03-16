From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] watchdog: fix compiler error for missing parenthesis
Date: Thu, 15 Mar 2012 23:35:20 -0700
Message-ID: <1331879720.5406.27.camel@joe2Laptop>
References: <4F62DD49.1040909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from perches-mx.perches.com ([206.117.179.246]:58048 "EHLO
	labridge.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755882Ab2CPGfX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Mar 2012 02:35:23 -0400
In-Reply-To: <4F62DD49.1040909@samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaehoon Chung <jh80.chung@samsung.com>, Wim Van Sebroeck <wim@iguana.be>
Cc: linux-next@vger.kernel.org, sfr@canb.auug.org.au, Kyungmin Park <kyungmin.park@samsung.com>

On Fri, 2012-03-16 at 15:27 +0900, Jaehoon Chung wrote:
> Joe's patch(watchdog: Use pr_<fmt> and pr_<level>) is missed the parenthesis in s3c2410_wdt.c.
> (based-on latest linux-next repository)
> It's fixed with this patch.
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
[]
>  static int __init watchdog_init(void)
>  {
> -	pr_info("S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics\n";
> +	pr_info("S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics\n");

Thanks.
