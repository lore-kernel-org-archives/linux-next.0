From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: build warning after merge of the hid tree
Date: Tue, 3 Jul 2012 11:22:18 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1207031122011.17304@pobox.suse.cz>
References: <20120702121431.bf4119857a91068f395bcd21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120702121431.bf4119857a91068f395bcd21@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 2 Jul 2012, Stephen Rothwell wrote:

> Hi Jiri,
> 
> After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/hid/Kconfig:7:error: recursive dependency detected!
> drivers/hid/Kconfig:7:	symbol HID is selected by USB_HID
> drivers/hid/usbhid/Kconfig:4:	symbol USB_HID depends on HID

This is fixed in for-next branch I have just pushed. Thanks,

-- 
Jiri Kosina
SUSE Labs
