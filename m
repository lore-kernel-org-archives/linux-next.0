From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [linux-next] rtlwifi commit contains a patch reject file
Date: Sat, 20 Apr 2019 11:50:09 -0400
Message-ID: <20190420155008.GM23044@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Larry Finger <Larry.Finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

I'm kind of surprised sfr doesn't have a bot to complain when it sees
a foo.c.rej or foo.c.orig in a commit...

Paul.
---

$ git show --stat ddab2eee794
commit ddab2eee7949f94b8ecdc5c84ae238826142d35d
Author: Larry Finger <Larry.Finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org>
Date:   Thu Apr 4 13:29:31 2019 -0500

    rtlwifi: Convert the wake_match variable to local
    
    In five of the drivers, the contents of bits 29-31 of one of the RX
    descriptors is used to set bits in a variable that is used to save the
    wakeup condition for output in a debugging statement. The resulting
    variable is not used anywhere else even though it is stored in a struct
    and could be available in other routines. This variable is changed to be
    local.
    
    Signed-off-by: Larry Finger <Larry.Finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org>
    Signed-off-by: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/trx.c     | 15 ++++++++-------
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/trx.c.rej | 10 ++++++++++
 drivers/net/wireless/realtek/rtlwifi/rtl8192ee/trx.c     | 13 +++++++------
 drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c     | 14 +++++++-------
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/trx.c     | 14 +++++++-------
 drivers/net/wireless/realtek/rtlwifi/wifi.h              |  1 -
 6 files changed, 39 insertions(+), 28 deletions(-)

 ---

$ git describe --contains ddab2eee794
next-20190415~86^2~1

$ git show next-20190415~86
commit e4aee692121581ee2b29812f0db701769ef3f571
Merge: 61405eeb69ab bdfc4027de15
Author: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Date:   Mon Apr 15 12:08:21 2019 +1000

    Merge remote-tracking branch 'wireless-drivers-next/master'
