From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH] kvm: x86.c make kvm_load_realmode_segment static
Date: Fri, 22 Aug 2008 13:29:17 -0700
Message-ID: <1219436957.4493.8.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.28]:58481 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529AbYHVU3L (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Aug 2008 16:29:11 -0400
Received: by yx-out-2324.google.com with SMTP id 8so392047yxm.1
        for <linux-next@vger.kernel.org>; Fri, 22 Aug 2008 13:29:11 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next <linux-next@vger.kernel.org>

Noticed by sparse:
arch/x86/kvm/x86.c:3591:5: warning: symbol 'kvm_load_realmode_segment' was not declared. Should it be static?

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
Appeared between next-20080820 and next-20080821

 arch/x86/kvm/x86.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index bfc7c33..639843c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3588,7 +3588,7 @@ static int load_segment_descriptor_to_kvm_desct(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-int kvm_load_realmode_segment(struct kvm_vcpu *vcpu, u16 selector, int seg)
+static int kvm_load_realmode_segment(struct kvm_vcpu *vcpu, u16 selector, int seg)
 {
 	struct kvm_segment segvar = {
 		.base = selector << 4,
-- 
1.6.0.340.g84854
