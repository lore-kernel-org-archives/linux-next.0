From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the bluetooth tree
Date: Tue, 26 Apr 2011 17:55:30 +1000
Message-ID: <20110426175530.d27179e2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52604 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756105Ab1DZHzh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2011 03:55:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiejing Zhang <kzjeef@gmail.com>, "Gustavo F. Padovan" <padovan@profusion.mobi>, Felipe Balbi <balbi@ti.com>

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in
drivers/bluetooth/hci_ldisc.c between commit 78b4a56c28c0 ("Bluetooth:
hci_uart: check the return value of recv()") from the bluetooth tree and
commit b1c43f82c5aa ("tty: make receive_buf() return the amout of bytes
received") from the tty tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/bluetooth/hci_ldisc.c
index 320f718,0d4da5e..0000000
--- a/drivers/bluetooth/hci_ldisc.c
+++ b/drivers/bluetooth/hci_ldisc.c
@@@ -357,21 -357,21 +357,22 @@@ static void hci_uart_tty_wakeup(struct 
   *     
   * Return Value:    None
   */
- static void hci_uart_tty_receive(struct tty_struct *tty, const u8 *data, char *flags, int count)
+ static unsigned int hci_uart_tty_receive(struct tty_struct *tty,
+ 		const u8 *data, char *flags, int count)
  {
- 	int ret;
  	struct hci_uart *hu = (void *)tty->disc_data;
+ 	int received;
  
  	if (!hu || tty != hu->tty)
- 		return;
+ 		return -ENODEV;
  
  	if (!test_bit(HCI_UART_PROTO_SET, &hu->flags))
- 		return;
+ 		return -EINVAL;
  
  	spin_lock(&hu->rx_lock);
- 	ret = hu->proto->recv(hu, (void *) data, count);
- 	if (ret > 0)
+ 	received = hu->proto->recv(hu, (void *) data, count);
 -	hu->hdev->stat.byte_rx += count;
++	if (received > 0)
 +		hu->hdev->stat.byte_rx += count;
  	spin_unlock(&hu->rx_lock);
  
  	tty_unthrottle(tty);
