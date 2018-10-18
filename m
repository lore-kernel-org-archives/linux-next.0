From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kselftest tree with the kvm tree
Date: Thu, 18 Oct 2018 14:05:45 +0200
Message-ID: <798279ee-4aa7-978c-0402-fe4b803e599a@redhat.com>
References: <20181018155030.1d75c506@canb.auug.org.au>
 <2e7090d2-5c80-7fcf-6e50-7155280b998a@redhat.com>
 <20181018115009.GA6819@andrea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018115009.GA6819@andrea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuah@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 18/10/2018 13:50, Andrea Parri wrote:
>> Shuah, I think it's best if in the future the
>> tools/testing/selftests/kvm/ changes go through my tree, unless they
>> affect many selftests subdirectories.
> 
> Would the patch below make sense ?
> 
> (It wasn't the case of my patch, but you never know... ;D)
> 
> Output of get_maintainer.pl on tools/testing/selftests/kvm/:
> 
> Before:
> 
> Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK,commit_signer:5/23=22%)
> Paolo Bonzini <pbonzini@redhat.com> (commit_signer:20/23=87%,authored:10/23=43%)
> Peter Xu <peterx@redhat.com> (commit_signer:4/23=17%,authored:4/23=17%)
> Anders Roxell <anders.roxell@linaro.org> (commit_signer:3/23=13%,authored:3/23=13%)
> Ken Hofsass <hofsass@google.com> (commit_signer:2/23=9%)
> linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
> linux-kernel@vger.kernel.org (open list)
> 
> After:
> 
> Paolo Bonzini <pbonzini@redhat.com> (supporter:KERNEL VIRTUAL MACHINE (KVM))
> "Radim Krčmář" <rkrcmar@redhat.com> (supporter:KERNEL VIRTUAL MACHINE (KVM))
> Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
> kvm@vger.kernel.org (open list:KERNEL VIRTUAL MACHINE (KVM))
> linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
> linux-kernel@vger.kernel.org (open list)
> 
> Cheers,
>   Andrea
> 
> ---
> commit 59fc1af0d7d0ae0c1ec9400bfbacaadce11e5f50
> Author: Andrea Parri <andrea.parri@amarulasolutions.com>
> Date:   Thu Oct 18 13:11:09 2018 +0200
> 
>     MAINTAINERS: Add selftests to the KVM entry
>     
>     Should ensure that Joe random dev will Cc: the KVM maintainers.
>     
>     Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
>     Cc: Paolo Bonzini <pbonzini@redhat.com>
>     Cc: "Radim Krčmář" <rkrcmar@redhat.com>
>     Cc: Shuah Khan <shuah@kernel.org>
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6ac000cc006d1..25755bf6365ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7997,6 +7997,7 @@ F:	include/linux/kvm*
>  F:	include/kvm/iodev.h
>  F:	virt/kvm/*
>  F:	tools/kvm/
> +F:	tools/testing/selftests/kvm/
>  
>  KERNEL VIRTUAL MACHINE FOR AMD-V (KVM/amd)
>  M:	Joerg Roedel <joro@8bytes.org>
> ---
> 
>>
>> Thanks,
>>
>> Paolo
>>
> 
> 
> 

Yes, I've applied it.

Paolo
