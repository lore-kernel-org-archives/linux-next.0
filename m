From: Jike Song <albcamus@gmail.com>
Subject: Re: Next April 6 : x86 allmodconfig failure [drivers/pci]
Date: Tue, 7 Apr 2009 13:27:42 +0800
Message-ID: <df9815e70904062227u2ee2214do56ce0b86207c52@mail.gmail.com>
References: <20090406164555.e1232116.sfr@canb.auug.org.au>
	 <49D9CF13.60202@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.186]:22942 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755930AbZDGF1q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2009 01:27:46 -0400
In-Reply-To: <49D9CF13.60202@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Mon, Apr 6, 2009 at 5:44 PM, Sachin Sant <sachinp@in.ibm.com> wrote:
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
>
> Thanks
> -Sachin

Also happens on linux-next?  This happens on Linus tree: v2.6.29-9854-gd508afb



-- 
Thanks,
Jike
