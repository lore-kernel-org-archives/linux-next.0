From: Eric Auger <eric.auger@linaro.org>
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
Date: Mon, 22 Sep 2014 07:07:36 +0200
Message-ID: <541FAE98.6080806@linaro.org>
References: <20140922140645.7c2ad9c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140922140645.7c2ad9c8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
List-Id: linux-next.vger.kernel.org

Dear all,

Thanks Stephen for reporting the problem. Indeed removing irq.h header
file is no more possible since commit
c77dcacb397519b6ade8f08201a4a90a7f4f751e, "KVM: Move more code under
CONFIG_HAVE_KVM_IRQFD" which moves among other things
kvm_register_irq_ack_notifier and kvm_unregister_irq_ack_notifier in
eventfd.c.

including virt/kvm/ioapic.h might fix the problem but I am OoO next week
and cannot investigate further right now.

Please can you remove that commit. Sorry for the inconvenience.

Best Regards

Eric


On 09/22/2014 06:06 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm-arm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> arch/x86/kvm/../../../virt/kvm/eventfd.c: In function 'kvm_register_irq_ack_notifier':
> arch/x86/kvm/../../../virt/kvm/eventfd.c:493:2: error: implicit declaration of function 'kvm_vcpu_request_scan_ioapic' [-Werror=implicit-function-declaration]
>   kvm_vcpu_request_scan_ioapic(kvm);
>   ^
> 
> Probably caused by commit 0ba09511ddc3 ("KVM: EVENTFD: remove inclusion
> of irq.h").
> 
> I have used the kvm-arm tree from next-20140919 for today.
> 
