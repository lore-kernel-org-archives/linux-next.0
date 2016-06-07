From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 6 (mm/slub.c)
Date: Tue, 7 Jun 2016 14:37:32 -0700
Message-ID: <57573E9C.1040604@infradead.org>
References: <20160606142058.44b82e38@canb.auug.org.au>
 <57565789.9050508@infradead.org>
 <20160607131242.fac39cbade676df24d70edaa@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:57020 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932155AbcFGVhi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2016 17:37:38 -0400
In-Reply-To: <20160607131242.fac39cbade676df24d70edaa@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux MM <linux-mm@kvack.org>, Thomas Garnier <thgarnie@google.com>

On 06/07/16 13:12, Andrew Morton wrote:
> On Mon, 6 Jun 2016 22:11:37 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 06/05/16 21:20, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20160603:
>>>
>>
>> on i386:
>>
>> mm/built-in.o: In function `init_cache_random_seq':
>> slub.c:(.text+0x76921): undefined reference to `cache_random_seq_create'
>> mm/built-in.o: In function `__kmem_cache_release':
>> (.text+0x80525): undefined reference to `cache_random_seq_destroy'
> 
> Yup.  This, I guess...
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm-slub-freelist-randomization-fix
> 
> freelist_randomize(), cache_random_seq_create() and
> cache_random_seq_destroy() should not be inside CONFIG_SLABINFO.
> 
> Cc: Christoph Lameter <cl@linux.com>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: Thomas Garnier <thgarnie@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---

Yes, thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
