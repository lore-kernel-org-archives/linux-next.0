From: Gleb Natapov <gleb@redhat.com>
Subject: Re: next-20090317: ia64/kvm build fails
Date: Tue, 17 Mar 2009 17:56:31 +0200
Message-ID: <20090317155631.GB1754@redhat.com>
References: <a4423d670903170827k5bba62fbi68f987582b091214@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:44043 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755749AbZCQQAV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Mar 2009 12:00:21 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670903170827k5bba62fbi68f987582b091214@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, kvm-ia64@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org

On Tue, Mar 17, 2009 at 06:27:47PM +0300, Alexander Beregalov wrote:
> Hi
> 
> randconfig build on ia64 fails like this
> 
>   CC [M]  arch/ia64/kvm/../../../virt/kvm/irq_comm.o
> arch/ia64/kvm/../../../virt/kvm/irq_comm.c: In function
> 'kvm_irq_delivery_to_apic':
> arch/ia64/kvm/../../../virt/kvm/irq_comm.c:53: error: 'APIC_DM_LOWEST'
> undeclared (first use in this function)
> 
> Introduced in
> 654ae3513 "KVM: APIC: get rid of deliver_bitmask"
The fix was submitted, but not yet applied:
http://marc.info/?l=kvm&m=123676776311933&w=4

--
			Gleb.
