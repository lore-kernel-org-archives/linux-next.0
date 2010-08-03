From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [BUG -next] in pcmcia: use struct resource for PCMCIA devices,
	part 2
Date: Tue, 3 Aug 2010 08:12:57 +0200
Message-ID: <20100803061257.GA9716@isilmar-3.linta.de>
References: <1280793201.11158.32.camel@lovely.krouter>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar-3.linta.de ([188.40.101.200]:50027 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755163Ab0HCGNA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Aug 2010 02:13:00 -0400
Content-Disposition: inline
In-Reply-To: <1280793201.11158.32.camel@lovely.krouter>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Fritz <chf.fritz@googlemail.com>
Cc: linux-next@vger.kernel.org

Hey,

On Tue, Aug 03, 2010 at 01:53:21AM +0200, Christoph Fritz wrote:
> drivers/pcmcia/ds.c
>   555         for (i = 0; i < (MAX_IO_WIN + MAX_WIN); i++) {                                                                             
>   556             c->io[i].name = p_dev->devname;                                                                                        
> 
> with 'io' only defined to MAX_IO_WIN
> 
> drivers/pcmcia/cs_internal.h
>   42     struct resource io[MAX_IO_WIN]; /* io ports */                                                                        

Yes, this is ugly (and will be fixed right now), but it isn't really a bug,
for we want c->mem[i].name to be set too, and c->mem[] follows immediately
c->io[] and is sufficientyly large.

Best,
	Dominik
