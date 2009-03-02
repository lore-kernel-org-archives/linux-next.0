From: Sheng Yang <sheng@linux.intel.com>
Subject: Re: linux-next: kvm tree build warnings
Date: Mon, 2 Mar 2009 16:00:52 +0800
Message-ID: <200903021600.52820.sheng@linux.intel.com>
References: <20090302174915.91ccbe7f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.21]:11716 "EHLO
	orsmga101.jf.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752777AbZCBIBB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2009 03:01:01 -0500
In-Reply-To: <20090302174915.91ccbe7f.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>

On Monday 02 March 2009 14:49:15 Stephen Rothwell wrote:
> Hi Avi,

Hi Stephen

Thanks for the notice! It's my fault...

I would post a patch to fix it. And Avi is offline this week, Marcelo is in 
charge of maintenance now. 

-- 
regards
Yang, Sheng

>
> Today's linux-next build (powerpc ppc44x_config) produced these warnings:
>
> In file included from arch/powerpc/kernel/asm-offsets.c:52:
> include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside
> parameter list include/linux/kvm_host.h:368: warning: its scope is only
> this definition or declaration, which is probably not what you want In file
> included from arch/powerpc/kvm/booke.c:24:
> include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside
> parameter list include/linux/kvm_host.h:368: warning: its scope is only
> this definition or declaration, which is probably not what you want In file
> included from arch/powerpc/kvm/booke_emulate.c:21:
> include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside
> parameter list include/linux/kvm_host.h:368: warning: its scope is only
> this definition or declaration, which is probably not what you want In file
> included from arch/powerpc/kvm/44x.c:21:
> include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside
> parameter list include/linux/kvm_host.h:368: warning: its scope is only
> this definition or declaration, which is probably not what you want In file
> included from arch/powerpc/kvm/44x_tlb.c:24:
> include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside
> parameter list include/linux/kvm_host.h:368: warning: its scope is only
> this definition or declaration, which is probably not what you want In file
> included from arch/powerpc/include/asm/kvm_ppc.h:31,
>                  from arch/powerpc/kvm/44x_emulate.c:21:
> include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside
> parameter list include/linux/kvm_host.h:368: warning: its scope is only
> this definition or declaration, which is probably not what you want In file
> included from arch/powerpc/kvm/../../../virt/kvm/coalesced_mmio.c:13:
> include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside
> parameter list include/linux/kvm_host.h:368: warning: its scope is only
> this definition or declaration, which is probably not what you want In file
> included from arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:21:
> include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside
> parameter list include/linux/kvm_host.h:368: warning: its scope is only
> this definition or declaration, which is probably not what you want In file
> included from arch/powerpc/kvm/emulate.c:25:
> include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside
> parameter list include/linux/kvm_host.h:368: warning: its scope is only
> this definition or declaration, which is probably not what you want In file
> included from arch/powerpc/kvm/powerpc.c:24:
> include/linux/kvm_host.h:368: warning: 'struct kvm_ioapic' declared inside
> parameter list include/linux/kvm_host.h:368: warning: its scope is only
> this definition or declaration, which is probably not what you want
>
> Probably caused by commit 71c8a3f871fab4b54f7cace7d4626e67dfb51b2d ("KVM:
> Unify the delivery of IOAPIC and MSI interrupts").
