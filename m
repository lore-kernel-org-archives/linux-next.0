From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH 9/9] pcmcia: remove pcmcia_get_{first,next}_tuple()
Date: Thu, 29 Oct 2009 13:46:40 -0700
Message-ID: <20091029134640.5e728e30.randy.dunlap@oracle.com>
References: <1255907255-28297-4-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-5-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-6-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-7-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-8-git-send-email-linux@dominikbrodowski.net>
	<1255907255-28297-9-git-send-email-linux@dominikbrodowski.net>
	<20091026151958.a2e7871b.randy.dunlap@oracle.com>
	<20091027051224.GA10891@isilmar.linta.de>
	<20091027143923.GA17627@suse.de>
	<20091028212700.GB31361@comet.dominikbrodowski.net>
	<20091029000250.GA27418@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:28926 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755076AbZJ2Uw2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Oct 2009 16:52:28 -0400
In-Reply-To: <20091029000250.GA27418@comet.dominikbrodowski.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Greg KH <gregkh@suse.de>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, linux-pcmcia@lists.infradead.org

On Thu, 29 Oct 2009 01:02:50 +0100 Dominik Brodowski wrote:

> On Wed, Oct 28, 2009 at 10:27:00PM +0100, Dominik Brodowski wrote:
> > On Tue, Oct 27, 2009 at 07:39:23AM -0700, Greg KH wrote:
> > > On Tue, Oct 27, 2009 at 06:12:24AM +0100, Dominik Brodowski wrote:
> > > > Randy,
> > > > 
> > > > On Mon, Oct 26, 2009 at 03:19:58PM -0700, Randy Dunlap wrote:
> > > > > > Remove the pcmcia_get_{first,next}_tuple() calls no longer needed by
> > > > > > (current) pcmcia device drivers.
> > > > > 
> > > > > linux-next 20091026:
> > > > > 
> > > > > drivers/staging/comedi/drivers/cb_das16_cs.c:155: error: implicit declaration of function 'pcmcia_get_first_tuple'
> > > > > drivers/staging/comedi/drivers/cb_das16_cs.c:156: error: implicit declaration of function 'pcmcia_get_tuple_data'
> > > > > drivers/staging/comedi/drivers/cb_das16_cs.c:883: error: implicit declaration of function 'pcmcia_get_next_tuple'
> > > > > 
> > > > > There are also other comedi/ drivers that this randconfig didn't attempt
> > > > > to build that are still using these same interfaces.
> > > > 
> > > > What are the current rules on drivers in staging/ ? Do they need to be
> > > > updated as well on API changes?
> > > 
> > > You don't have to do it, no.  I'll be glad to do so as long as I get a
> > > hint as to what needs to be done :)
> > 
> > These hints are in Documentation/pcmcia/driver-changes.txt . However, I'll
> > try to get some patches cooked up myself tonight for those drivers. Whom
> > shall I submit them to, or shall I just add them to the PCMCIA tree?
> 
> Update all changes (already those not included in linux-next) which are in
> the queue for 2.6.33 for all comedi PCMCIA drivers. Compile-tested only, and
> I'll queue it up with the other PCMCIA patches.
> 

Thanks for the update.  What is the patch made against?
I cannot apply it cleanly to linux-next-2009102*.


> 
> From: Dominik Brodowski <linux@dominikbrodowski.net>
> Date: Thu, 29 Oct 2009 00:54:49 +0100
> Subject: [PATCH 1/1] pcmcia/staging: update comedi drivers
> 
> Update comedi PCMCIA drivers to work with recent PCMCIA changes documented
> in Documentation/pcmcia/driver-changes.txt:
> 
> - use pcmcia_config_loop()
> - don't use PCMCIA_DEBUG, but use dev_dbg()
> - don't use cs_error()
> - re-use prod_id and card_id values already stored
> 
> Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
> ---
>  drivers/staging/comedi/drivers/cb_das16_cs.c     |  220 +++++---------------
>  drivers/staging/comedi/drivers/das08_cs.c        |  202 +++++--------------
>  drivers/staging/comedi/drivers/ni_daq_700.c      |  236 +++++++---------------
>  drivers/staging/comedi/drivers/ni_daq_dio24.c    |  235 +++++++---------------
>  drivers/staging/comedi/drivers/ni_labpc_cs.c     |  224 +++++++--------------
>  drivers/staging/comedi/drivers/ni_mio_cs.c       |  127 +++---------
>  drivers/staging/comedi/drivers/quatech_daqp_cs.c |  215 +++++---------------
>  7 files changed, 424 insertions(+), 1035 deletions(-)


---
~Randy
