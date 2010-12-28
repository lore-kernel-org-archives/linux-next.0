From: James Bottomley <James.Bottomley@suse.de>
Subject: Re: linux-next: Tree for December 28 (drivers/target/)
Date: Tue, 28 Dec 2010 10:39:14 -0600
Message-ID: <1293554355.2371.1.camel@fuzzy>
References: <20101228173049.217c192d.sfr@canb.auug.org.au>
	 <20101228082947.70b09534.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56908 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751706Ab0L1Qjb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Dec 2010 11:39:31 -0500
In-Reply-To: <20101228082947.70b09534.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, nab@kernel.org, scsi <linux-scsi@vger.kernel.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 2010-12-28 at 08:29 -0800, Randy Dunlap wrote:
> On Tue, 28 Dec 2010 17:30:49 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > [The mirroring on kernel.org is running slowly]
> > 
> > Changes since 20101227:
> 
> 
> warning: (TARGET_CORE && GFS2_FS) selects CONFIGFS_FS which has unmet direct dependencies (SYSFS)
> 
> from:
> 
> menuconfig TARGET_CORE
> 	tristate "Generic Target Core Mod (TCM) and ConfigFS Infrastructure"
> 	select CONFIGFS_FS
> 
> but CONFIGFS_FS depends on SYSFS, so TARGET_CORE should either depend on SYSFS
> or (eek) it should select SYSFS.

The latter, I think (and actually, configfs should select sysfs).  All
these unmet dependencies are a minefield.

James
