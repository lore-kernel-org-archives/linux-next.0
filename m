From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: linux-next: Tree for Apr 26 (nfc)
Date: Fri, 26 Apr 2013 10:59:40 -0700
Message-ID: <C716D09B-A010-4024-B115-9BDB834DE905@holtmann.org>
References: <20130426180357.7599d1b6b7965470905dcdf3@canb.auug.org.au> <517ABA92.304@infradead.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from senator.holtmann.net ([87.106.208.187]:59428 "EHLO
	mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756402Ab3DZR7i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Apr 2013 13:59:38 -0400
In-Reply-To: <517ABA92.304@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, linux-nfc@ml01.01.org

Hi Randy,

>> Hi all,
>> 
>> Changes since 20130424:
>> 
> 
> 
> on i386:
> 
> net/built-in.o: In function `nfc_unregister_device':
> (.text+0x6a36d): undefined reference to `rfkill_unregister'
> net/built-in.o: In function `nfc_unregister_device':
> (.text+0x6a378): undefined reference to `rfkill_destroy'
> net/built-in.o: In function `nfc_register_device':
> (.text+0x6a493): undefined reference to `rfkill_alloc'
> net/built-in.o: In function `nfc_register_device':
> (.text+0x6a4a4): undefined reference to `rfkill_register'
> net/built-in.o: In function `nfc_register_device':
> (.text+0x6a4b3): undefined reference to `rfkill_destroy'
> net/built-in.o: In function `nfc_dev_up':
> (.text+0x6a8e8): undefined reference to `rfkill_blocked'
> 
> 
> when CONFIG_RFKILL=m but NFC is builtin.
> 
> Full randconfig file is attached.

it is missing the depends RFKILL || !RFKILL here. I send a patch for it.

Regards

Marcel
