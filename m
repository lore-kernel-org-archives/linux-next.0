From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] kernel/panic.c: reduce 1 byte usage for print tainted
 buffer.
Date: Mon, 7 Oct 2013 17:27:45 -0700
Message-ID: <20131007172745.4f023e312df95bd94f078ca8@linux-foundation.org>
References: <5250354F.4020506@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:35393 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751854Ab3JHA1q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Oct 2013 20:27:46 -0400
In-Reply-To: <5250354F.4020506@asianux.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chen Gang <gang.chen@asianux.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Rusty Russell <rusty@rustcorp.com.au>, Robin Holt <holt@sgi.com>, athorlton@sgi.com, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org

On Sat, 05 Oct 2013 23:50:39 +0800 Chen Gang <gang.chen@asianux.com> wrote:

> sizeof("Tainted: ") already counts '\0', and after first sprintf(), 's'
> will start from the current string end (its' value is '\0').
> 
> So need not add additional 1 byte for maximized usage of 'buf' in
> print_tainted().
> 
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

hm, that code is a bit crufty.

- Why is `buf' static?  It could be on-stack.

- Requires that the two literal "Tainted: " strings be kept in sync.

- Assumes that strlen("Not tainted") <= strlen("Tainted") +
  ARRAY_SIZE(tnts).  Which is true, but might not be if someone makes
  changes...
