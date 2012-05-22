From: John Crispin <blogic@openwrt.org>
Subject: Re: linux-next: manual merge of the trivial tree with the  tree
Date: Tue, 22 May 2012 13:53:43 +0200
Message-ID: <4FBB7E47.7060500@openwrt.org>
References: <20120522145432.aa4d97df7f08af54229f1338@canb.auug.org.au> <alpine.LNX.2.00.1205221115390.16396@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nbd.name ([46.4.11.11]:33780 "EHLO nbd.name"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750852Ab2EVLyO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 May 2012 07:54:14 -0400
In-Reply-To: <alpine.LNX.2.00.1205221115390.16396@pobox.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masanari Iida <standby24x7@gmail.com>, Ralf Baechle <ralf@linux-mips.org>

On 22/05/12 11:16, Jiri Kosina wrote:
> On Tue, 22 May 2012, Stephen Rothwell wrote:
>
>> Hi Jiri,
>>
>> Today's linux-next merge of the trivial tree got a conflict in
>> arch/mips/lantiq/xway/gpio_ebu.c arch/mips/lantiq/xway/gpio_stp.c between
>> commit 5238f7bc3566 ("GPIO: MIPS: lantiq: move gpio-stp and gpio-ebu to
>> the subsystem folder") from the  tree and commit 6997991ab0db ("mips: Fix
>> printk typos in arc/mips") from the trivial tree.
>>
>> The typos fixed in the latter probably need to be applied to the renamed
>> files drivers/gpio/gpio-mm-lantiq.c and drivers/gpio/gpio-stp-xway.c
>> (resp).
>>
>> I have removed the old versions.
> I will probably keep this trivial conflict for Linus to resolve. Thanks,
>

Hi,

I'll try to resolve this and have the MIPS/Lantiq specifc parts flow via
Ralfs tree if no one minds

Thanks,
John
