From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the kvm tree
Date: Sun, 24 Jul 2016 15:59:48 +1000
Message-ID: <20160724155948.6484cf79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
Sender: kvm-owner@vger.kernel.org
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  Documentation/virtual/kvm/api.txt

between commit:

  3713131345fb ("KVM: x86: add KVM_CAP_X2APIC_API")

from the kvm tree and commit:

  76a10b86785c ("KVM: api: Pass the devid in the msi routing entry")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/virtual/kvm/api.txt
index 5237e1b2fd66,7a04216d7278..000000000000
--- a/Documentation/virtual/kvm/api.txt
+++ b/Documentation/virtual/kvm/api.txt
@@@ -1479,14 -1486,20 +1486,25 @@@ struct kvm_irq_routing_msi 
  	__u32 address_lo;
  	__u32 address_hi;
  	__u32 data;
- 	__u32 pad;
+ 	union {
+ 		__u32 pad;
+ 		__u32 devid;
+ 	};
  };
  
 +On x86, address_hi is ignored unless the KVM_X2APIC_API_USE_32BIT_IDS
 +feature of KVM_CAP_X2APIC_API capability is enabled.  If it is enabled,
 +address_hi bits 31-8 provide bits 31-8 of the destination id.  Bits 7-0 of
 +address_hi must be zero.
 +
+ devid: If KVM_MSI_VALID_DEVID is set, contains a unique device identifier
+        for the device that wrote the MSI message.
+        For PCI, this is usually a BFD identifier in the lower 16 bits.
+ 
+ The per-VM KVM_CAP_MSI_DEVID capability advertises the requirement to
+ provide the device ID. If this capability is not set, userland cannot
+ rely on the kernel to allow the KVM_MSI_VALID_DEVID flag being set.
+ 
  struct kvm_irq_routing_s390_adapter {
  	__u64 ind_addr;
  	__u64 summary_addr;
