From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Sep 19
Date: Fri, 19 Sep 2014 17:18:45 -0700
Message-ID: <541CC7E5.3060505@roeck-us.net>
References: <20140919165817.225eb8b8@canb.auug.org.au>,<20140919211404.GA24856@roeck-us.net> <525DB349B3FB5444AE057A887CB2A8D88EF4BB@nice.asicdesigners.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47199 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758064AbaITASz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Sep 2014 20:18:55 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1XV8O6-001CqD-Uv
	for linux-next@vger.kernel.org; Sat, 20 Sep 2014 00:18:55 +0000
In-Reply-To: <525DB349B3FB5444AE057A887CB2A8D88EF4BB@nice.asicdesigners.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Anish Bhatt <anish@chelsio.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "rdunlap@infradead.org" <rdunlap@infradead.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, "James E.J. Bottomley" <JBottomley@parallels.com>

On 09/19/2014 02:42 PM, Anish Bhatt wrote:
> If you're just bisecting, you probably want my very first commit that started this :
> https://git.kernel.org/cgit/linux/kernel/git/davem/net.git/commit/?id=c99d667e852766afc755fa4430be64bb94e5ea1c
>
> Essentially, the bnx2 modules would silently disable ipv6 support if ipv6 was
> compiled as a module, but cnic was inbuilt. Then it turned out that the select
> on CNIC would override the tristate for CNIC, causing build failures.
>
> The fix for CNIC caused introduced recursive dependencies, requiring this :
> https://git.kernel.org/cgit/linux/kernel/git/davem/net.git/commit/?id=5d6be6a5d4864712832822efeb9c2d54e4063949
>
> which further required this :
> https://git.kernel.org/cgit/linux/kernel/git/davem/net.git/commit/?id=95cd6f488d164de462a8279e802a0ad05c33d167
>
> Turns out this was not enough either, requiring this fix :
> https://git.kernel.org/cgit/linux/kernel/git/davem/net.git/commit/?id=6a38792ca8a5da28f65dc42eeb73d9a431f8d0fd
>
> and so on and so forth. According to the last message, Randy might be
>   working on a proper fix for this :
> http://www.spinics.net/lists/linux-scsi/msg78416.html
>
> Most of this seems to be that the default configs do not select NET, but select SCSI_FC*
> which used to previously select NET on it's own (via SCSI_NET_LINK), maybe this
> is wrong too ?

Default configurations, as per "make savedefconfig", only record differences to the default.
There will be no "CONFIG_NET=y" in a defconfig if "select NET" configures it automatically.
This is per design to reduce the size of the configuration file. On the downside,
it means that a "simple" change such as "select NET" -> "depends NET" has far reaching
consequences.

Guenter
