From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 13 (virtio_console)
Date: Thu, 14 Feb 2013 10:45:08 -0800
Message-ID: <511D30B4.5020201@infradead.org>
References: <20130213193532.162080d7c0557a307ab451ac@canb.auug.org.au> <511BEC55.5090801@infradead.org> <87sj4zk3ai.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:41206 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758490Ab3BNSoY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Feb 2013 13:44:24 -0500
In-Reply-To: <87sj4zk3ai.fsf@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amit Shah <amit.shah@redhat.com>, virtualization@lists.linux-foundation.org

On 02/13/13 19:00, Rusty Russell wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> On 02/13/13 00:35, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20130212:
>>
>> on i386:
>>
>> drivers/built-in.o: In function `in_intr':
>> virtio_console.c:(.text+0x2dd31): undefined reference to `hvc_poll'
>> virtio_console.c:(.text+0x2dd41): undefined reference to `hvc_kick'
>> drivers/built-in.o: In function `resize_console':
>> virtio_console.c:(.text+0x2e26f): undefined reference to `__hvc_resize'
>> drivers/built-in.o: In function `unplug_port':
>> virtio_console.c:(.text+0x2e572): undefined reference to `hvc_remove'
>> drivers/built-in.o: In function `init_port_console':
>> (.text+0x2fe59): undefined reference to `hvc_alloc'
>> drivers/built-in.o: In function `virtio_cons_early_init':
>> (.init.text+0x16d1): undefined reference to `hvc_instantiate'
>>
>>
>> Full randconfig file is attached.
> 
> This looks like an impossible config.  CONFIG_VIRTIO_CONSOLE=y, but
> CONFIG_HVC_DRIVER isn't set.
> 
> From drivers/char/Kconfig:
> 
>         config VIRTIO_CONSOLE
>         	tristate "Virtio console"
>         	depends on VIRTIO
>         	select HVC_DRIVER
> 
> ???

OK.  It's probably yet another stinking problem with kvmtool and randconfig.
Running *config reports:

warning: (KVMTOOL_TEST_ENABLE && LGUEST_GUEST) selects VIRTIO_CONSOLE which has unmet direct dependencies (VIRTIO && TTY)


I'll look a bit more...

thanks,
-- 
~Randy
