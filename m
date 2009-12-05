From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: PCI failure with virtual machine (new as of the past few days
 -next)
Date: Fri, 4 Dec 2009 16:35:19 -0800
Message-ID: <20091204163519.39212bf6@jbarnes-piketon>
References: <20091203171421.59f85d8b@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-139.bluehost.com ([67.222.39.29]:54876 "HELO
	outbound-mail-139.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1757546AbZLEAgB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Dec 2009 19:36:01 -0500
In-Reply-To: <20091203171421.59f85d8b@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-pci@vger.kernel.org, linux-next@vger.kernel.org

On Thu, 3 Dec 2009 17:14:21 +0000
Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:

> 
> 8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 2004)
> 8139cp 0000:00:03.0: PCI INT A -> Link[LNKC] -> GSI 11 (level, high)
> -> IRQ 11 8139cp 0000:00:03.0: PCI INT A disabled
> 8139cp: probe of 0000:00:03.0 failed with error -22
> 
> The PCI configuration looks like this (with an older working kernel)

I haven't applied anything to the PCI tree in the past few days (last
batch of commits was before my Thanksgiving break).  Maybe something
else in -next broke?  Have you tried my pci linux-next tree by itself?
It should be bisectable...

-- 
Jesse Barnes, Intel Open Source Technology Center
