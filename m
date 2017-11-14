From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the bluetooth tree
Date: Tue, 14 Nov 2017 11:56:33 +1100
Message-ID: <20171114115633.1f4db312@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34031 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751113AbdKNA4f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Nov 2017 19:56:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>

Hi all,

After merging the bluetooth tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/bluetooth/Kconfig:35:warning: multi-line strings not supported

Introduced by commit

  86be3c232877 ("Bluetooth: btusb: Add a Kconfig option to enable USB autosuspend by default")

There is a missing close double quote ...

-- 
Cheers,
Stephen Rothwell
