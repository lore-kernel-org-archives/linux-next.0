From: Daniel Hellstrom <daniel@gaisler.com>
Subject: Re: linux-next: build failure after merge of the final tree (sparc-current
 tree related)
Date: Fri, 03 Jun 2011 09:42:39 +0200
Message-ID: <4DE8906F.5040501@gaisler.com>
References: <20110603135347.a17e0b85.sfr@canb.auug.org.au> <20110602.222051.270790327969020201.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail168c2.megamailservers.com ([69.49.111.68]:49833 "EHLO
	mail168c2.megamailservers.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752637Ab1FCHmz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jun 2011 03:42:55 -0400
In-Reply-To: <20110602.222051.270790327969020201.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

David Miller wrote:

>From: Stephen Rothwell <sfr@canb.auug.org.au>
>Date: Fri, 3 Jun 2011 13:53:47 +1000
>
>  
>
>>Caused by commit cfe3af5dde34 ("sparc32: added CONFIG_PCIC_PCI Kconfig
>>setting") from the sparc-current tree.
>>
>>I have reverted that commit (and the 2 following commits that depend on
>>it) for today.
>>    
>>
>
>Oops, that needs a sparc32 depencency.  I'll fix that, thanks!
>  
>
missed that, PCIC_PCI should depend on SPARC32_PCI instead of PCI in the 
following lines that were added by the patch

+config PCIC_PCI
+	bool
+	depends on PCI && !SPARC_LEON
+	default y
+
