From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] kernel/panic.c: reduce 1 byte usage for print tainted
 buffer.
Date: Tue, 08 Oct 2013 09:45:56 +0800
Message-ID: <525363D4.3090706@asianux.com>
References: <5250354F.4020506@asianux.com> <20131007172745.4f023e312df95bd94f078ca8@linux-foundation.org> <52535B8D.5000200@asianux.com> <20131007182518.e64c8596851bfb6b44279129@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:13674 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751707Ab3JHBq5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Oct 2013 21:46:57 -0400
In-Reply-To: <20131007182518.e64c8596851bfb6b44279129@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Rusty Russell <rusty@rustcorp.com.au>, Robin Holt <holt@sgi.com>, athorlton@sgi.com, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org

On 10/08/2013 09:25 AM, Andrew Morton wrote:
> On Tue, 08 Oct 2013 09:10:37 +0800 Chen Gang <gang.chen@asianux.com> wrote:
> 
>>> - Requires that the two literal "Tainted: " strings be kept in sync.
>>>
>>
>> Hmm... if more than 2, we should use a macro instead of, else (within
>> 2), especially they are near by, we can still let it hard coded, I feel
>> that will more straightful for readers and writers.
>>
>>
>>> - Assumes that strlen("Not tainted") <= strlen("Tainted") +
>>>   ARRAY_SIZE(tnts).  Which is true, but might not be if someone makes
>>>   changes...
>>>
>>
>> Hmm... it use snprintf() instead of sprintf(), although I feel better
>> using scnprintf() instead of.
>>
>> This string can be trucated, and scnprintf() is more suitable for this
>> kind of string. And snprintf() is for the string which can not be
>> truncated (will return the ideal length to notify the caller).
> 
> It's hardly a huge issue, but I'd do something along the lines of
> 
> --- a/kernel/panic.c~a
> +++ a/kernel/panic.c
> @@ -233,13 +233,16 @@ static const struct tnt tnts[] = {
>   */
>  const char *print_tainted(void)
>  {
> -	static char buf[ARRAY_SIZE(tnts) + sizeof("Tainted: ")];
> +	static const char tainted[] = "Tainted: ";
> +	static const char not_tainted[] = "Not tainted: ";
> +	static char buf[ARRAY_SIZE(tnts) +
> +			max(sizeof(tainted), sizeof(not_tainted))];
>  
>  	if (tainted_mask) {
>  		char *s;
>  		int i;
>  
> -		s = buf + sprintf(buf, "Tainted: ");
> +		s = buf + sprintf(buf, tainted);
>  		for (i = 0; i < ARRAY_SIZE(tnts); i++) {
>  			const struct tnt *t = &tnts[i];
>  			*s++ = test_bit(t->bit, &tainted_mask) ?
> @@ -247,7 +250,7 @@ const char *print_tainted(void)
>  		}
>  		*s = 0;
>  	} else
> -		snprintf(buf, sizeof(buf), "Not tainted");
> +		snprintf(buf, sizeof(buf), not_tainted);
>  
>  	return buf;
>  }
> 

Theoretically, your implementation is better than the original one.


> Except that doesn't compile because of our fancy max().
> 
> Maybe we have a compile-time-evaluable max which does plain old
> ((a < b) ?  b : a), not sure...  I don't think it's worth bothering
> about - leave it be.
> 
> 
> 

Excuse me, I am not quite understand your meaning :-(

Hmm... at least, if max() will be OK, I support your fixing.

 - in my memory, the old C compiler may not recognize "? :" in array.
   maybe it is not old version ansi C standard requirements? (at least,
   it is rarely used in history).

 - I guess: "max()" may be just the reason why original author don't
   implement it like you have done (maybe at that time, the C compiler
   did not support it).



Thanks.
-- 
Chen Gang
