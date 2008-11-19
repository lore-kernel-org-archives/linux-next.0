From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: Tree for November 19 (mtd build error)
Date: Wed, 19 Nov 2008 19:24:56 +0000
Message-ID: <1227122696.27728.625.camel@macbook.infradead.org>
References: <20081119175917.7d21cf77.sfr@canb.auug.org.au>
	 <20081119105321.477e618a.randy.dunlap@oracle.com>
	 <1227121104.27728.618.camel@macbook.infradead.org>
	 <492463A1.3000306@oracle.com>  <1227122287.3052.7.camel@achroite>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:46550 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754553AbYKSTZE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 14:25:04 -0500
In-Reply-To: <1227122287.3052.7.camel@achroite>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Hutchings <bhutchings@solarflare.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-net-drivers@solarflare.com

On Wed, 2008-11-19 at 19:18 +0000, Ben Hutchings wrote:
> So does the dependency need to be something like
> "depends on SFC && MTD && !(SFC=y && MTD=m)"?

If it's a separate driver, perhaps it's sufficient just to make it a
tristate and make it depend on SFC && MTD?

-- 
dwmw2
