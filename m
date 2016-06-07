From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Jun 6 (mm/slub.c)
Date: Wed, 8 Jun 2016 09:31:57 +1000
Message-ID: <20160608093157.51225c43@canb.auug.org.au>
References: <20160606142058.44b82e38@canb.auug.org.au>
	<57565789.9050508@infradead.org>
	<20160607131242.fac39cbade676df24d70edaa@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20160607131242.fac39cbade676df24d70edaa@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux MM <linux-mm@kvack.org>, Thomas Garnier <thgarnie@google.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Tue, 7 Jun 2016 13:12:42 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 6 Jun 2016 22:11:37 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> 
> > On 06/05/16 21:20, Stephen Rothwell wrote:  
> > > Hi all,
> > > 
> > > Changes since 20160603:
> > >   
> > 
> > on i386:
> > 
> > mm/built-in.o: In function `init_cache_random_seq':
> > slub.c:(.text+0x76921): undefined reference to `cache_random_seq_create'
> > mm/built-in.o: In function `__kmem_cache_release':
> > (.text+0x80525): undefined reference to `cache_random_seq_destroy'  
> 
> Yup.  This, I guess...
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm-slub-freelist-randomization-fix

Applied to linux-next today.

-- 
Cheers,
Stephen Rothwell

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
