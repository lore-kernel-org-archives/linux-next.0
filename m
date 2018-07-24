From: AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: Re: linux-next: build warning after merge of the arm64 tree
Date: Tue, 24 Jul 2018 09:26:31 +0900
Message-ID: <20180724002630.GV11258@linaro.org>
References: <20180724090545.2270d975@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180724090545.2270d975@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 24, 2018 at 09:05:45AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the arm64 tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:

Where can I find this specific branch?

> drivers/acpi/Kconfig:6:error: recursive dependency detected!
> drivers/acpi/Kconfig:6:	symbol ACPI depends on EFI

My patch created an additional dependency like:
  menu ACPI
    ...
    depends on IA64 || X86 || (ARM64 && EFI)

> arch/x86/Kconfig:1920:	symbol EFI depends on ACPI

So I don't understand why this change makes a warning on x86_64 build.
Is this a real recursive dependency?

Thanks,
-Takahiro AKASHI

> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> 
> Introduced by commit
> 
>   5bcd44083a08 ("drivers: acpi: add dependency of EFI for arm64")
> 
> -- 
> Cheers,
> Stephen Rothwell
