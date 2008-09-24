From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: kvm tree build failure
Date: Wed, 24 Sep 2008 09:18:37 -0700
Message-ID: <200809240918.38033.jbarnes@virtuousgeek.org>
References: <20080917170126.7d6a06d9.sfr@canb.auug.org.au> <20080917085026.GA27317@elte.hu> <48DA3502.5060906@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-02.bluehost.com ([69.89.21.12]:45988 "HELO
	outbound-mail-02.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750988AbYIXQZa (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Sep 2008 12:25:30 -0400
In-Reply-To: <48DA3502.5060906@redhat.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@redhat.com>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, "Kay, Allen M" <allen.m.kay@intel.com>

On Wednesday, September 24, 2008 5:39 am Avi Kivity wrote:
> Ingo Molnar wrote:
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >> Hi Avi,
> >>
> >> Today's linux-next build (x86_64 allmodconfig) failed like this:
> >>
> >> In file included from arch/x86/kvm/../../../virt/kvm/kvm_main.c:44:
> >> include/linux/intel-iommu.h:31:27: error: dma_remapping.h: No such file
> >> or directory drivers/pci/intr_remapping.c:8:25: error: intel-iommu.h: No
> >> such file or directory
> >>
> >> I needed to add the following patch to complete the merge of the kvm
> >> tree due to commit 14f776b8e0aa6724069a35bf4e172d93be74ba90 ("VT-d:
> >> Changes to support KVM") interacting with other changes ("x64,
> >> x2apic/intr-remap: ...") in the x86 tree.
> >
> > hm, that looks like a non-trivial merge interaction. I'm wondering how
> > we should solve this. Avi, Jesse, any preferences?
>
> I'll look at the pci tree.  URL and branch, please?

git://git.kernel.org/pub/scm/linux/kernel/git/jbarnes/pci-2.6.git linux-next

Jesse
