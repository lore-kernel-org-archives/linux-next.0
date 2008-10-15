From: "Tony Luck" <tony.luck@intel.com>
Subject: Re: is the weeks before -rc1 the time to really be working on -next?
Date: Wed, 15 Oct 2008 16:53:51 -0700
Message-ID: <12c511ca0810151653p535d5ae4j297cf5b41900a4ba@mail.gmail.com>
References: <20081015145606.2af3baf1.akpm@linux-foundation.org>
	 <20081015233607.54c1d6b8@lxorguk.ukuu.org.uk>
	 <20081015155353.f15a996e.akpm@linux-foundation.org>
	 <20081015.160821.143702739.davem@davemloft.net>
	 <20081015164139.ebcd24c6.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.188]:43461 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753783AbYJOXxx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Oct 2008 19:53:53 -0400
Received: by nf-out-0910.google.com with SMTP id d3so1388414nfc.21
        for <linux-next@vger.kernel.org>; Wed, 15 Oct 2008 16:53:51 -0700 (PDT)
In-Reply-To: <20081015164139.ebcd24c6.akpm@linux-foundation.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Miller <davem@davemloft.net>, alan@lxorguk.ukuu.org.uk, greg@kroah.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

> Yes, but then people would end up being based on linux-next, and that's
> a pretty rubbery target with all the rebasing and trees getting
> dropped, etc.  And they'd accidentally end up having to actually
> compile and run linux-next, shock-horror-oh-the-humanity.

I built and booted linux-next a couple of times a week or so
for ia64.  Most of the time it worked just fine.  I found a few
build problems, but only three run-time problems. My boot
log shows 49 successful boots of linux-next based kernels
from 2.6.25-rc2 to 2.6.27-rc6

But perhaps less people are working on breaking ia64 :-)

-Tony
