From: Feng Tang <feng.tang@intel.com>
Subject: Re: linux-next: build failure after merge of the acpi tree
Date: Thu, 2 Aug 2012 10:00:22 +0800
Message-ID: <20120802100022.58a5ebd8@feng-i7>
References: <20120802112033.c1531ffe7bf7147c461cac0a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:25938 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753215Ab2HBCFV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Aug 2012 22:05:21 -0400
In-Reply-To: <20120802112033.c1531ffe7bf7147c461cac0a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>

On Thu, 2 Aug 2012 11:20:33 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Len,
> 
> After merging the acpi tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/iommu/amd_iommu_init.c: In function 'early_amd_iommu_init':
> drivers/iommu/amd_iommu_init.c:1535:2: error: implicit declaration of
> function 'acpi_get_table_with_size' [-Werror=implicit-function-declaration]
> 
> Caused by commit 705d9245d714 ("ACPI: remove acpi_get_table_with_size()
> fucntion").
> 
> This extra call to acpi_get_table_with_size() was added by commit
> 02f3b3f5449c ("iommu/amd: Use acpi_get_table instead of
> acpi_table_parse") added to Linus' tree on about July 25 via the iommu
> tree.

Thanks for the root cause, Yinghai also noticed me about that, and I've
send a updated patch 
	https://lkml.org/lkml/2012/8/1/25 

So it should be ok after Len merge this v2 patch.

Thanks,
Feng

> 
> I have reverted the acpi tree commit for today.
