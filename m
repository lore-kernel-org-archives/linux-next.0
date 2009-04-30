From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build warnings
Date: Wed, 29 Apr 2009 17:54:13 -0700 (PDT)
Message-ID: <20090429.175413.81058049.davem@davemloft.net>
References: <20090429145921.5bb48c01.sfr@canb.auug.org.au>
	<20090428.230232.113827653.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:58698
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751465AbZD3AyT (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 20:54:19 -0400
In-Reply-To: <20090428.230232.113827653.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, a.beregalov@gmail.com

From: David Miller <davem@davemloft.net>
Date: Tue, 28 Apr 2009 23:02:32 -0700 (PDT)

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 29 Apr 2009 14:59:21 +1000
> 
>> Caused by commit 011983048a120e520147361be1067dd82343038e ("vxge: use max()
>> instead of VXGE_HW_SET_LEVEL").
> 
> Maybe that's why the macro was used in the first place :-)
> 
> We probably have to use something like max_t() here, and to me that's
> worse than the macro it is replacing.

Nobody is doing anything about this so I'm simply reverting.
