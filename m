From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 17 (kvm)
Date: Wed, 17 Apr 2013 11:10:51 -0700
Message-ID: <516EE5AB.4080201@infradead.org>
References: <20130417170450.5dd6e5f450de4d5bf197d997@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130417170450.5dd6e5f450de4d5bf197d997@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, KVM <kvm@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 04/17/13 00:04, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130416:
> 


on i386, SMP is disabled, X86_UP_APIC is not enabled, but
CONFIG_KVM_APIC_ARCHITECTURE=y:

arch/x86/kvm/vmx.c: In function 'vmx_deliver_posted_interrupt':
arch/x86/kvm/vmx.c:3950:3: error: 'apic' undeclared (first use in this function)


-- 
~Randy
