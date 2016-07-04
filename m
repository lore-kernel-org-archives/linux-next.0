From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the kspp tree
Date: Mon, 4 Jul 2016 15:48:13 +1000
Message-ID: <20160704154813.71fe892c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Kees Cook <keescook@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ashok Raj <ashok.raj@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/x86/kvm/vmx.c

between commit:

  255303026193 ("x86: apply more __ro_after_init and const")

from the kspp tree and commit:

  c45dcc71b794 ("KVM: VMX: enable guest access to LMCE related MSRs")

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
index 9faec9dc5476,85e2f0a882ca..000000000000
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@@ -10905,7 -11123,17 +11127,17 @@@ out
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
