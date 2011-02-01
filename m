From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: Tree for February 1 (sound/soc)
Date: Tue, 1 Feb 2011 22:27:47 +0000
Message-ID: <20110201222746.GD12101@opensource.wolfsonmicro.com>
References: <20110201153403.b3a251a3.sfr@canb.auug.org.au>
 <20110201093256.f5ff0252.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:54338 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751307Ab1BAW1a (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Feb 2011 17:27:30 -0500
Content-Disposition: inline
In-Reply-To: <20110201093256.f5ff0252.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Feb 01, 2011 at 09:32:56AM -0800, Randy Dunlap wrote:

> That function call is surrounded by CONFIG_PM but the function itself is
> surrounded by CONFIG_PM_SLEEP.

I really am going to finish off the changelog for removing CONFIG_PM
soon...
