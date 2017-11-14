From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2017-11-10-15-56 uploaded (lib/test_find_bit.c)
Date: Mon, 13 Nov 2017 16:26:18 -0800
Message-ID: <0ce3ee27-e1a9-cea0-4a57-4aea35bed5ac@infradead.org>
References: <5a063cc8.w9SFxvjWsZNJM4HP%akpm@linux-foundation.org>
 <2ce9cf55-2b54-b6cd-fa4d-3cd0a354b5f1@infradead.org>
 <20171113161741.5feaa74b30527f05b1684d10@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:53554 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751113AbdKNA0Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Nov 2017 19:26:24 -0500
In-Reply-To: <20171113161741.5feaa74b30527f05b1684d10@linux-foundation.org>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, broonie@kernel.org, Yury Norov <ynorov@caviumnetworks.com>

On 11/13/2017 04:17 PM, Andrew Morton wrote:
> On Fri, 10 Nov 2017 18:00:57 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 11/10/2017 03:56 PM, akpm@linux-foundation.org wrote:
>>> The mm-of-the-moment snapshot 2017-11-10-15-56 has been uploaded to
>>>
>>>    http://www.ozlabs.org/~akpm/mmotm/
>>>
>>> mmotm-readme.txt says
>>>
>>> README for mm-of-the-moment:
>>>
>>> http://www.ozlabs.org/~akpm/mmotm/
>>>
>>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>>> more than once a week.
>>
>> on i386:
>>
>> ../lib/test_find_bit.c:54:2: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t' [-Wformat=]
>> ../lib/test_find_bit.c:68:2: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t' [-Wformat=]
>> ../lib/test_find_bit.c:82:2: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t' [-Wformat=]
>> ../lib/test_find_bit.c:102:2: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'cycles_t' [-Wformat=]
> 
> typecasts, I guess?  We don't seem to have a %p thingy for cycles_t?

Or the patch that Arnd sent to you that uses %ull.


-- 
~Randy
