From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings
Date: Tue, 2 May 2017 16:05:30 +1000
Message-ID: <20170502160530.34b680b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37471 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751971AbdEBGFh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 May 2017 02:05:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

The linux-next build (powerpc allyesconfig) produced these warnings
(and have for a while):

arch/powerpc/kvm/book3s_pr_papr.c: In function 'kvmppc_h_pr_enter':
arch/powerpc/kvm/book3s_pr_papr.c:53:2: warning: ignoring return value of 'copy_from_user', declared with attribute warn_unused_result [-Wunused-result]
  copy_from_user(pteg, (void __user *)pteg_addr, sizeof(pteg));
  ^
arch/powerpc/kvm/book3s_pr_papr.c:74:2: warning: ignoring return value of 'copy_to_user', declared with attribute warn_unused_result [-Wunused-result]
  copy_to_user((void __user *)pteg_addr, hpte, HPTE_SIZE);
  ^
arch/powerpc/kvm/book3s_pr_papr.c: In function 'kvmppc_h_pr_remove':
arch/powerpc/kvm/book3s_pr_papr.c:96:2: warning: ignoring return value of 'copy_from_user', declared with attribute warn_unused_result [-Wunused-result]
  copy_from_user(pte, (void __user *)pteg, sizeof(pte));
  ^
arch/powerpc/kvm/book3s_pr_papr.c:106:2: warning: ignoring return value of 'copy_to_user', declared with attribute warn_unused_result [-Wunused-result]
  copy_to_user((void __user *)pteg, &v, sizeof(v));
  ^
arch/powerpc/kvm/book3s_pr_papr.c: In function 'kvmppc_h_pr_protect':
arch/powerpc/kvm/book3s_pr_papr.c:214:2: warning: ignoring return value of 'copy_from_user', declared with attribute warn_unused_result [-Wunused-result]
  copy_from_user(pte, (void __user *)pteg, sizeof(pte));
  ^
arch/powerpc/kvm/book3s_pr_papr.c:237:2: warning: ignoring return value of 'copy_to_user', declared with attribute warn_unused_result [-Wunused-result]
  copy_to_user((void __user *)pteg, pte, sizeof(pte));
  ^
arch/powerpc/kvm/book3s_pr_papr.c: In function 'kvmppc_h_pr_bulk_remove':
arch/powerpc/kvm/book3s_pr_papr.c:174:3: warning: ignoring return value of 'copy_from_user', declared with attribute warn_unused_result [-Wunused-result]
   copy_from_user(pte, (void __user *)pteg, sizeof(pte));
   ^
arch/powerpc/kvm/book3s_pr_papr.c:187:4: warning: ignoring return value of 'copy_to_user', declared with attribute warn_unused_result [-Wunused-result]
    copy_to_user((void __user *)pteg, &v, sizeof(v));
    ^

These calls have been there since about v3.1-rc8.  I assume the
copy_to/from_user() work has pointed them out.

-- 
Cheers,
Stephen Rothwell
