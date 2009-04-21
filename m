From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree with the tree
Date: Tue, 21 Apr 2009 01:33:23 -0700 (PDT)
Message-ID: <20090421.013323.108882771.davem@davemloft.net>
References: <20090421110612.9cf9b6a6.sfr@canb.auug.org.au>
	<20090421012216.GA12324@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:41493
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750695AbZDUIdc (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 04:33:32 -0400
In-Reply-To: <20090421012216.GA12324@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: herbert@gondor.apana.org.au
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, bhutchings@solarflare.com

From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 21 Apr 2009 09:22:16 +0800

> On Tue, Apr 21, 2009 at 11:06:12AM +1000, Stephen Rothwell wrote:
>> Hi David,
>> 
>> Today's linux-next merge of the net tree got a conflict in net/core/dev.c
>> between commit 5db8765a86a4cbaf45adaf8c231cf9a6ca2dcfaf ("net: Fix GRO
>> for multiple page fragments") from the net-current tree and commit
>> 76620aafd66f0004829764940c5466144969cffc ("gro: New frags interface to
>> avoid copying shinfo") from the net tree.
>> 
>> I used the version from the net tree.
> 
> I think that's the right one.

I'm taking care of this merge conflict right now, thanks.
