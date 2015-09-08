From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm tree
Date: Tue, 8 Sep 2015 11:35:44 +1000
Message-ID: <20150908113544.41d5a451@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52390 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751942AbbIHBfr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Sep 2015 21:35:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wanpeng Li <wanpeng.li@hotmail.com>, Paolo Bonzini <pbonzini@redhat.com>

Hi all,

After merging the kvm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'grow_halt_poll_ns':
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1931:2: error: implicit declaration of function 'trace_kvm_halt_poll_ns_grow' [-Werror=implicit-function-declaration]
  trace_kvm_halt_poll_ns_grow(vcpu->vcpu_id, val, old);
  ^
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'shrink_halt_poll_ns':
arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1945:2: error: implicit declaration of function 'trace_kvm_halt_poll_ns_shrink' [-Werror=implicit-function-declaration]
  trace_kvm_halt_poll_ns_shrink(vcpu->vcpu_id, val, old);
  ^

Caused by commit

  2cbd78244fb2 ("KVM: trace kvm_halt_poll_ns grow/shrink")

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
