From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for September 19 (kvm + intel_iommu)
Date: Fri, 19 Sep 2008 13:34:51 -0700
Message-ID: <20080919133451.ffcb1075.randy.dunlap@oracle.com>
References: <20080919143820.51d1a5d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:58338 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750880AbYISVqX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Sep 2008 17:46:23 -0400
In-Reply-To: <20080919143820.51d1a5d9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org, dwmw2@infradead.org

On Fri, 19 Sep 2008 14:38:20 +1000 Stephen Rothwell wrote:


kvm calls intel_iommu_found(), which won't exist if CONFIG_DMAR=n:

arch/x86/kvm/built-in.o: In function `kvm_dev_ioctl_check_extension':
(.text+0x5588): undefined reference to `intel_iommu_found'
make[1]: *** [.tmp_vmlinux1] Error 1


---
~Randy
