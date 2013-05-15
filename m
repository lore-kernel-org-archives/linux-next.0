From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 15 (wireless/brcm)
Date: Wed, 15 May 2013 10:42:19 -0700
Message-ID: <5193C8FB.3070408@infradead.org>
References: <20130515132627.817585a3d9fb3a3e502eb586@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:38644 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759547Ab3EORnC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 May 2013 13:43:02 -0400
In-Reply-To: <20130515132627.817585a3d9fb3a3e502eb586@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, Brett Rudley <brudley@broadcom.com>, Arend van Spriel <arend@broadcom.com>

On 05/14/13 20:26, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130514:
> 

on x86_64:

drivers/built-in.o: In function `brcms_led_unregister':
(.text+0x136f0e): undefined reference to `led_classdev_unregister'
drivers/built-in.o: In function `brcms_led_register':
(.text+0x1370b5): undefined reference to `led_classdev_register'

when CONFIG_NEW_LEDS is not enabled.


-- 
~Randy
