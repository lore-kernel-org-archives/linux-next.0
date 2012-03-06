From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: build failure after merge of the kvm tree
Date: Tue, 06 Mar 2012 12:34:23 +0200
Message-ID: <4F55E82F.5020008@redhat.com>
References: <20120306155332.42d5094876089c8b7bb36bb0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:61605 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964997Ab2CFKem (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Mar 2012 05:34:42 -0500
In-Reply-To: <20120306155332.42d5094876089c8b7bb36bb0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Ellerman <michael@ellerman.id.au>

On 03/06/2012 06:53 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the kvm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> include/linux/kvm_host.h:813:13: error: 'kvm_vcpu_compatible' defined but not used [-Werror=unused-function]
> cc1: all warnings being treated as errors
>
> Caused by commit ab0bd7dfdaa5 ("KVM: Ensure all vcpus are consistent with
> in-kernel irqchip settings").
>
> This function presumably need to be "static inline bool" in the !
> CONFIG_KVM_APIC_ARCHITECTURE case.

Thanks for the report; fixed.

-- 
error compiling committee.c: too many arguments to function
