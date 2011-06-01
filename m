From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: add slave-dma tree to linux-next
Date: Wed, 01 Jun 2011 09:31:11 -0700
Message-ID: <4DE6694F.1060803@intel.com>
References: <1306938694.10976.73.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:15807 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757584Ab1FAQbM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Jun 2011 12:31:12 -0400
In-Reply-To: <1306938694.10976.73.camel@vkoul-udesk3>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Koul, Vinod" <vinod.koul@intel.com>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 6/1/2011 7:31 AM, Koul, Vinod wrote:
> Hello Stephen,
>
> Since I am managing the below mentioned slave-dma tree, it would be
> great if you could add this to you linux-next.
>
> git://git.infradead.org/users/vkoul/slave-dma.git next
>

Note that this should be added before async_tx.git in the merge order as 
my ongoing work in dmaengine will be incremental to the slave-dma tree.

--
Dan
