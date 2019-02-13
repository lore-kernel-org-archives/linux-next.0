From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: Tree for Feb 11 (wireless/80211)
Date: Wed, 13 Feb 2019 09:04:20 +0100
Message-ID: <6b0e066f05fa8c78a2e6850dbece388533a223d1.camel@sipsolutions.net>
References: <20190211183951.3fe1dad9@canb.auug.org.au>
         <80b32344-08c9-0d8b-fdae-1db9b1003f60@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <80b32344-08c9-0d8b-fdae-1db9b1003f60@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Thanks for the heads-up, Randy. We'd seen separate build bot reports on
this as well.

> ERROR: "__umoddi3" [net/wireless/cfg80211.ko] undefined!
> ERROR: "__umoddi3" [net/mac80211/mac80211.ko] undefined!

Should be fixed as of yesterday, let me know if it reappears.

johannes
