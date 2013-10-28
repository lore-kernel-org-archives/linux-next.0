From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (device-mapper tree related)
Date: Mon, 28 Oct 2013 10:57:29 -0400
Message-ID: <20131028145728.GA24780@redhat.com>
References: <20131029013339.e13fe6dda17949fd32bb88b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131029013339.e13fe6dda17949fd32bb88b3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heinz Mauelshagen <heinzm@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 28 2013 at 10:33am -0400,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/md/dm-cache-policy-hints.c: In function 'alloc_hash':
> drivers/md/dm-cache-policy-hints.c:94:2: error: implicit declaration of function 'vzalloc' [-Werror=implicit-function-declaration]
>   hash->table = vzalloc(sizeof(*hash->table) * hash->nr_buckets);
>   ^
> drivers/md/dm-cache-policy-hints.c:94:14: warning: assignment makes pointer from integer without a cast [enabled by default]
>   hash->table = vzalloc(sizeof(*hash->table) * hash->nr_buckets);
>               ^
> drivers/md/dm-cache-policy-hints.c: In function 'free_hash':
> drivers/md/dm-cache-policy-hints.c:101:2: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
>   vfree(hash->table);
>   ^
> drivers/md/dm-cache-policy-hints.c: In function 'alloc_bitset':
> drivers/md/dm-cache-policy-hints.c:184:2: warning: return makes pointer from integer without a cast [enabled by default]
>   return vzalloc(sizeof(unsigned long) * bit_set_nr_words(nr_cblocks));
>   ^
> 
> Caused by commit ce567d11e819 ("dm cache: add hints policy") from the
> device-mapper tree.
> 
> I have just left this broken for today.

I just pushed an update to linux-dm.git's 'for-next' branch which adds
3 missing #includes to drivers/md/dm-cache-policy-hints.c

Thanks,
Mike
