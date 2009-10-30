From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with the kvm tree
Date: Fri, 30 Oct 2009 19:20:55 +1100
Message-ID: <20091030192055.cbf6905b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49681 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756214AbZJ3IUy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 30 Oct 2009 04:20:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zachary Amsden <zamsden@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Alexander Graf <agraf@suse.de>, Avi Kivity <avi@redhat.com>

Hi all,

Today's linux-next merge of the percpu tree got a conflict in
arch/x86/kvm/svm.c between commits
41c39c658561cde3e27d3ae38c589598fc22f633 ("KVM: Activate Virtualization
On Demand") and 971ea59279a67136729fda49311f7edb8c2092a1 ("KVM: Fix
printk name error in svm.c") from the kvm tree and commit
0fe1e009541e925adc1748a605d8b66188e4b2ab ("percpu: make percpu symbols in
x86 unique") from the percpu tree.

Just context changes.  I fixed them up (see below) and can carry the
changes as necessary.

I do wonder if the local variable name changes in the percpu tree change
were a good idea?
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kvm/svm.c
index 279a2ae,6c79a14..0000000
--- a/arch/x86/kvm/svm.c
+++ b/arch/x86/kvm/svm.c
@@@ -316,46 -316,40 +316,46 @@@ static void svm_hardware_disable(void *
  	cpu_svm_disable();
  }
  
 -static void svm_hardware_enable(void *garbage)
 +static int svm_hardware_enable(void *garbage)
  {
  
- 	struct svm_cpu_data *svm_data;
+ 	struct svm_cpu_data *sd;
  	uint64_t efer;
  	struct descriptor_table gdt_descr;
  	struct desc_struct *gdt;
  	int me = raw_smp_processor_id();
  
 +	rdmsrl(MSR_EFER, efer);
 +	if (efer & EFER_SVME)
 +		return -EBUSY;
 +
  	if (!has_svm()) {
 -		printk(KERN_ERR "svm_cpu_init: err EOPNOTSUPP on %d\n", me);
 -		return;
 +		printk(KERN_ERR "svm_hardware_enable: err EOPNOTSUPP on %d\n",
 +		       me);
 +		return -EINVAL;
  	}
- 	svm_data = per_cpu(svm_data, me);
+ 	sd = per_cpu(svm_data, me);
  
- 	if (!svm_data) {
+ 	if (!sd) {
 -		printk(KERN_ERR "svm_cpu_init: svm_data is NULL on %d\n",
 +		printk(KERN_ERR "svm_hardware_enable: svm_data is NULL on %d\n",
  		       me);
 -		return;
 +		return -EINVAL;
  	}
  
- 	svm_data->asid_generation = 1;
- 	svm_data->max_asid = cpuid_ebx(SVM_CPUID_FUNC) - 1;
- 	svm_data->next_asid = svm_data->max_asid + 1;
+ 	sd->asid_generation = 1;
+ 	sd->max_asid = cpuid_ebx(SVM_CPUID_FUNC) - 1;
+ 	sd->next_asid = sd->max_asid + 1;
  
  	kvm_get_gdt(&gdt_descr);
  	gdt = (struct desc_struct *)gdt_descr.base;
- 	svm_data->tss_desc = (struct kvm_ldttss_desc *)(gdt + GDT_ENTRY_TSS);
+ 	sd->tss_desc = (struct kvm_ldttss_desc *)(gdt + GDT_ENTRY_TSS);
  
  	wrmsrl(MSR_EFER, efer | EFER_SVME);
  
  	wrmsrl(MSR_VM_HSAVE_PA,
- 	       page_to_pfn(svm_data->save_area) << PAGE_SHIFT);
+ 	       page_to_pfn(sd->save_area) << PAGE_SHIFT);
 +
 +	return 0;
  }
  
  static void svm_cpu_uninit(int cpu)
