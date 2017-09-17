From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure in Linus' tree
Date: Mon, 18 Sep 2017 09:34:48 +1000
Message-ID: <20170918093448.359d25c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Jan H. =?UTF-8?B?U2Now7Zu?= =?UTF-8?B?aGVycg==?=" <jschoenh@amazon.de>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Linus,

With just your tree, today's linux-next build (powerpc ppc64_defconfig)
failed like this:

arch/powerpc/kvm/../../../virt/kvm/eventfd.c: In function 'kvm_irqfd':
arch/powerpc/kvm/../../../virt/kvm/eventfd.c:568:19: error: 'KVM_MAX_IRQ_ROUTES' undeclared (first use in this function)
  if (args->gsi >= KVM_MAX_IRQ_ROUTES)
                   ^

Caused by commit

  36ae3c0a36b7 ("KVM: Don't accept obviously wrong gsi values via KVM_IRQFD")

KVM_MAX_IRQ_ROUTES is only defined when CONFIG_HAVE_KVM_IRQ_ROUTING is
defined (which for PowerPC is only when CONFIG_KVM_MPIC is defined which
depends on CONFIG_E500).

I have just reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
