From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Tue, 19 Jun 2012 12:06:12 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1206191205190.15308@pobox.suse.cz>
References: <20120619112939.23c80aed8f1db9682e37be87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40477 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751180Ab2FSKGW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Jun 2012 06:06:22 -0400
In-Reply-To: <20120619112939.23c80aed8f1db9682e37be87@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

On Tue, 19 Jun 2012, Stephen Rothwell wrote:

> Hi Mauro,
> 
> Today's linux-next merge of the v4l-dvb tree got a conflict in
> drivers/hid/hid-ids.h between commit 9ed326951806 ("HID: multitouch: Add
> support for Baanto touchscreen") from Linus' tree and commit 110301833d6f
> ("[media] radio/si470x: Add support for the Axentia ALERT FM USB
> Receiver") from the v4l-dvb tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/hid/hid-ids.h
> index 6d3037e,70298d1..0000000
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@@ -160,9 -157,9 +160,12 @@@
>   #define USB_VENDOR_ID_AVERMEDIA		0x07ca
>   #define USB_DEVICE_ID_AVER_FM_MR800	0xb800
>   
> + #define USB_VENDOR_ID_AXENTIA		0x12cf
> + #define USB_DEVICE_ID_AXENTIA_FM_RADIO	0x7111
> + 
>  +#define USB_VENDOR_ID_BAANTO		0x2453
>  +#define USB_DEVICE_ID_BAANTO_MT_190W2	0x0100
>  +
>   #define USB_VENDOR_ID_BELKIN		0x050d
>   #define USB_DEVICE_ID_FLIP_KVM		0x3201

Thanks for reporting this, Stephen.

Hmmm ... Mauro, Hans, do you feel it's actually proper to add the device 
ids to hid-ids.h? I am using this file usually solely for the drivers on 
the HID bus, which radio-si470x is not, I believe.

-- 
Jiri Kosina
SUSE Labs
