From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] kernel/panic.c: reduce 1 byte usage for print tainted
 buffer.
Date: Tue, 08 Oct 2013 09:10:37 +0800
Message-ID: <52535B8D.5000200@asianux.com>
References: <5250354F.4020506@asianux.com> <20131007172745.4f023e312df95bd94f078ca8@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:45650 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751431Ab3JHBLj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Oct 2013 21:11:39 -0400
In-Reply-To: <20131007172745.4f023e312df95bd94f078ca8@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Rusty Russell <rusty@rustcorp.com.au>, Robin Holt <holt@sgi.com>, athorlton@sgi.com, Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org

On 10/08/2013 08:27 AM, Andrew Morton wrote:
> On Sat, 05 Oct 2013 23:50:39 +0800 Chen Gang <gang.chen@asianux.com> wrote:
> 
>> sizeof("Tainted: ") already counts '\0', and after first sprintf(), 's'
>> will start from the current string end (its' value is '\0').
>>
>> So need not add additional 1 byte for maximized usage of 'buf' in
>> print_tainted().
>>
>>
>> Signed-off-by: Chen Gang <gang.chen@asianux.com>
>> ---
>>  kernel/panic.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/kernel/panic.c b/kernel/panic.c
>> index b6c482c..c00b4ce 100644
>> --- a/kernel/panic.c
>> +++ b/kernel/panic.c
>> @@ -233,7 +233,7 @@ static const struct tnt tnts[] = {
>>   */
>>  const char *print_tainted(void)
>>  {
>> -	static char buf[ARRAY_SIZE(tnts) + sizeof("Tainted: ") + 1];
>> +	static char buf[ARRAY_SIZE(tnts) + sizeof("Tainted: ")];
>>  
>>  	if (tainted_mask) {
>>  		char *s;
> 
> hm, that code is a bit crufty.
> 
> - Why is `buf' static?  It could be on-stack.
> 

Just like Al Viro's reply ('buf' will be returned to caller).


> - Requires that the two literal "Tainted: " strings be kept in sync.
> 

Hmm... if more than 2, we should use a macro instead of, else (within
2), especially they are near by, we can still let it hard coded, I feel
that will more straightful for readers and writers.


> - Assumes that strlen("Not tainted") <= strlen("Tainted") +
>   ARRAY_SIZE(tnts).  Which is true, but might not be if someone makes
>   changes...
> 

Hmm... it use snprintf() instead of sprintf(), although I feel better
using scnprintf() instead of.

This string can be trucated, and scnprintf() is more suitable for this
kind of string. And snprintf() is for the string which can not be
truncated (will return the ideal length to notify the caller).

> 
> 
> 

Thanks.
-- 
Chen Gang
