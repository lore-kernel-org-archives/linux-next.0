From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] KVM: PPC: drop duplicate tracepoint
Date: Tue, 05 Aug 2014 14:27:57 +0200
Message-ID: <53E0CDCD.8010504@redhat.com>
References: <1407234956-743-1-git-send-email-pbonzini@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1407234956-743-1-git-send-email-pbonzini@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: agraf@suse.de, kvm@vger.kernel.org, linux-next@vger.kernel.org, kvm-ppc@vger.kernel.org, sfr@canb.auug.org.au
List-Id: linux-next.vger.kernel.org

Il 05/08/2014 12:35, Paolo Bonzini ha scritto:
> diff --git a/arch/powerpc/kvm/emulate.c b/arch/powerpc/kvm/emulate.c
> index e96b50d0bdab..2325168ad1ff 100644
> --- a/arch/powerpc/kvm/emulate.c
> +++ b/arch/powerpc/kvm/emulate.c
> @@ -300,3 +300,5 @@ int kvmppc_emulate_instruction(struct kvm_run *run, struct kvm_vcpu *vcpu)
>  	return emulated;
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_emulate_instruction);
> +
> +EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_ppc_instr);

Nope, this is in kvm-pr.ko so it is not enough... replaced with

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 288b4bb05cbd..4c79284b58be 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1347,3 +1347,5 @@ void kvm_arch_exit(void)
 {

 }
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_ppc_instr);


Paolo
