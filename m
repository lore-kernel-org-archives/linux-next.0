From: Alex Thorlton <athorlton@sgi.com>
Subject: Re: [PATCH] kernel/panic.c: reduce 1 byte usage for print tainted
 buffer.
Date: Mon, 7 Oct 2013 11:35:29 -0500
Message-ID: <20131007163529.GB2860@sgi.com>
References: <5250354F.4020506@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:40805 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1756701Ab3JGQfb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Oct 2013 12:35:31 -0400
Content-Disposition: inline
In-Reply-To: <5250354F.4020506@asianux.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chen Gang <gang.chen@asianux.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Rusty Russell <rusty@rustcorp.com.au>, Robin Holt <holt@sgi.com>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org

On Sat, Oct 05, 2013 at 11:50:39PM +0800, Chen Gang wrote:
> sizeof("Tainted: ") already counts '\0', and after first sprintf(), 's'
> will start from the current string end (its' value is '\0').
> 
> So need not add additional 1 byte for maximized usage of 'buf' in
> print_tainted().
>

Looks fine to me; nothing too crazy going on here.  By the way, Robin
isn't with us here at SGI any more.  He's at Cray, now, but I don't know
his e-mail there :/
 
> 
> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> ---
>  kernel/panic.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/kernel/panic.c b/kernel/panic.c
> index b6c482c..c00b4ce 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -233,7 +233,7 @@ static const struct tnt tnts[] = {
>   */
>  const char *print_tainted(void)
>  {
> -	static char buf[ARRAY_SIZE(tnts) + sizeof("Tainted: ") + 1];
> +	static char buf[ARRAY_SIZE(tnts) + sizeof("Tainted: ")];
>  
>  	if (tainted_mask) {
>  		char *s;
> -- 
> 1.7.7.6
