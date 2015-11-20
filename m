From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the kvm tree
Date: Fri, 20 Nov 2015 12:47:17 +1100
Message-ID: <20151120124717.4179e98b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  include/linux/kvm_host.h
  arch/s390/kvm/interrupt.c
  arch/s390/kvm/sigp.c

between commits:

  db27a7a37aa0 ("KVM: Provide function for VCPU lookup by id")
  b85de33a1a34 ("KVM: s390: avoid memory overwrites on emergency signal injection")
  152e9f65d66f ("KVM: s390: fix wrong lookup of VCPUs by array index")

from the kvm tree and commit:

  a8ab7a5fd13b ("KVM: Provide function for VCPU lookup by id")
  e896d1d08efc ("KVM: s390: avoid memory overwrites on emergency signal injection")
  32d7bd98e799 ("KVM: s390: fix wrong lookup of VCPUs by array index")

from the kvms390 tree.

These patches used different names for the added function.  I used the
name from the kvm tree (kvm_get_vcpu_by_id).

This also required the following merge patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 20 Nov 2015 12:42:17 +1100
Subject: [PATCH] KVM: s390: update for kvm_lookup_vcpu name change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 arch/s390/kvm/diag.c         | 2 +-
 virt/kvm/kvm_main.c          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 904b3b0afb48..a29da44cdc6c 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -311,7 +311,7 @@ static struct kvm_vcpu *kvmppc_find_vcpu(struct kvm *kvm, int id)
 	struct kvm_vcpu *ret;
 
 	mutex_lock(&kvm->lock);
-	ret = kvm_lookup_vcpu(kvm, id);
+	ret = kvm_get_vcpu_by_id(kvm, id);
 	mutex_unlock(&kvm->lock);
 	return ret;
 }
diff --git a/arch/s390/kvm/diag.c b/arch/s390/kvm/diag.c
index aaa7cc041335..05f7de9869a9 100644
--- a/arch/s390/kvm/diag.c
+++ b/arch/s390/kvm/diag.c
@@ -165,7 +165,7 @@ static int __diag_time_slice_end_directed(struct kvm_vcpu *vcpu)
 	if (tid == vcpu->vcpu_id)
 		return 0;
 
-	tcpu = kvm_lookup_vcpu(vcpu->kvm, tid);
+	tcpu = kvm_get_vcpu_by_id(vcpu->kvm, tid);
 	if (tcpu)
 		kvm_vcpu_yield_to(tcpu);
 	return 0;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1ee2f738bf61..1f0f8c4ca345 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2358,7 +2358,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, u32 id)
 		r = -EINVAL;
 		goto unlock_vcpu_destroy;
 	}
-	if (kvm_lookup_vcpu(kvm, id)) {
+	if (kvm_get_vcpu_by_id(kvm, id)) {
 		r = -EEXIST;
 		goto unlock_vcpu_destroy;
 	}
-- 
2.6.2

This should probably all be cleaned up in the kvms390 tree.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
