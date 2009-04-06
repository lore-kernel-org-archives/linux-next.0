From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: Next April 6 : x86 allmodconfig failure [drivers/pci]
Date: Mon, 6 Apr 2009 20:06:21 +0400
Message-ID: <a4423d670904060906l339a987bm8cb0543d309ecac3@mail.gmail.com>
References: <20090406164555.e1232116.sfr@canb.auug.org.au>
	 <49D9CF13.60202@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:54407 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750903AbZDFQGZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2009 12:06:25 -0400
In-Reply-To: <49D9CF13.60202@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>, David Woodhouse <david.woodhouse@intel.com>, Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

2009/4/6 Sachin Sant <sachinp@in.ibm.com>:
> Today's next tree allmodconfig build on x86 failed with
>
> drivers/pci/intel-iommu.c:2636:35: error: macro "if" passed 2 arguments, but
> takes just 1
> drivers/pci/intel-iommu.c: In function init_iommu_hw:
> drivers/pci/intel-iommu.c:2636: error: expected ( before { token
> drivers/pci/intel-iommu.c:2637: error: ______r undeclared (first use in this
> function)
> drivers/pci/intel-iommu.c:2637: error: (Each undeclared identifier is
> reported only once
> drivers/pci/intel-iommu.c:2637: error: for each function it appears in.)
> drivers/pci/intel-iommu.c:2640:35: error: macro "if" passed 2 arguments, but
> takes just 1
> drivers/pci/intel-iommu.c:2640: error: expected ( before { token
>
> and many more of such errors. Similar errors with intr_remapping.c
>
> drivers/pci/intr_remapping.c:679:28: error: macro "if" passed 2 arguments,
> but takes just 1
> drivers/pci/intr_remapping.c: In function disable_intr_remapping:
> drivers/pci/intr_remapping.c:679: error: expected ( before { token
> drivers/pci/intr_remapping.c:693:28: error: macro "if" passed 2 arguments,
> but takes just 1
> ......

CC'ed David and Ingo.

commit 8f912ba4d

if (i=drhd->iommu, 0)

looks strange
