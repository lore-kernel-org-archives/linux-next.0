From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm tree build failure
Date: Wed, 15 Oct 2008 15:25:22 +0200
Message-ID: <48F5EF42.3050206@redhat.com>
References: <20081015164710.de95b5e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:37656 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753050AbYJONZa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 09:25:30 -0400
In-Reply-To: <20081015164710.de95b5e4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Hi Avi,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> In file included from arch/x86/kvm/../../../virt/kvm/vtd.c:28:
> include/linux/intel-iommu.h:31:27: error: dma_remapping.h: No such file or directory
> drivers/pci/intr_remapping.c:7:25: error: intel-iommu.h: No such file or directory
>
>   

I merged -linus and pushed, so this should be fixed now.

> I applied the following patch (which will need some consideration).
>   

I arrived at the same patch (with a few unrelated additions).  Please 
generate file movement patches with -M, much easier to review.

-- 
error compiling committee.c: too many arguments to function
