From: Daniel Hellstrom <daniel@gaisler.com>
Subject: Re: linux-next: build failure after merge of the final tree (sparc-current
 tree related)
Date: Fri, 03 Jun 2011 14:26:43 +0200
Message-ID: <4DE8D303.1080706@gaisler.com>
References: <20110603135347.a17e0b85.sfr@canb.auug.org.au>	<20110602.222051.270790327969020201.davem@davemloft.net>	<4DE8906F.5040501@gaisler.com> <20110603.011455.414200582548238157.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110603.011455.414200582548238157.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

David Miller wrote:

>From: Daniel Hellstrom <daniel@gaisler.com>
>Date: Fri, 03 Jun 2011 09:42:39 +0200
>
>  
>
>>missed that, PCIC_PCI should depend on SPARC32_PCI instead of PCI in
>>the following lines that were added by the patch
>>
>>+config PCIC_PCI
>>+	bool
>>+	depends on PCI && !SPARC_LEON
>>+	default y
>>+
>>    
>>
>
>The fixed I pushed out used PCI && SPARC32 && !SPARC_LEON
>  
>
Ok, the same thing, thanks.
