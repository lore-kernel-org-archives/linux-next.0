From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm tree
Date: Wed, 8 Feb 2017 14:23:51 +1100
Message-ID: <20170208142351.15da0ae2@canb.auug.org.au>
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

arch/x86/kvm/x86.c: In function 'kvm_pv_clock_pairing':
arch/x86/kvm/x86.c:6157:2: error: unknown type name 'cycle_t'
  cycle_t cycle;
  ^
arch/x86/kvm/x86.c:6163:42: error: passing argument 2 of 'kvm_get_walltime_and_clockread' from incompatible pointer type [-Werror=incompatible-pointer-types]
  if (kvm_get_walltime_and_clockread(&ts, &cycle) == false)
                                          ^
arch/x86/kvm/x86.c:1665:13: note: expected 'u64 * {aka long long unsigned int *}' but argument is of type 'int *'
 static bool kvm_get_walltime_and_clockread(struct timespec *ts,
             ^

Caused by commit

  55dd00a73a51 ("KVM: x86: add KVM_HC_CLOCK_PAIRING hypercall")

I have used the version fo the kvm tree from next-20170207 for today.

-- 
Cheers,
Stephen Rothwell
