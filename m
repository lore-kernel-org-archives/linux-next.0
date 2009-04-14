From: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [BUILD FAILURE 11/12] Next April 14 : PPC64 randconfig
	[drivers/spi/mpc52xx_psc_spi.c]
Date: Wed, 15 Apr 2009 01:27:24 +0400
Message-ID: <20090414212724.GA12371@oksana.dev.rtsoft.ru>
References: <1239733836.5344.83.camel@subratamodak.linux.ibm.com> <fa686aa40904141142s3717812ep293973fefce8853d@mail.gmail.com>
Reply-To: avorontsov@ru.mvista.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [213.79.90.228] ([213.79.90.228]:5823 "EHLO
	buildserver.ru.mvista.com" rhost-flags-FAIL-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751630AbZDNV1b (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 17:27:31 -0400
Content-Disposition: inline
In-Reply-To: <fa686aa40904141142s3717812ep293973fefce8853d@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: subrata@linux.vnet.ibm.com, sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, David Brownell <dbrownell@users.sourceforge.net>, Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, linux-next <linux-next@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Alexander Beregalov <a.beregalov@gmail.com>

On Tue, Apr 14, 2009 at 12:42:47PM -0600, Grant Likely wrote:
> Thanks Subrata.  I'll look into this.

Whoops. That's my fault, I didn't expect that anyone other
than spi_mpc83xx is using fsl_spi_platform_data. :-/

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
