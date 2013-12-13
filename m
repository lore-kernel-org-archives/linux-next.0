From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 13 (infiniband/hw/usnic)
Date: Fri, 13 Dec 2013 09:20:29 -0800
Message-ID: <52AB41DD.9040001@infradead.org>
References: <20131213161039.623d3caf832560b4aa81f4b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:48680 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752721Ab3LMRUc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Dec 2013 12:20:32 -0500
In-Reply-To: <20131213161039.623d3caf832560b4aa81f4b0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Upinder Malhi <umalhi@cisco.com>, linux-rdma@vger.kernel.org

On 12/12/13 21:10, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20131212:
> 

for linux-next of 2013-Dec-11,12,13:


drivers/infiniband/hw/usnic/usnic_uiom.c: In function 'usnic_uiom_put_pages':
drivers/infiniband/hw/usnic/usnic_uiom.c:91:4: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'dma_addr_t' [-Wformat]
drivers/infiniband/hw/usnic/usnic_uiom.c: In function 'usnic_uiom_get_pages':
drivers/infiniband/hw/usnic/usnic_uiom.c:170:5: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' [-Wformat]
drivers/infiniband/hw/usnic/usnic_uiom.c: In function 'usnic_uiom_map_sorted_intervals':
drivers/infiniband/hw/usnic/usnic_uiom.c:279:5: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
drivers/infiniband/hw/usnic/usnic_uiom.c:296:5: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
drivers/infiniband/hw/usnic/usnic_uiom.c: In function 'usnic_uiom_attach_dev_to_pd':
drivers/infiniband/hw/usnic/usnic_uiom.c:505:2: error: implicit declaration of function 'iommu_domain_has_cap' [-Werror=implicit-function-declaration]



-- 
~Randy
