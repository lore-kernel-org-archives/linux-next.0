From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: Tree for Nov 15 (target_core_mod)
Date: Tue, 19 Nov 2013 15:12:38 -0800
Message-ID: <1384902758.4307.25.camel@haakon3.risingtidesystems.com>
References: <20131115162455.b45631434f6417b221f2a4d5@canb.auug.org.au>
	 <52865CB7.3070608@infradead.org>
	 <1384804015.4307.11.camel@haakon3.risingtidesystems.com>
	 <528BA90D.5070009@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <528BA90D.5070009@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, target-devel <target-devel@vger.kernel.org>, kmo@daterainc.com, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2013-11-19 at 10:08 -0800, Randy Dunlap wrote:
> On 11/18/13 11:46, Nicholas A. Bellinger wrote:

<SNIP>

> 
> That does fix the build errors.  Thanks.
> 
> Here is a more complete patch with a patch description and S-O-B.
> I would have put your S-O-B in it but you didn't include one.
> Feel free to add yours now.
> 
> ---
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Drop percpu_ida.o from lib-y since it is also listed in obj-y
> and it doesn't need to be listed in both places.
> 
> Move percpu-refcount.o from lib-y to obj-y to fix build errors
> in target_core_mod:
> 
> ERROR: "percpu_ref_cancel_init" [drivers/target/target_core_mod.ko] undefined!
> ERROR: "percpu_ref_kill_and_confirm" [drivers/target/target_core_mod.ko] undefined!
> ERROR: "percpu_ref_init" [drivers/target/target_core_mod.ko] undefined!
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Hi Randy,

Applied.

Thanks!

--nab

> ---
>  lib/Makefile |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20131115.orig/lib/Makefile
> +++ linux-next-20131115/lib/Makefile
> @@ -13,7 +13,7 @@ lib-y := ctype.o string.o vsprintf.o cmd
>  	 sha1.o md5.o irq_regs.o reciprocal_div.o argv_split.o \
>  	 proportions.o flex_proportions.o prio_heap.o ratelimit.o show_mem.o \
>  	 is_single_threaded.o plist.o decompress.o kobject_uevent.o \
> -	 earlycpio.o percpu-refcount.o percpu_ida.o
> +	 earlycpio.o
>  
>  obj-$(CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS) += usercopy.o
>  lib-$(CONFIG_MMU) += ioremap.o
> @@ -26,7 +26,7 @@ obj-y += bcd.o div64.o sort.o parser.o h
>  	 bust_spinlocks.o hexdump.o kasprintf.o bitmap.o scatterlist.o \
>  	 gcd.o lcm.o list_sort.o uuid.o flex_array.o iovec.o clz_ctz.o \
>  	 bsearch.o find_last_bit.o find_next_bit.o llist.o memweight.o kfifo.o \
> -	 percpu_ida.o
> +	 percpu-refcount.o percpu_ida.o
>  obj-y += string_helpers.o
>  obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
>  obj-y += kstrtox.o
> --
> To unsubscribe from this list: send the line "unsubscribe target-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
