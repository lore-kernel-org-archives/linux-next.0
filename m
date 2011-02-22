From: Anand Gadiyar <gadiyar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH -next] bluetooth: fix build break
Date: Tue, 22 Feb 2011 12:43:09 +0530
Message-ID: <1298358789-13202-1-git-send-email-gadiyar@ti.com>
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Anand Gadiyar <gadiyar-l0cyMroinI0@public.gmane.org>, "Gustavo F. Padovan" <padovan-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Linux-next as of 20110217 complains when building for OMAP1.

  LD      vmlinux
`hci_sock_cleanup' referenced in section `.init.text' of net/built-in.o: defined in discarded section `.exit.text' of net/built-in.o
`hci_sock_cleanup' referenced in section `.init.text' of net/built-in.o: defined in discarded section `.exit.text' of net/built-in.o
make: *** [vmlinux] Error 1

A recent patch by Gustavo (Bluetooth: Merge L2CAP and SCO modules
into bluetooth.ko) introduced this by calling the hci_sock_cleanup
function in the error path of bt_init.

Fix this by dropping the __exit marking for hci_sock_cleanup.

Signed-off-by: Anand Gadiyar <gadiyar-l0cyMroinI0@public.gmane.org>
Cc: Gustavo F. Padovan <padovan-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>
---
 net/bluetooth/hci_sock.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-omap-usb/net/bluetooth/hci_sock.c
===================================================================
--- linux-omap-usb.orig/net/bluetooth/hci_sock.c
+++ linux-omap-usb/net/bluetooth/hci_sock.c
@@ -861,7 +861,7 @@ error:
 	return err;
 }
 
-void __exit hci_sock_cleanup(void)
+void hci_sock_cleanup(void)
 {
 	if (bt_sock_unregister(BTPROTO_HCI) < 0)
 		BT_ERR("HCI socket unregistration failed");
