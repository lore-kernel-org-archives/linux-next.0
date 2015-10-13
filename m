From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: randconfig build error with next-20151012, in drivers/bluetooth
Date: Tue, 13 Oct 2015 09:18:00 +0200
Message-ID: <98BA8F10-69E5-4933-B0F6-8988B1CB6C90@holtmann.org>
References: <CA+r1Zhjhu4LLHFtNK2=4bYO2tctd-QVt7ruWMCJMCQr85_2GMw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from senator.holtmann.net ([87.106.208.187]:58944 "EHLO
	mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751769AbbJMHSD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2015 03:18:03 -0400
In-Reply-To: <CA+r1Zhjhu4LLHFtNK2=4bYO2tctd-QVt7ruWMCJMCQr85_2GMw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "Gustavo F. Padovan" <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org

Hi Jim,

> Building with the attached random configuration file,
> 
> warning: (BT_HCIBPA10X) selects BT_HCIUART which has unmet direct
> dependencies (NET && BT && TTY)
> 
> ERROR: "tty_unthrottle" [drivers/bluetooth/hci_uart.ko] undefined!
> ERROR: "tty_termios_encode_baud_rate" [drivers/bluetooth/hci_uart.ko] undefined!
> ERROR: "tty_unregister_ldisc" [drivers/bluetooth/hci_uart.ko] undefined!
> ERROR: "tty_ldisc_flush" [drivers/bluetooth/hci_uart.ko] undefined!
> ERROR: "n_tty_ioctl_helper" [drivers/bluetooth/hci_uart.ko] undefined!
> ERROR: "tty_driver_flush_buffer" [drivers/bluetooth/hci_uart.ko] undefined!
> ERROR: "tty_register_ldisc" [drivers/bluetooth/hci_uart.ko] undefined!
> ERROR: "tty_set_termios" [drivers/bluetooth/hci_uart.ko] undefined!

thanks for the report. We already fixed it in bluetooth-next and it should be with that in linux-next as well.

Regards

Marcel
