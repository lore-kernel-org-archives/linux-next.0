From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the kvm tree
Date: Mon, 25 Jul 2016 14:46:38 +1000
Message-ID: <20160725144638.51452b34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45700 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750749AbcGYEqm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Jul 2016 00:46:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yunhong Jiang <yunhong.jiang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Haozhong Zhang <haozhong.zhang@intel.com>

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  arch/x86/kvm/vmx.c

between commits:

  64672c95ea4c ("kvm: vmx: hook preemption timer support")
  37e4c997dadf ("KVM: VMX: validate individual bits of guest MSR_IA32_FEATURE_CONTROL")

from the kvm tree and commit:

  dfa169bbee00 ("Revert "KVM: x86: add pcommit support"")

from the nvdimm tree.

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
index 9dcfb31f81ae,48394e9d56ef..000000000000
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@@ -7680,19 -7554,6 +7676,12 @@@ static int handle_pml_full(struct kvm_v
  	return 1;
  }
  
- static int handle_pcommit(struct kvm_vcpu *vcpu)
- {
- 	/* we never catch pcommit instruct for L1 guest. */
- 	WARN_ON(1);
- 	return 1;
- }
- 
 +static int handle_preemption_timer(struct kvm_vcpu *vcpu)
 +{
 +	kvm_lapic_expired_hv_timer(vcpu);
 +	return 1;
 +}
 +
  /*
   * The exit handlers return 1 if the exit was handled fully and guest execution
   * may resume.  Otherwise they set the kvm_run parameter to indicate what needs
@@@ -7743,8 -7604,6 +7732,7 @@@ static int (*const kvm_vmx_exit_handler
  	[EXIT_REASON_XSAVES]                  = handle_xsaves,
  	[EXIT_REASON_XRSTORS]                 = handle_xrstors,
  	[EXIT_REASON_PML_FULL]		      = handle_pml_full,
- 	[EXIT_REASON_PCOMMIT]                 = handle_pcommit,
 +	[EXIT_REASON_PREEMPTION_TIMER]	      = handle_preemption_timer,
  };
  
  static const int kvm_vmx_max_exit_handlers =
@@@ -8053,10 -7912,6 +8041,8 @@@ static bool nested_vmx_exit_handled(str
  		 * the XSS exit bitmap in vmcs12.
  		 */
  		return nested_cpu_has2(vmcs12, SECONDARY_EXEC_XSAVES);
- 	case EXIT_REASON_PCOMMIT:
- 		return nested_cpu_has2(vmcs12, SECONDARY_EXEC_PCOMMIT);
 +	case EXIT_REASON_PREEMPTION_TIMER:
 +		return false;
  	default:
  		return true;
  	}
@@@ -9239,22 -9072,6 +9225,13 @@@ static void vmx_cpuid_update(struct kvm
  
  	if (cpu_has_secondary_exec_ctrls())
  		vmcs_set_secondary_exec_control(secondary_exec_ctl);
 +
- 	if (static_cpu_has(X86_FEATURE_PCOMMIT) && nested) {
- 		if (guest_cpuid_has_pcommit(vcpu))
- 			vmx->nested.nested_vmx_secondary_ctls_high |=
- 				SECONDARY_EXEC_PCOMMIT;
- 		else
- 			vmx->nested.nested_vmx_secondary_ctls_high &=
- 				~SECONDARY_EXEC_PCOMMIT;
- 	}
- 
 +	if (nested_vmx_allowed(vcpu))
 +		to_vmx(vcpu)->msr_ia32_feature_control_valid_bits |=
 +			FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX;
 +	else
 +		to_vmx(vcpu)->msr_ia32_feature_control_valid_bits &=
 +			~FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX;
  }
  
  static void vmx_set_supported_cpuid(u32 func, struct kvm_cpuid_entry2 *entry)
