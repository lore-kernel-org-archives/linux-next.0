From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: linux-next: build failure after merge of the final tree (wireless
 tree related)
Date: Sat, 24 Dec 2011 03:29:35 +0200
Message-ID: <4EF52AFF.5040902@qca.qualcomm.com>
References: <20111222165849.df5ea3e2997375de24f1490b@canb.auug.org.au> <4EF3616D.5050506@suse.cz> <4EF4E9A8.7070102@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251]:50678 "EHLO
	wolverine02.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753400Ab1LXB3q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Dec 2011 20:29:46 -0500
In-Reply-To: <4EF4E9A8.7070102@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

On 12/23/2011 10:50 PM, Michal Marek wrote:
>> But I wonder why you need to link all the object files twice? Usually,
>> > drivers have a foo_common.ko and foo_{usb,pci,whatever}.ko that provide
>> > the pci/usb/whatever driver.
>
> Another option is to build both drivers in a single module. Or, as a
> band-aid, make the two drivers module-only, by adding 'depends on m' to
> their Kconfig entries.

I'll send the band-aid to John first and remove it once I have created
the ath6kl core module.

Thanks for the help.

Kalle
