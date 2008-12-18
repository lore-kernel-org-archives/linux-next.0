From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] KVM: Remove old kvm_guest_debug structs (was: linux-next:
 kvm tree build failure)
Date: Thu, 18 Dec 2008 12:33:18 +0100
Message-ID: <494A34FE.3040607@siemens.com>
References: <20081218220526.b97c69e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <20081218220526.b97c69e4.sfr@canb.auug.org.au>
Sender: kvm-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen Rothwell wrote:
> Hi Avi,
> 
> Today's linux-next build (powerpc ppc44x_config) failed like this:
> 
> In file included from include/linux/kvm_host.h:27,
>                  from arch/powerpc/include/asm/kvm_44x.h:23,
>                  from arch/powerpc/kernel/asm-offsets.c:52:
> arch/powerpc/include/asm/kvm_host.h:203: error: redefinition of 'struct kvm_guest_debug'
> 
> Caused by commit 887e823e3f9c402ff2fe1ea2dc25072ebe81b5b1 ("KVM: New
> guest debug interface") which added struct kvm_guest_debug to
> include/linux/kvm.h but didn't remove it from 
> arch/powerpc/include/asm/kvm_host.h.  (ia64 and s390 probably have the
> same problem.)
> 
> I have reverted the kvm tree for today.

Yes, missed them. This patch should cure the issue.

Jan

--------->

Remove the remaining arch fragments of the old guest debug interface
that now break non-x86 builds.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

 arch/ia64/include/asm/kvm_host.h    |    2 --
 arch/powerpc/include/asm/kvm_host.h |    6 ------
 arch/s390/include/asm/kvm_host.h    |    3 ---
 3 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/arch/ia64/include/asm/kvm_host.h b/arch/ia64/include/asm/kvm_host.h
index 0560f3f..f262efe 100644
--- a/arch/ia64/include/asm/kvm_host.h
+++ b/arch/ia64/include/asm/kvm_host.h
@@ -235,8 +235,6 @@ struct kvm_vm_data {
 
 struct kvm;
 struct kvm_vcpu;
-struct kvm_guest_debug{
-};
 
 struct kvm_mmio_req {
 	uint64_t addr;          /*  physical address		*/
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index c1e436f..a226005 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -200,10 +200,4 @@ struct kvm_vcpu_arch {
 	unsigned long pending_exceptions;
 };
 
-struct kvm_guest_debug {
-	int enabled;
-	unsigned long bp[4];
-	int singlestep;
-};
-
 #endif /* __POWERPC_KVM_HOST_H__ */
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index 3c55e41..c6e674f 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -21,9 +21,6 @@
 /* memory slots that does not exposed to userspace */
 #define KVM_PRIVATE_MEM_SLOTS 4
 
-struct kvm_guest_debug {
-};
-
 struct sca_entry {
 	atomic_t scn;
 	__u64	reserved;

-- 
Siemens AG, Corporate Technology, CT SE 26
Corporate Competence Center Embedded Linux
