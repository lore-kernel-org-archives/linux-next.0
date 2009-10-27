From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 9/9] pcmcia: remove pcmcia_get_{first,next}_tuple()
Date: Tue, 27 Oct 2009 06:12:24 +0100
Message-ID: <20091027051224.GA10891@isilmar.linta.de>
References: <1255907255-28297-1-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-2-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-3-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-4-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-5-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-6-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-7-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-8-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-9-git-send-email-linux@dominikbrodowski.net> <20091026151958.a2e7871b.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:52284 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754585AbZJ0FMW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Oct 2009 01:12:22 -0400
Content-Disposition: inline
In-Reply-To: <20091026151958.a2e7871b.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: devel@driverdev.osuosl.org, linux-next@vger.kernel.org, linux-pcmcia@lists.infradead.org, gregkh@suse.de

Randy,

On Mon, Oct 26, 2009 at 03:19:58PM -0700, Randy Dunlap wrote:
> > Remove the pcmcia_get_{first,next}_tuple() calls no longer needed by
> > (current) pcmcia device drivers.
> 
> linux-next 20091026:
> 
> drivers/staging/comedi/drivers/cb_das16_cs.c:155: error: implicit declaration of function 'pcmcia_get_first_tuple'
> drivers/staging/comedi/drivers/cb_das16_cs.c:156: error: implicit declaration of function 'pcmcia_get_tuple_data'
> drivers/staging/comedi/drivers/cb_das16_cs.c:883: error: implicit declaration of function 'pcmcia_get_next_tuple'
> 
> There are also other comedi/ drivers that this randconfig didn't attempt
> to build that are still using these same interfaces.

What are the current rules on drivers in staging/ ? Do they need to be
updated as well on API changes?

Thanks,
	Dominik
