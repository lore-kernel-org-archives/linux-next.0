From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm tree
Date: Mon, 19 Dec 2016 12:11:29 +1100
Message-ID: <20161219121129.1590dbe3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the kvm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

arch/x86/kernel/kvm.c: In function '__kvm_vcpu_is_preempted':
arch/x86/kernel/kvm.c:596:14: error: 'struct kvm_steal_time' has no member named 'preempted'
  return !!src->preempted;
              ^
arch/x86/kernel/kvm.c:597:1: warning: control reaches end of non-void function [-Wreturn-type]  
 }
 ^

Caused by commit

  b94c3698b4b0 ("Revert "x86/kvm: Support the vCPU preemption check"")

I have used the kvm tree from next-20161216 for today.

-- 
Cheers,
Stephen Rothwell
