From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the hid tree
Date: Tue, 14 Oct 2008 09:12:07 +0200 (CEST)
Message-ID: <alpine.LRH.1.10.0810140911030.8381@twin.jikos.cz>
References: <20081014175143.731c8280.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from twin.jikos.cz ([213.151.79.26]:55978 "EHLO twin.jikos.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751471AbYJNHM0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 03:12:26 -0400
In-Reply-To: <20081014175143.731c8280.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-next@vger.kernel.org

On Tue, 14 Oct 2008, Stephen Rothwell wrote:

> Today's linux-next merge of the hid tree got a conflict in 
> drivers/hid/hid-tmff.c between commits 
> 454db62d208add27f30fcbcc00435768245407c9 ("USB: remove warn() macro from 
> usb hid drivers") and 3e85ea87fdfbb9440dacda77b4de30472e0d38c9 ("USB: 
> remove info() macro from usb HID drivers") from the usb tree 

Thanks Stephen for letting us know. These two patches should actually be 
dropped from USB tree completely, I believe, as I have taken them through 
my tree. Greg?

Thanks,

-- 
Jiri Kosina
SUSE Labs
