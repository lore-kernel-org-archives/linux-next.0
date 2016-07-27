From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 27 Jul 2016 14:50:51 +1000
Message-ID: <20160727145051.5affd33c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Feiner <pfeiner@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Haozhong Zhang <haozhong.zhang@intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/vmx.c

between commit:

  4e59516a12a6 ("kvm: vmx: ensure VMCS is current while enabling PML")

from Linus' tree and commit:

  37e4c997dadf ("KVM: VMX: validate individual bits of guest MSR_IA32_FEATURE_CONTROL")

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/kvm/vmx.c
index df4a3b818048,b61cdadf8623..000000000000
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@@ -8954,6 -9086,20 +9105,8 @@@ static struct kvm_vcpu *vmx_create_vcpu
  	vmx->nested.current_vmptr = -1ull;
  	vmx->nested.current_vmcs12 = NULL;
  
 -	/*
 -	 * If PML is turned on, failure on enabling PML just results in failure
 -	 * of creating the vcpu, therefore we can simplify PML logic (by
 -	 * avoiding dealing with cases, such as enabling PML partially on vcpus
 -	 * for the guest, etc.
 -	 */
 -	if (enable_pml) {
 -		err = vmx_create_pml_buffer(vmx);
 -		if (err)
 -			goto free_vmcs;
 -	}
 -
+ 	vmx->msr_ia32_feature_control_valid_bits = FEATURE_CONTROL_LOCKED;
+ 
  	return &vmx->vcpu;
  
  free_vmcs:
@@@ -10913,7 -11149,17 +11161,17 @@@ out
  	return ret;
  }
  
+ static void vmx_setup_mce(struct kvm_vcpu *vcpu)
+ {
+ 	if (vcpu->arch.mcg_cap & MCG_LMCE_P)
+ 		to_vmx(vcpu)->msr_ia32_feature_control_valid_bits |=
+ 			FEATURE_CONTROL_LMCE;
+ 	else
+ 		to_vmx(vcpu)->msr_ia32_feature_control_valid_bits &=
+ 			~FEATURE_CONTROL_LMCE;
+ }
+ 
 -static struct kvm_x86_ops vmx_x86_ops = {
 +static struct kvm_x86_ops vmx_x86_ops __ro_after_init = {
  	.cpu_has_kvm_support = cpu_has_kvm_support,
  	.disabled_by_bios = vmx_disabled_by_bios,
  	.hardware_setup = hardware_setup,
