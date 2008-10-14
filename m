From: Greg KH <gregkh@suse.de>
Subject: Re: linux-next: manual merge of the hid tree
Date: Tue, 14 Oct 2008 06:54:07 -0700
Message-ID: <20081014135407.GA11470@suse.de>
References: <20081014175143.731c8280.sfr@canb.auug.org.au> <alpine.LRH.1.10.0810140911030.8381@twin.jikos.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns2.suse.de ([195.135.220.15]:54546 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751028AbYJNN50 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 09:57:26 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LRH.1.10.0810140911030.8381@twin.jikos.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, Oct 14, 2008 at 09:12:07AM +0200, Jiri Kosina wrote:
> On Tue, 14 Oct 2008, Stephen Rothwell wrote:
> 
> > Today's linux-next merge of the hid tree got a conflict in 
> > drivers/hid/hid-tmff.c between commits 
> > 454db62d208add27f30fcbcc00435768245407c9 ("USB: remove warn() macro from 
> > usb hid drivers") and 3e85ea87fdfbb9440dacda77b4de30472e0d38c9 ("USB: 
> > remove info() macro from usb HID drivers") from the usb tree 
> 
> Thanks Stephen for letting us know. These two patches should actually be 
> dropped from USB tree completely, I believe, as I have taken them through 
> my tree. Greg?

Yes, you are correct, I did not get the time to update my public tree
in the past few days due to other work :(

Should get to it today.

thanks,

greg k-h
