From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: kvm tree build failure
Date: Wed, 17 Sep 2008 10:50:26 +0200
Message-ID: <20080917085026.GA27317@elte.hu>
References: <20080917170126.7d6a06d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:58322 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751144AbYIQIuo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Sep 2008 04:50:44 -0400
Content-Disposition: inline
In-Reply-To: <20080917170126.7d6a06d9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, "Kay, Allen M" <allen.m.kay@intel.com>, Jesse Barnes <jbarnes@virtuousgeek.org>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Avi,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> In file included from arch/x86/kvm/../../../virt/kvm/kvm_main.c:44:
> include/linux/intel-iommu.h:31:27: error: dma_remapping.h: No such file or directory
> drivers/pci/intr_remapping.c:8:25: error: intel-iommu.h: No such file or directory
> 
> I needed to add the following patch to complete the merge of the kvm tree
> due to commit 14f776b8e0aa6724069a35bf4e172d93be74ba90 ("VT-d: Changes to
> support KVM") interacting with other changes ("x64,
> x2apic/intr-remap: ...") in the x86 tree.

hm, that looks like a non-trivial merge interaction. I'm wondering how 
we should solve this. Avi, Jesse, any preferences?

	Ingo
