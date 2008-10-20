From: Mike Rapoport <mike@compulab.co.il>
Subject: Re: linux-next: mtd tree build failure
Date: Mon, 20 Oct 2008 10:33:59 +0200
Message-ID: <48FC4277.2000405@compulab.co.il>
References: <20081020163518.b858f3f7.sfr@canb.auug.org.au> <1224487490.6770.1509.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oceanus.site5.com ([67.43.13.2]:35987 "EHLO oceanus.site5.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752260AbYJTKNY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 06:13:24 -0400
In-Reply-To: <1224487490.6770.1509.camel@macbook.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>



David Woodhouse wrote:
> On Mon, 2008-10-20 at 16:35 +1100, Stephen Rothwell wrote:
>> Caused by commit aaf7ea20000436df3cbb397ccb734ad1e2e5164d ("[MTD]
>> [NAND] GPIO NAND flash driver").  I assume this needs to depend on
>> some architecture/platform so I reverted it for now.
> 
> Hm, indeed. I thought it _did_ depend on ARM -- did I apply the wrong
> version of the patch?
> 

You applied the correct version of the patch. It did depend on ARM at the
beginning, but after discussion it was decided to make it generic so that other
architecture would be able to use it. I just haven't thought that readsw/writesw
might be not available on all architectures.


-- 
Sincerely yours,
Mike.
