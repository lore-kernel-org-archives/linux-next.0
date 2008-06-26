From: gshan <gshan@alcatel-lucent.com>
Subject: PCI device memory bars issue
Date: Thu, 26 Jun 2008 10:19:44 +0800
Message-ID: <4862FCC0.3050501@alcatel-lucent.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cnrelay03.alcatel-sbell.com.cn ([211.144.215.19]:56857 "EHLO
	mail.alcatel-sbell.com.cn" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752248AbYFZCTA (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 22:19:00 -0400
Received: from cnshgsbhs01.ad4.ad.alcatel.com (localhost [127.0.0.1])
	by mail.alcatel-sbell.com.cn (8.13.8/8.13.8/Alcanet1.0) with ESMTP id m5Q2HiGk004465
	for <linux-next@vger.kernel.org>; Thu, 26 Jun 2008 10:17:44 +0800
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

There has one MV64460 on my board, which contains 2 PCI buses: PCI0 and 
PCI1.
PCI0 contains a transparent bridge. A PCI device locates behind the 
transparent
bridge. The PCI device has 2 memory bars. When I read on memory bar0, it 
returns
correct data. However, 0xffffffff returns from memory bar1.

I dump config space of the PCI device and find everything seems ok.

PCI_VENDOR_ID:       0x000010ee
PCI_DEVICE_ID:       0x00000300
PCI_COMMAND:         0x00000086
PCI_STATUS:          0x00000a00
PCI_CLASS_REVISION:  0x0b400000
PCI_CACHE_LINE_SIZE: 0x0000ff00
PCI_BASE_ADDRESS_0:  0x80800008
PCI_SPACE_SIZE_0:    0xfffff008
PCI_BASE_ADDRESS_1:  0x80801008
PCI_SPACE_SIZE_1:    0xfffff008
PCI_BASE_ADDRESS_2:  0x00000000
PCI_SPACE_SIZE_2:    0x00000000
PCI_BASE_ADDRESS_3:  0x00000000
PCI_SPACE_SIZE_3:    0x00000000
PCI_BASE_ADDRESS_4:  0x00000000
PCI_SPACE_SIZE_4:    0x00000000
PCI_BASE_ADDRESS_5:  0x00000000
PCI_SPACE_SIZE_5:    0x00000000

Thanks in advance for any suggestions.
