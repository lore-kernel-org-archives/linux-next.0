From: Sachin Sant <sachinp@in.ibm.com>
Subject: Next April 30: x86 allnoconfig failure (iommu)
Date: Thu, 30 Apr 2009 14:53:11 +0530
Message-ID: <49F96DFF.2060105@in.ibm.com>
References: <20090430172923.bf9697c2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp02.in.ibm.com ([59.145.155.2]:48700 "EHLO
	e28smtp02.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751393AbZD3JXJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Apr 2009 05:23:09 -0400
In-Reply-To: <20090430172923.bf9697c2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, dwmw2@infradead.org

Todays Next tree build(x86 allnoconfig) failed with following
error.

arch/x86/built-in.o: In function `iommu_setup':
pci-dma.c:(.init.text+0x3101): undefined reference to `iommu_pass_through'
arch/x86/built-in.o: In function `pci_swiotlb_init':
(.init.text+0x805a): undefined reference to `iommu_pass_through'
make: *** [.tmp_vmlinux1] Error 1

Thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
