From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH linux-next] KVM: x86: don't forget vcpu_put() in
 kvm_arch_vcpu_ioctl_set_sregs()
Date: Thu, 21 Dec 2017 01:30:30 +0100
Message-ID: <5e98adf7-809f-3b98-e8fc-6ba89e2777cf@redhat.com>
References: <001a1148cc3acf967c0560c7b760@google.com>
 <20171221002427.82325-1-ebiggers3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171221002427.82325-1-ebiggers3@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Biggers <ebiggers3@gmail.com>, kvm@vger.kernel.org
Cc: rkrcmar@redhat.com, tianyu.lan@intel.com, christoffer.dall@linaro.org, x86@kernel.org, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, Eric Biggers <ebiggers@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 21/12/2017 01:24, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Due to a bad merge resolution between commit f29810335965 ("KVM/x86:
> Check input paging mode when cs.l is set") and commit b4ef9d4e8cb8
> ("KVM: Move vcpu_load to arch-specific kvm_arch_vcpu_ioctl_set_sregs"),
> there is a case in kvm_arch_vcpu_ioctl_set_sregs() where vcpu_put() is
> not called after vcpu_get().  Fix it.
> 
> Reported-by: syzbot <syzkaller@googlegroups.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/x86/kvm/x86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ea3a98196753..f4e8b5089b28 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -7624,7 +7624,7 @@ int kvm_arch_vcpu_ioctl_set_sregs(struct kvm_vcpu *vcpu,
>  		goto out;
>  
>  	if (kvm_valid_sregs(vcpu, sregs))
> -		return -EINVAL;
> +		goto out;
>  
>  	apic_base_msr.data = sregs->apic_base;
>  	apic_base_msr.host_initiated = true;
> 

Thanks very much Eric, that was fast!  Adding Stephen and the linux-next
mailing list to Cc.  Adding the kvm/master tree has already paid off.

Paolo
