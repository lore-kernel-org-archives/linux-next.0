From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 9/9] pcmcia: remove pcmcia_get_{first,next}_tuple()
Date: Thu, 29 Oct 2009 12:05:30 -0700
Message-ID: <20091029190530.GA5159@kroah.com>
References: <1255907255-28297-5-git-send-email-linux@dominikbrodowski.net>
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
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:43028 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755498AbZJ2TFg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Oct 2009 15:05:36 -0400
Content-Disposition: inline
In-Reply-To: <20091029000250.GA27418@comet.dominikbrodowski.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>, Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, linux-pcmcia@lists.infradead.org

On Thu, Oct 29, 2009 at 01:02:50AM +0100, Dominik Brodowski wrote:
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

Looks good to me, feel free to add:
	Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
to it.

thanks,

greg k-h
