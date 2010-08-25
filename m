From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: build failure after merge of the final tree (slab
 tree related)
Date: Wed, 25 Aug 2010 11:57:41 +0300
Message-ID: <4C74DB05.7000101@cs.helsinki.fi>
References: <20100824120714.8918f8de.sfr@canb.auug.org.au> <4C740450.3030000@cs.helsinki.fi> <alpine.DEB.2.00.1008241256280.4763@router.home> <4C741029.7090300@cs.helsinki.fi> <alpine.DEB.2.00.1008241352240.5388@router.home> <4C74D1D7.4080608@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:57923 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752747Ab0HYI5n (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Aug 2010 04:57:43 -0400
In-Reply-To: <4C74D1D7.4080608@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 8/25/10 11:18 AM, Tejun Heo wrote:
> Hello,
>
> On 08/24/2010 08:53 PM, Christoph Lameter wrote:
>>> [    0.000000] Kernel panic - not syncing: Cannot create slab kmem_cache
>>> size=232 realsize=256 order=0 offset=0 flags=42000
>>
>> alloc per cpu result in kmalloc which fails.
>>
>> Tejon: Is there some way we could get a reserved per cpu area under UP
>> instead of fallback to slab allocations during bootup?
>
> Eh... nasty.  Maybe we can create a alloc_percpu_early() function
> which doesn't allow freeing of allocate memory and just redirect to
> bootmem on UP?

Yeah, I was thinking about that too.

				Pekka
