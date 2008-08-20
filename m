From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: CONFIG_KMOD breakage in next kernel
Date: Wed, 20 Aug 2008 19:16:57 +0200
Message-ID: <1219252617.7591.350.camel@violet.holtmann.net>
References: <s5h3akzwtki.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <s5h3akzwtki.wl%tiwai@suse.de>
Sender: netdev-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Johannes Berg <johannes@sipsolutions.net>, Rusty Russell <rusty@rustcorp.com.au>, LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, video4linux-list@redhat.com
List-Id: linux-next.vger.kernel.org

Hi guys,

> I found that CONFIG_KMOD was already removed in linux-next tree.
> This seems to result in many breakages.  For example, I cannot mount a
> FAT device automatically because of failure of automatic loading of
> nls modules.
> 
> My particular problem would be fixed by the patch below, but I found
> CONFIG_KMOD is still referred in many places.

I am happy to fix the net/bluetooth/ part, you someone has to put out a
guideline how this should be fixed.

Regards

Marcel


