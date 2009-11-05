From: Kristoffer Glembo <kristoffer@gaisler.com>
Subject: Re: linux-next: sparc tree build failure
Date: Thu, 05 Nov 2009 15:44:32 +0100
Message-ID: <4AF2E4D0.2010006@gaisler.com>
References: <20091105185014.76dd0d31.sfr@canb.auug.org.au>	<20091104.235315.18303666.davem@davemloft.net> <20091105.000012.61292273.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail175c2.megamailservers.com ([69.49.111.75]:40548 "EHLO
	mail175c2.megamailservers.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758209AbZKES0l (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2009 13:26:41 -0500
In-Reply-To: <20091105.000012.61292273.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

David Miller wrote:
> 
> Hmm, it took a tiny bit more than that :-)  Here's what I commited
> to fix this, thanks.
> 
> apbuart: Kill dependency on deprecated Sparc-only PROM interfaces.
> 
> Use the proper modern OF ones instead.
> 
> Noticed by Stephen Rothwell.
> 
> Signed-off-by: David S. Miller <davem@davemloft.net>

Thanks guys. Sorry for the obsolete code :-)

Best regards,
Kristoffer
