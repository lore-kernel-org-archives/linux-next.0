From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm tree build failure
Date: Wed, 24 Sep 2008 15:39:30 +0300
Message-ID: <48DA3502.5060906@redhat.com>
References: <20080917170126.7d6a06d9.sfr@canb.auug.org.au> <20080917085026.GA27317@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:44489 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751054AbYIXMj5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Sep 2008 08:39:57 -0400
In-Reply-To: <20080917085026.GA27317@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, "Kay, Allen M" <allen.m.kay@intel.com>, Jesse Barnes <jbarnes@virtuousgeek.org>

Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>   
>> Hi Avi,
>>
>> Today's linux-next build (x86_64 allmodconfig) failed like this:
>>
>> In file included from arch/x86/kvm/../../../virt/kvm/kvm_main.c:44:
>> include/linux/intel-iommu.h:31:27: error: dma_remapping.h: No such file or directory
>> drivers/pci/intr_remapping.c:8:25: error: intel-iommu.h: No such file or directory
>>
>> I needed to add the following patch to complete the merge of the kvm tree
>> due to commit 14f776b8e0aa6724069a35bf4e172d93be74ba90 ("VT-d: Changes to
>> support KVM") interacting with other changes ("x64,
>> x2apic/intr-remap: ...") in the x86 tree.
>>     
>
> hm, that looks like a non-trivial merge interaction. I'm wondering how 
> we should solve this. Avi, Jesse, any preferences?
>   

I'll look at the pci tree.  URL and branch, please?

-- 
error compiling committee.c: too many arguments to function
