From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the arm64 tree
Date: Tue, 24 Jul 2018 10:12:18 +0200
Message-ID: <CAK8P3a0bOYPtsCb8_etWtFCsnjB-xkMPFiy7iBubThi0b-LtVg@mail.gmail.com>
References: <20180724090545.2270d975@canb.auug.org.au> <20180724002630.GV11258@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724002630.GV11258@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: AKASHI Takahiro <takahiro.akashi@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 24, 2018 at 2:26 AM, AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:
> On Tue, Jul 24, 2018 at 09:05:45AM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the arm64 tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>
> Where can I find this specific branch?
>
>> drivers/acpi/Kconfig:6:error: recursive dependency detected!
>> drivers/acpi/Kconfig:6:       symbol ACPI depends on EFI
>
> My patch created an additional dependency like:
>   menu ACPI
>     ...
>     depends on IA64 || X86 || (ARM64 && EFI)
>
>> arch/x86/Kconfig:1920:        symbol EFI depends on ACPI
>
> So I don't understand why this change makes a warning on x86_64 build.
> Is this a real recursive dependency?

On x86, we have

config EFI
        bool "EFI runtime service support"
        depends on ACPI

Kconfig cannot know that CONFIG_ARM64 is never set on x86, while
X86 is always set. So to Kconfig it it appears like a recursive
dependency.

The best workaround I can see is to have an intermediate symbol
on ARM64 that is invisible to Kconfig on x86, like

config ARCH_SUPPORTS_ACPI
        def_bool EFI

and then have ACPI depend on that.

       Arnd
