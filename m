From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 9/9] pcmcia: remove pcmcia_get_{first,next}_tuple()
Date: Wed, 28 Oct 2009 22:27:00 +0100
Message-ID: <20091028212700.GB31361@comet.dominikbrodowski.net>
References: <1255907255-28297-3-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-4-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-5-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-6-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-7-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-8-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-9-git-send-email-linux@dominikbrodowski.net> <20091026151958.a2e7871b.randy.dunlap@oracle.com> <20091027051224.GA10891@isilmar.linta.de> <20091027143923.GA17627@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:33505 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752622AbZJ1VcY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Oct 2009 17:32:24 -0400
Content-Disposition: inline
In-Reply-To: <20091027143923.GA17627@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, linux-pcmcia@lists.infradead.org

Greg,

On Tue, Oct 27, 2009 at 07:39:23AM -0700, Greg KH wrote:
> On Tue, Oct 27, 2009 at 06:12:24AM +0100, Dominik Brodowski wrote:
> > Randy,
> > 
> > On Mon, Oct 26, 2009 at 03:19:58PM -0700, Randy Dunlap wrote:
> > > > Remove the pcmcia_get_{first,next}_tuple() calls no longer needed by
> > > > (current) pcmcia device drivers.
> > > 
> > > linux-next 20091026:
> > > 
> > > drivers/staging/comedi/drivers/cb_das16_cs.c:155: error: implicit declaration of function 'pcmcia_get_first_tuple'
> > > drivers/staging/comedi/drivers/cb_das16_cs.c:156: error: implicit declaration of function 'pcmcia_get_tuple_data'
> > > drivers/staging/comedi/drivers/cb_das16_cs.c:883: error: implicit declaration of function 'pcmcia_get_next_tuple'
> > > 
> > > There are also other comedi/ drivers that this randconfig didn't attempt
> > > to build that are still using these same interfaces.
> > 
> > What are the current rules on drivers in staging/ ? Do they need to be
> > updated as well on API changes?
> 
> You don't have to do it, no.  I'll be glad to do so as long as I get a
> hint as to what needs to be done :)

These hints are in Documentation/pcmcia/driver-changes.txt . However, I'll
try to get some patches cooked up myself tonight for those drivers. Whom
shall I submit them to, or shall I just add them to the PCMCIA tree?

Best,
	Dominik
