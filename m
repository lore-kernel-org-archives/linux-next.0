From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Oct 30 (include/xen/swiotlb-xen.h)
Date: Wed, 30 Oct 2013 11:44:51 -0700
Message-ID: <527153A3.5020404@infradead.org>
References: <20131030184511.c90aa7f40fec6b2e1652f394@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131030184511.c90aa7f40fec6b2e1652f394@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org
List-Id: linux-next.vger.kernel.org

On 10/30/13 00:45, Stephen Rothwell wrote:
> Hi all,
> 
> News:  I am now doing an arm multi_v7_defconfig build between each merge.
> 
> Changes since 20131029:
> 
> The arm defconfig build is fixed again.
> 
> The net-next tree gained a conflict against the net tree.
> 
> The xen-tip tree gained a conflict against the arm tree.
> 
> The akpm-current tree gained a conflict against the tip tree and a build
> failure for which I reverted 3 commits.
> 
> Various build problems from yesterday have been resolved.

on x86_64:

In file included from include/xen/swiotlb-xen.h:4:0,
                 from drivers/xen/grant-table.c:52:
include/linux/swiotlb.h:45:13: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:45:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/swiotlb.h:49:28: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:54:14: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:68:15: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:71:18: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:75:14: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:79:9: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:83:44: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:88:17: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:92:26: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:96:21: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:100:29: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/linux/swiotlb.h:104:24: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
In file included from drivers/xen/grant-table.c:52:0:
include/xen/swiotlb-xen.h:21:19: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/xen/swiotlb-xen.h:25:15: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/xen/swiotlb-xen.h:29:12: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/xen/swiotlb-xen.h:34:14: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/xen/swiotlb-xen.h:38:23: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/xen/swiotlb-xen.h:42:25: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/xen/swiotlb-xen.h:46:26: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]
include/xen/swiotlb-xen.h:50:28: warning: 'enum dma_data_direction' declared inside parameter list [enabled by default]



-- 
~Randy
