From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH v7] RO/NX protection for loadable kernel modules
Date: Tue, 6 Oct 2009 20:47:09 +1030
Message-ID: <200910062047.10901.rusty@rustcorp.com.au>
References: <817ecb6f0910050450o29ee65a1j49c27cf350b77493@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <817ecb6f0910050450o29ee65a1j49c27cf350b77493@mail.gmail.com>
Content-Disposition: inline
Sender: linux-security-module-owner@vger.kernel.org
To: Siarhei Liakh <sliakh.lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, 5 Oct 2009 10:20:42 pm Siarhei Liakh wrote:
> This patch is a logical extension of the protection provided by
> CONFIG_DEBUG_RODATA to LKMs. The protection is provided by splitting
> module_core and module_init into three logical parts each and setting
> appropriate page access permissions for each individual section:

Thanks, applied!

It will be in linux-next soon, and if all goes well, 2.6.33.

Cheers,
Rusty.
