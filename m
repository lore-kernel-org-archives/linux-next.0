From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build warning
Date: Tue, 09 Jun 2009 17:38:06 -0700 (PDT)
Message-ID: <20090609.173806.193714555.davem@davemloft.net>
References: <4A2E46A7.6020302@grandegger.com>
	<20090609.042625.194310688.davem@davemloft.net>
	<4A2E603E.3040603@grandegger.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:60260
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751456AbZFJAiF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 20:38:05 -0400
In-Reply-To: <4A2E603E.3040603@grandegger.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: wg@grandegger.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 09 Jun 2009 15:14:38 +0200

> David Miller wrote:
>> From: Wolfgang Grandegger <wg@grandegger.com>
>> Date: Tue, 09 Jun 2009 13:25:27 +0200
>> 
>>> [PATCH] can: sja1000_of_platform: fix build problems with printk format
>>>
>>> Variables of type size_t should be printed with the format "%zx".
>>>
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> 
>> It's not a "size_t", it's a "resource_size_t" which can be
>> "unsigned long long" on some platforms.
> 
> Right, but I assume that the %zx handles that type properly as well.

It absolutely does not.

resource_size_t is a arch specifically defined type that
could be anything, it does not conform to the definitions
of size_t.
