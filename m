From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the hid tree
Date: Tue, 26 Aug 2008 10:50:10 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0808261049170.3260@jikos.suse.cz>
References: <20080825142631.3171068e.sfr@canb.auug.org.au> <20080825044956.GA3959@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:40996 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753094AbYHZIuM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Aug 2008 04:50:12 -0400
In-Reply-To: <20080825044956.GA3959@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Sun, 24 Aug 2008, Greg KH wrote:

> > Today's linux-next merge of the hid tree got a conflict in
> > drivers/hid/usbhid/hid-core.c between commit
> > 42c057049eb3ca9bad38fb0acc6290771a11d9ff ("USB: remove warn() macro from
> > usb.h") from the usb tree and commit
> > 128fc1f24bbb042b8d586dfba4db9ee7caac52bd ("HID: indent switches/cases")
> > from the hid tree.
> > I did the obvious fixups (see below).
> > Jiri, you should be able to apply the appropriate part of Greg's patch to
> > your tree as it only depends on stuff that is already in Linus' tree.  I
> > have added that partial patch below. (Greg, do you want to Sign-off on
> > that, please?)  (I don't mind if the patch is in both trees - Greg you
> > might consider breaking up those warn() and info() (and err()?) removal
> > patches and sending them to the appropriate maintainers.)
> They are going to get split up and sent to them later this week.

So if Stephen is able to carry the fixup patch in -next tree until you 
send out the split-up patches to maintainers, I'll wait for that to 
happen, if OK with Stephen. Thanks.

-- 
Jiri Kosina
SUSE Labs
