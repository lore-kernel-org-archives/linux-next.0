From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 19 (mtd build error)
Date: Wed, 19 Nov 2008 11:45:52 -0800
Message-ID: <49246CF0.9010105@oracle.com>
References: <20081119175917.7d21cf77.sfr@canb.auug.org.au>	 <20081119105321.477e618a.randy.dunlap@oracle.com>	 <1227121104.27728.618.camel@macbook.infradead.org>	 <492463A1.3000306@oracle.com>  <1227122287.3052.7.camel@achroite>	 <1227122696.27728.625.camel@macbook.infradead.org> <1227123805.3052.10.camel@achroite>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:43454 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751761AbYKSTqH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 14:46:07 -0500
In-Reply-To: <1227123805.3052.10.camel@achroite>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Hutchings <bhutchings@solarflare.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-net-drivers@solarflare.com

Ben Hutchings wrote:
> On Wed, 2008-11-19 at 19:24 +0000, David Woodhouse wrote:
>> On Wed, 2008-11-19 at 19:18 +0000, Ben Hutchings wrote:
>>> So does the dependency need to be something like
>>> "depends on SFC && MTD && !(SFC=y && MTD=m)"?
>> If it's a separate driver, perhaps it's sufficient just to make it a
>> tristate and make it depend on SFC && MTD?
> 
> It's not a separate driver.

and it already depends on SFC && MTD.  Weird that it fails like this.

-- 
~Randy
