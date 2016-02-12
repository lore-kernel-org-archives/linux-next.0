From: Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-next: Tree for Feb 12
Date: Fri, 12 Feb 2016 19:57:20 +0530
Message-ID: <20160212142719.GA31729@sudip-pc>
References: <20160212162035.1e0260cd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160212162035.1e0260cd-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Fri, Feb 12, 2016 at 04:20:35PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160211:

arm lpc18xx_defconfig build fails with the error:
./arch/arm/kernel/vmlinux.lds:702: undefined symbol `SECTION_SHIFT'
referenced in expression

bisect leads to:
64ac2e74f0b2 ("ARM: 8502/1: mm: mark section-aligned portion of rodata NX")

reverting that patch fixed the build.

build log at:
https://travis-ci.org/sudipm-mukherjee/parport/jobs/108716281

regards
sudip
