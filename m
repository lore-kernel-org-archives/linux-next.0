From: Sachin Sant <sachinp@in.ibm.com>
Subject: Next April 6 : x86 allmodconfig failure [drivers/pci]
Date: Mon, 06 Apr 2009 15:14:51 +0530
Message-ID: <49D9CF13.60202@in.ibm.com>
References: <20090406164555.e1232116.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp05.in.ibm.com ([59.145.155.5]:59580 "EHLO
	e28smtp05.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755236AbZDFJoz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2009 05:44:55 -0400
In-Reply-To: <20090406164555.e1232116.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Today's next tree allmodconfig build on x86 failed with

drivers/pci/intel-iommu.c:2636:35: error: macro "if" passed 2 arguments, but takes just 1
drivers/pci/intel-iommu.c: In function init_iommu_hw:
drivers/pci/intel-iommu.c:2636: error: expected ( before { token
drivers/pci/intel-iommu.c:2637: error: ______r undeclared (first use in this function)
drivers/pci/intel-iommu.c:2637: error: (Each undeclared identifier is reported only once
drivers/pci/intel-iommu.c:2637: error: for each function it appears in.)
drivers/pci/intel-iommu.c:2640:35: error: macro "if" passed 2 arguments, but takes just 1
drivers/pci/intel-iommu.c:2640: error: expected ( before { token

and many more of such errors. Similar errors with intr_remapping.c

drivers/pci/intr_remapping.c:679:28: error: macro "if" passed 2 arguments, but takes just 1
drivers/pci/intr_remapping.c: In function disable_intr_remapping:
drivers/pci/intr_remapping.c:679: error: expected ( before { token
drivers/pci/intr_remapping.c:693:28: error: macro "if" passed 2 arguments, but takes just 1
......

Thanks
-Sachin



-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
