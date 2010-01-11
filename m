From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: kvm tree build failure
Date: Mon, 11 Jan 2010 19:21:05 +1100
Message-ID: <20100111192105.304382e4.sfr@canb.auug.org.au>
References: <20100111190749.0a74d445.Stephen@Rothwell.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752535Ab0AKIVL@vger.kernel.org>
In-Reply-To: <20100111190749.0a74d445.Stephen@Rothwell.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Graf <agraf@suse.de>
List-Id: linux-next.vger.kernel.org

Hi Avi,

On Mon, 11 Jan 2010 19:07:49 +1100 Stephen Rothwell <Stephen@Rothwell.id.au> wrote:
>
> Caused by commit 7f31fad9aad3bb9df95793d72e037bb4d587ee83 ("KVM: PPC: Use
> accessor functions for GPR access").  I couldn't easily revert that
> commit, so I applied the following fixup patch instead.

After which I got this:

arch/powerpc/kvm/built-in.o: In function `kvmppc_handler_0':
(.text+0x69ba): undefined reference to `VCPU_GPRS'
arch/powerpc/kvm/built-in.o: In function `kvmppc_handler_0':
(.text+0x69be): undefined reference to `VCPU_GPRS'
arch/powerpc/kvm/built-in.o: In function `kvmppc_handler_1':
(.text+0x69e6): undefined reference to `VCPU_GPRS'
arch/powerpc/kvm/built-in.o: In function `kvmppc_handler_1':
(.text+0x69ea): undefined reference to `VCPU_GPRS'
arch/powerpc/kvm/built-in.o: In function `kvmppc_handler_2':
(.text+0x6a12): undefined reference to `VCPU_GPRS'
arch/powerpc/kvm/built-in.o:(.text+0x6a16): more undefined references to `VCPU_GPRS' follow

Caused by commit f38ae173fffd673d4bc5cb4062d9dc27146cfb4a ("KVM: PPC: Use
PACA backed shadow vcpu").  I have applied the following fixup patch for
today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 Jan 2010 19:15:02 +1100
Subject: [PATCH] kvm: another PPC fixup (asm-offsets)

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/asm-offsets.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index be90ced..16dab65 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -437,11 +437,11 @@ int main(void)
 	DEFINE(VCPU_HIGHMEM_HANDLER, offsetof(struct kvm_vcpu, arch.highmem_handler));
 	DEFINE(VCPU_RMCALL, offsetof(struct kvm_vcpu, arch.rmcall));
 	DEFINE(VCPU_HFLAGS, offsetof(struct kvm_vcpu, arch.hflags));
-	DEFINE(VCPU_GPRS, offsetof(struct kvm_vcpu, arch.gpr));
 #else
 	DEFINE(VCPU_CR, offsetof(struct kvm_vcpu, arch.cr));
 	DEFINE(VCPU_XER, offsetof(struct kvm_vcpu, arch.xer));
 #endif /* CONFIG_PPC64 */
+	DEFINE(VCPU_GPRS, offsetof(struct kvm_vcpu, arch.gpr));
 #endif
 #ifdef CONFIG_44x
 	DEFINE(PGD_T_LOG2, PGD_T_LOG2);
-- 
1.6.5.7


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
