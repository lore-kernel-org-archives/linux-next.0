From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH v8] RO/NX protection for loadable kernel modules
Date: Mon, 1 Feb 2010 12:09:13 +1030
Message-ID: <201002011209.13540.rusty@rustcorp.com.au>
References: <817ecb6f1001311522q52bf4eebmb748c486dcd5ad35@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <817ecb6f1001311522q52bf4eebmb748c486dcd5ad35@mail.gmail.com>
Sender: linux-security-module-owner@vger.kernel.org
To: Siarhei Liakh <sliakh.lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, 1 Feb 2010 09:52:35 am Siarhei Liakh wrote:
> +/*
> + * Given BASE and SIZE this macro calculates the number of pages the
> + * memory regions occupies
> + */
> +#define NUMBER_OF_PAGES(BASE, SIZE) ((SIZE > 0) ?		\
> +		(PFN_DOWN((unsigned long)BASE + SIZE - 1) -	\
> +			 PFN_DOWN((unsigned long)BASE) + 1)	\
> +		: (0UL))

Needs more brackets around arguments, otherwise someone calling it with
a complex expression will get very upset.

Or just replace with a static inline function?

> +		if ((mod->module_core) && (mod->core_text_size > 0)) {

The core_text_size test should be enough here.

> +			begin_pfn = PFN_DOWN((unsigned long)mod->module_core);
> +			end_pfn = PFN_DOWN((unsigned long)mod->module_core +
> +						mod->core_text_size);
> +			if (end_pfn > begin_pfn)
> +				set_memory_rw(begin_pfn << PAGE_SHIFT,
> +							end_pfn - begin_pfn);

Much of this code might be neater if you created a helper:

	void set_page_attributes(void *start, void *end,
				 void (*set)(unsigned long start, unsigned long num_pages))
	{
		unsigned long begin_pfn = PFN_DOWN((unsigned long)start);
		unsigned long end_pfn = PFN_DOWN((unsigned long)end);
		if (end_pfn > begin_pfn)
			set(begin_pfn << PAGE_SHIFT, end_pfn - begin_pfn);
	}

But these are minor: patch looks good!

Thanks,
Rusty.
