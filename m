From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (kvm tree
 related)
Date: Mon, 26 Jul 2010 14:27:25 +1000
Message-ID: <20100726142725.fbc5d94e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50400 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750856Ab0GZE13 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Jul 2010 00:27:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>

Hi all,

After merging the final tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

cc1: warnings being treated as errors
arch/powerpc/kvm/44x_tlb.c: In function 'kvmppc_mmu_map':
arch/powerpc/kvm/44x_tlb.c:319: error: format '%lx' expects type 'long unsigned int', but argument 2 has type 'gfn_t'

Caused by commit 05c07e00b15e00632a2502dcbf253415449e89da ("KVM: Use u64
for frame data types").  I applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 26 Jul 2010 14:25:12 +1000
Subject: [PATCH] kvm: u64's should be printed with %llx

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kvm/44x_tlb.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/kvm/44x_tlb.c b/arch/powerpc/kvm/44x_tlb.c
index 8123125..9b9b5cd 100644
--- a/arch/powerpc/kvm/44x_tlb.c
+++ b/arch/powerpc/kvm/44x_tlb.c
@@ -316,7 +316,8 @@ void kvmppc_mmu_map(struct kvm_vcpu *vcpu, u64 gvaddr, gpa_t gpaddr,
 	gfn = gpaddr >> PAGE_SHIFT;
 	new_page = gfn_to_page(vcpu->kvm, gfn);
 	if (is_error_page(new_page)) {
-		printk(KERN_ERR "Couldn't get guest page for gfn %lx!\n", gfn);
+		printk(KERN_ERR "Couldn't get guest page for gfn %llx!\n",
+			(unsigned long long)gfn);
 		kvm_release_page_clean(new_page);
 		return;
 	}
-- 
1.7.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
