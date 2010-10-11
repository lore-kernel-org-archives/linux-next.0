From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 11 (regulator)
Date: Mon, 11 Oct 2010 09:31:47 -0700
Message-ID: <20101011093147.34062ccf.randy.dunlap@oracle.com>
References: <20101011162959.86e40961.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:62584 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755501Ab0JKQcE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2010 12:32:04 -0400
In-Reply-To: <20101011162959.86e40961.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 11 Oct 2010 16:29:59 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20101008:


When CONFIG_REGULATOR_DUMMY is not enabled:


linux-next-20101011/drivers/regulator/dummy.c:41: error: redefinition of 'regulator_dummy_init'
linux-next-20101011/drivers/regulator/dummy.h:28: note: previous definition of 'regulator_dummy_init' was here


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
