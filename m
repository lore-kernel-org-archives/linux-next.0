From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Dec 7 (x86, not SMP)
Date: Wed, 07 Dec 2011 18:45:47 -0800
Message-ID: <4EE024DB.1020409@xenotime.net>
References: <20111207171218.e11db78531e7f20659e2ca65@canb.auug.org.au> <4EDFBA25.1020102@xenotime.net> <20111207194252.GH1669@redhat.com> <4EDFCFF9.2080906@xenotime.net> <20111207210630.GI1669@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:44896 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755250Ab1LHBq0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2011 20:46:26 -0500
In-Reply-To: <20111207210630.GI1669@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Don Zickus <dzickus@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


> From: Don Zickus <dzickus@redhat.com>
> Date: Wed, 7 Dec 2011 16:03:40 -0500
> Subject: [PATCH] x86, NMI: NMI selftest depends on the local apic
> 
> The selftest doesn't work with out a local apic for now.
> 
> Reported-by: Randy Durlap <rdunlap@xenotime.net>
> Signed-off-by: Don Zickus <dzickus@redhat.com>

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
>  arch/x86/Kconfig.debug |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
> index 020a4f1..d6eea6d 100644
> --- a/arch/x86/Kconfig.debug
> +++ b/arch/x86/Kconfig.debug
> @@ -286,7 +286,7 @@ config DEBUG_STRICT_USER_COPY_CHECKS
>  
>  config DEBUG_NMI_SELFTEST
>  	bool "NMI Selftest"
> -	depends on DEBUG_KERNEL
> +	depends on DEBUG_KERNEL && X86_LOCAL_APIC
>  	---help---
>  	  Enabling this option turns on a quick NMI selftest to verify
>  	  that the NMI behaves correctly.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
