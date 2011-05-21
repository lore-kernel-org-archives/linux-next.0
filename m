From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: [PATCH -next] regulator: fix 88pm8607.c printk format warning
Date: Sat, 21 May 2011 12:51:03 +0100
Message-ID: <1305978663.3317.7.camel@odin>
References: <20110518145412.f6cba4ef.sfr@canb.auug.org.au>
	 <20110518100722.76bd6fb6.randy.dunlap@oracle.com>
	 <20110518194311.GB5077@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:33174 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755244Ab1EULvI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 21 May 2011 07:51:08 -0400
In-Reply-To: <20110518194311.GB5077@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Haojian Zhuang <haojian.zhuang@marvell.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Wed, 2011-05-18 at 12:43 -0700, Mark Brown wrote:
> On Wed, May 18, 2011 at 10:07:22AM -0700, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Fix printk format warning (seen on x86_64) and change to unsigned
> > output format:
> > 
> > drivers/regulator/88pm8607.c:417: warning: format '%d' expects type 'int', but argument 3 has type 'resource_size_t'
> 
> Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

Samuel, this doesn't apply against regulator-next. Iirc, the patches
this is against went via mfd-next ? If, so any chance you could take
this ?

Thanks !

Liam  
