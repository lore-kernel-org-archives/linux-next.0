From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for September 15 (bkl-related)
Date: Wed, 15 Sep 2010 18:34:02 +0200
Message-ID: <201009151834.02624.arnd@arndb.de>
References: <20100915142954.6a36f52d.sfr@canb.auug.org.au> <20100915085910.a137904f.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:62375 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751778Ab0IOQeL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Sep 2010 12:34:11 -0400
In-Reply-To: <20100915085910.a137904f.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wednesday 15 September 2010, Randy Dunlap wrote:
> (1)
> drivers/pnp/isapnp/proc.c:50: error: expected '}' before 'else'
> 
> (2) when CONFIG_SCSI_PROC_FS is not enabled:
> drivers/scsi/sg.c:233: error: 'sg_mutex' undeclared (first use in this function)
> drivers/scsi/sg.c:1096: error: 'sg_mutex' undeclared (first use in this function)

Good catch, I'll fix these tonight.

Thanks,

	Arnd
