From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: hid/upstream merge conflicts
Date: Wed, 4 Jun 2008 10:09:46 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806041008270.10085@jikos.suse.cz>
References: <20080604120831.80410876.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:46669 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750987AbYFDIJr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2008 04:09:47 -0400
In-Reply-To: <20080604120831.80410876.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Alexandre Karpenko <alexander@comm.utoronto.ca>, Andrew Morton <akpm@linux-foundation.org>

On Wed, 4 Jun 2008, Stephen Rothwell wrote:

> Today's linux-next merge of the hid tree got a conflict in 
> drivers/hid/usbhid/hid-quirks.c between commit 
> 6e7045990f35ef9250804b3fd85e855b8c2aaeb6 ("HID: split Numlock emulation 
> quirk from HID_QUIRK_APPLE_HAS_FN.") from Linus' tree and commit 
> 6560721d37b404f3c16ce3dfe7517386198fa13a ("HID: add fn key support on 
> Macbook Pro 4,1 and Macbook Air") from the hid tree.

Hi Stephen,

thanks for notification, I have rebased and this should be fixed now.

Thanks,

-- 
Jiri Kosina
SUSE Labs
