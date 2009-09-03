From: Jan Glauber <jang@linux.vnet.ibm.com>
Subject: Re: linux-next / s390 crypto breakage
Date: Thu, 03 Sep 2009 15:52:22 +0000
Message-ID: <1251993142.7382.8.camel@bender>
References: <20090902113526.GC4754@osiris.boeblingen.de.ibm.com>
	 <1251914245.7382.6.camel@bender>
	 <20090902220447.GA17101@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate1.de.ibm.com ([195.212.17.161]:57586 "EHLO
	mtagate1.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753098AbZICNxF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Sep 2009 09:53:05 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate1.de.ibm.com (8.13.1/8.13.1) with ESMTP id n83Dr758000878
	for <linux-next@vger.kernel.org>; Thu, 3 Sep 2009 13:53:07 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id n83Dr7U32572490
	for <linux-next@vger.kernel.org>; Thu, 3 Sep 2009 15:53:07 +0200
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n83Dr7Mu032274
	for <linux-next@vger.kernel.org>; Thu, 3 Sep 2009 15:53:07 +0200
In-Reply-To: <20090902220447.GA17101@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>

On Thu, 2009-09-03 at 08:04 +1000, Herbert Xu wrote:
> On Wed, Sep 02, 2009 at 05:57:25PM +0000, Jan Glauber wrote:
> > That patch should fix the warnings.
> 
> Thanks, but where is the sign-off :)

Oops. I need a script for that...

Signed-off-by: Jan Glauber <jang@linux.vnet.ibm.com>
