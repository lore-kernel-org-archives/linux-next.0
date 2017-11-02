From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kspp tree with the kvm tree
Date: Thu, 2 Nov 2017 16:53:58 +1100
Message-ID: <20171102165358.79adaffb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@google.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Shakeel Butt <shakeelb@google.com>
List-Id: linux-next.vger.kernel.org

Hi Kees,

Today's linux-next merge of the kspp tree got a conflict in:

  virt/kvm/kvm_main.c

between commit:

  46bea48ac241 ("kvm, mm: account kvm related kmem slabs to kmemcg")

from the kvm tree and commit:

  67ac5ee34976 ("kvm: whitelist struct kvm_vcpu_arch")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc virt/kvm/kvm_main.c
index fe080f5152b6,1075d7338807..000000000000
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@@ -4006,8 -4009,11 +4006,12 @@@ int kvm_init(void *opaque, unsigned vcp
  	/* A kmem cache lets us meet the alignment requirements of fx_save. */
  	if (!vcpu_align)
  		vcpu_align = __alignof__(struct kvm_vcpu);
- 	kvm_vcpu_cache = kmem_cache_create("kvm_vcpu", vcpu_size, vcpu_align,
- 					   SLAB_ACCOUNT, NULL);
+ 	kvm_vcpu_cache =
+ 		kmem_cache_create_usercopy("kvm_vcpu", vcpu_size, vcpu_align,
 -					   0, offsetof(struct kvm_vcpu, arch),
++					   SLAB_ACCOUNT,
++					   offsetof(struct kvm_vcpu, arch),
+ 					   sizeof_field(struct kvm_vcpu, arch),
+ 					   NULL);
  	if (!kvm_vcpu_cache) {
  		r = -ENOMEM;
  		goto out_free_3;
