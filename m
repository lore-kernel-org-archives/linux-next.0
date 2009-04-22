From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Tue, 21 Apr 2009 18:12:45 -0700 (PDT)
Message-ID: <20090421.181245.173329460.davem@davemloft.net>
References: <20090422102906.7604dfb3.sfr@canb.auug.org.au>
	<20090422003759.GA12784@orion>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:53074
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752541AbZDVBMx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 21:12:53 -0400
In-Reply-To: <20090422003759.GA12784@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: a.beregalov@gmail.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, rmk@arm.linux.org.uk

From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Wed, 22 Apr 2009 04:37:59 +0400

> sa1100_ir: fix build breakage
> 
> Fix simple typo. Caused by commit
> a1de966682551debbe690672e760487cc555c05f
> ("irda/sa1100_ir: convert to net_device_ops").
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Applied.

This is the second build failure you introduced in the past
week Alexander, you need to be more careful.
