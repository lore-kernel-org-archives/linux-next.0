From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: next-20090317: ia64/kvm build fails
Date: Tue, 17 Mar 2009 18:27:47 +0300
Message-ID: <a4423d670903170827k5bba62fbi68f987582b091214@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
Sender: kvm-owner@vger.kernel.org
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, kvm-ia64@vger.kernel.org, Gleb Natapov <gleb@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi

randconfig build on ia64 fails like this

  CC [M]  arch/ia64/kvm/../../../virt/kvm/irq_comm.o
arch/ia64/kvm/../../../virt/kvm/irq_comm.c: In function
'kvm_irq_delivery_to_apic':
arch/ia64/kvm/../../../virt/kvm/irq_comm.c:53: error: 'APIC_DM_LOWEST'
undeclared (first use in this function)

Introduced in
654ae3513 "KVM: APIC: get rid of deliver_bitmask"
