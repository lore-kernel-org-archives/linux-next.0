From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 net-next tree
Date: Mon, 6 May 2019 17:42:36 +0300
Message-ID: <20190506144236.GL9224@smile.fi.intel.com>
References: <20190506204303.0d0082d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190506204303.0d0082d7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vladimir Oltean <olteanv@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, May 06, 2019 at 08:43:03PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   lib/Makefile
> 
> between commit:
> 
>   554aae35007e ("lib: Add support for generic packing operations")
> 
> from the net-next tree and commit:
> 
>   1a1e7f563bd5 ("lib: Move mathematic helpers to separate folder")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Seems correct to me.
Thanks!

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc lib/Makefile
> index 83d7df2661ff,4eeb814eee2e..000000000000
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@@ -17,20 -17,9 +17,20 @@@ KCOV_INSTRUMENT_list_debug.o := 
>   KCOV_INSTRUMENT_debugobjects.o := n
>   KCOV_INSTRUMENT_dynamic_debug.o := n
>   
>  +# Early boot use of cmdline, don't instrument it
>  +ifdef CONFIG_AMD_MEM_ENCRYPT
>  +KASAN_SANITIZE_string.o := n
>  +
>  +ifdef CONFIG_FUNCTION_TRACER
>  +CFLAGS_REMOVE_string.o = -pg
>  +endif
>  +
>  +CFLAGS_string.o := $(call cc-option, -fno-stack-protector)
>  +endif
>  +
>   lib-y := ctype.o string.o vsprintf.o cmdline.o \
>   	 rbtree.o radix-tree.o timerqueue.o xarray.o \
> - 	 idr.o int_sqrt.o extable.o \
> + 	 idr.o extable.o \
>   	 sha1.o chacha.o irq_regs.o argv_split.o \
>   	 flex_proportions.o ratelimit.o show_mem.o \
>   	 is_single_threaded.o plist.o decompress.o kobject_uevent.o \
> @@@ -120,8 -110,6 +122,7 @@@ obj-$(CONFIG_DEBUG_LIST) += list_debug.
>   obj-$(CONFIG_DEBUG_OBJECTS) += debugobjects.o
>   
>   obj-$(CONFIG_BITREVERSE) += bitrev.o
>  +obj-$(CONFIG_PACKING)	+= packing.o
> - obj-$(CONFIG_RATIONAL)	+= rational.o
>   obj-$(CONFIG_CRC_CCITT)	+= crc-ccitt.o
>   obj-$(CONFIG_CRC16)	+= crc16.o
>   obj-$(CONFIG_CRC_T10DIF)+= crc-t10dif.o



-- 
With Best Regards,
Andy Shevchenko
