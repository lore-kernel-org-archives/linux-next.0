From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for May 4 (staging/comedi)
Date: Mon, 4 May 2009 09:12:32 -0700
Message-ID: <20090504161232.GB11723@kroah.com>
References: <20090504170810.64cdceb4.sfr@canb.auug.org.au> <49FF0EEA.1010605@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:41713 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751631AbZEDQRI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 May 2009 12:17:08 -0400
Content-Disposition: inline
In-Reply-To: <49FF0EEA.1010605@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, May 04, 2009 at 08:51:06AM -0700, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090501:
> 
> 
> build-r4048.out:ERROR: "ni_tio_rinsn" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
> build-r4048.out:ERROR: "ni_tio_winsn" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
> build-r4048.out:ERROR: "ni_tio_insn_config" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
> build-r4048.out:ERROR: "ni_tio_init_counter" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
> build-r4048.out:ERROR: "ni_gpct_device_construct" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
> build-r4048.out:ERROR: "ni_gpct_device_destroy" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
> build-r4048.out:ERROR: "labpc_1200_is_unipolar" [drivers/staging/comedi/drivers/ni_labpc_cs.ko] undefined!
> build-r4048.out:ERROR: "labpc_1200_ai_gain_bits" [drivers/staging/comedi/drivers/ni_labpc_cs.ko] undefined!
> build-r4048.out:ERROR: "range_labpc_1200_ai" [drivers/staging/comedi/drivers/ni_labpc_cs.ko] undefined!
> build-r4048.out:ERROR: "labpc_common_detach" [drivers/staging/comedi/drivers/ni_labpc_cs.ko] undefined!
> build-r4048.out:ERROR: "labpc_common_attach" [drivers/staging/comedi/drivers/ni_labpc_cs.ko] undefined!
> build-r4048.out:ERROR: "das08_cs_boards" [drivers/staging/comedi/drivers/das08_cs.ko] undefined!
> build-r4048.out:ERROR: "das08_common_detach" [drivers/staging/comedi/drivers/das08_cs.ko] undefined!
> build-r4048.out:ERROR: "das08_common_attach" [drivers/staging/comedi/drivers/das08_cs.ko] undefined!
> 
> 
> config attached.

CONFIG_PCMCIA is allowed to be set without CONFIG_PCI?  That sounds like
the problem there (not to mention pretty much an impossible real-world
combination...)

thanks,

greg k-h
