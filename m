From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: Tree for Apr 29 (kvm)
Date: Mon, 29 Apr 2013 18:46:18 +0200
Message-ID: <517EA3DA.3070706@redhat.com>
References: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au> <517E9758.4000506@infradead.org> <20130429163135.GA2737@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130429163135.GA2737@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gleb Natapov <gleb@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KVM <kvm@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>
List-Id: linux-next.vger.kernel.org

Il 29/04/2013 18:31, Gleb Natapov ha scritto:
>> > arch/x86/kvm/x86.c: In function 'kvm_dev_ioctl_check_extension':
>> > arch/x86/kvm/x86.c:2547:22: error: 'pci_bus_type' undeclared (first use in this function)
>> > 
>> > 
>> > Oops, CONFIG_PCI is not enabled.
> Alex, can you look at this please. Before "kvm: Allow build-time configuration
> of KVM device assignment" commit KVM depended on PCI to be enabled.
> 

KVM_CAP_IOMMU probably should depend on device assignment.  It doesn't
really belong in KVM at all, and is only there for device assignment.

Paolo
