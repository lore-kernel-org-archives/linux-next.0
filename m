From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: build warning after merge of the final tree
Date: Fri, 19 Apr 2013 11:44:35 +0200
Message-ID: <20130419094434.GC17148@8bytes.org>
References: <20130419180724.a0fecca0869e712e48e430f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130419180724.a0fecca0869e712e48e430f2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 19, 2013 at 06:07:24PM +1000, Stephen Rothwell wrote:
> After merging the final tree, today's linux-next build (i386 defconfig)
> produced this warning:
> 
> In file included from arch/x86/kernel/early-quirks.c:21:0:
> arch/x86/include/asm/irq_remapping.h:87:58: warning: 'struct irq_chip' declared inside parameter list [enabled by default]
> arch/x86/include/asm/irq_remapping.h:87:58: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
> arch/x86/include/asm/irq_remapping.h:93:18: warning: 'struct irq_chip' declared inside parameter list [enabled by default]
> 
> Probably caused by commit 03bbcb2e7e29 ("iommu/vt-d: add quirk for broken
> interrupt remapping on 55XX chipsets") from the iommu tree.

Thanks for the report, Stephen. I will queue a fix for that problem
asap.


	Joerg
