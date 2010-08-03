From: Christoph Fritz <chf.fritz@googlemail.com>
Subject: Re: [BUG -next] in pcmcia: use struct resource for PCMCIA devices,
 part 2
Date: Tue, 03 Aug 2010 12:16:41 +0200
Message-ID: <1280830601.3034.0.camel@lovely.krouter>
References: <1280793201.11158.32.camel@lovely.krouter>
	 <20100803061257.GA9716@isilmar-3.linta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:64573 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755836Ab0HCKNl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Aug 2010 06:13:41 -0400
Received: by wyb39 with SMTP id 39so4206607wyb.19
        for <linux-next@vger.kernel.org>; Tue, 03 Aug 2010 03:13:40 -0700 (PDT)
In-Reply-To: <20100803061257.GA9716@isilmar-3.linta.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org

On Tue, 2010-08-03 at 08:12 +0200, Dominik Brodowski wrote:
> Hey,
> 
> On Tue, Aug 03, 2010 at 01:53:21AM +0200, Christoph Fritz wrote:
> > drivers/pcmcia/ds.c
> >   555         for (i = 0; i < (MAX_IO_WIN + MAX_WIN); i++) {                                                                             
> >   556             c->io[i].name = p_dev->devname;                                                                                        
> > 
> > with 'io' only defined to MAX_IO_WIN
> > 
> > drivers/pcmcia/cs_internal.h
> >   42     struct resource io[MAX_IO_WIN]; /* io ports */                                                                        
> 
> Yes, this is ugly (and will be fixed right now), but it isn't really a bug,
> for we want c->mem[i].name to be set too, and c->mem[] follows immediately
> c->io[] and is sufficientyly large.

ah I see ;-)

 thanks,
   chf
