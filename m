From: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [patch -next] usb, gadget: use appropriate warning accessors
Date: Sun, 7 Apr 2013 14:11:47 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1304071407520.3441@chino.kir.corp.google.com>
References: <20130404182232.bd2dbfba27620bdab9e0de42@canb.auug.org.au> <515DCB78.3010207@infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <515DCB78.3010207-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Use the appropriate WARN() and WARN_ON() accessors to avoid a build error 
when CONFIG_BUG=n:

	drivers/usb/gadget/configfs.c: In function 'config_usb_cfg_unlink':
	drivers/usb/gadget/configfs.c:442:2: error: implicit declaration of function '__WARN_printf'
	drivers/usb/gadget/configfs.c: In function 'configfs_do_nothing':
	drivers/usb/gadget/configfs.c:733:2: error: implicit declaration of function '__WARN'

Reported-by: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Signed-off-by: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/gadget/configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -439,7 +439,7 @@ static int config_usb_cfg_unlink(
 		}
 	}
 	mutex_unlock(&gi->lock);
-	__WARN_printf("Unable to locate function to unbind\n");
+	WARN(1, "Unable to locate function to unbind\n");
 	return 0;
 }
 
@@ -730,7 +730,7 @@ USB_CONFIG_STRINGS_LANG(gadget_strings, gadget_info);
 
 static int configfs_do_nothing(struct usb_composite_dev *cdev)
 {
-	__WARN();
+	WARN_ON(1);
 	return -EINVAL;
 }
 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
