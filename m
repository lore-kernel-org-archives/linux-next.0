From: Daniel Hellstrom <daniel@gaisler.com>
Subject: Re: linux-next: build failure after merge of the final tree (sparc-current
 tree related)
Date: Thu, 31 Mar 2011 15:46:27 +0200
Message-ID: <4D9485B3.5060306@gaisler.com>
References: <20110331130127.1d60ba11.sfr@canb.auug.org.au> <20110330.211044.212408233.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail176c2.megamailservers.com ([69.49.111.76]:51575 "EHLO
	mail176c2.megamailservers.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757995Ab1CaQi1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 31 Mar 2011 12:38:27 -0400
In-Reply-To: <20110330.211044.212408233.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

David Miller wrote:

>From: Stephen Rothwell <sfr@canb.auug.org.au>
>Date: Thu, 31 Mar 2011 13:01:27 +1100
>
>  
>
>>Hi all,
>>
>>After merging the final tree, today's linux-next build (powerpc
>>allyesconfig) failed like this:
>>
>>drivers/tty/serial/apbuart.c: In function 'apbuart_probe':
>>drivers/tty/serial/apbuart.c:568: error: 'struct pdev_archdata' has no member named 'irqs'
>>
>>Caused by commit 10544f128c33 ("sparc32, leon: APBUART driver must use
>>archdata to get IRQ number").
>>
>>I have reverted that commit for today (and commit c897dcf6311e
>>"sparc32,leon: Fixed APBUART frequency detection" that conflicts with the
>>revert).
>>    
>>
>
>Thanks, I'll make apbuart depend upon sparc to fix this.
>  
>
Thanks all.
