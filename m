From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jul 3 (staging/unisys)
Date: Thu, 03 Jul 2014 08:32:12 -0700
Message-ID: <53B5777C.2050307@infradead.org>
References: <20140703155305.416bf8c7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56709 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754485AbaGCPcN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2014 11:32:13 -0400
In-Reply-To: <20140703155305.416bf8c7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Ben Romer <sparmaintainer@unisys.com>, Ken Cox <jkc@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 07/02/14 22:53, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20140702:
> 

on x86_64:

CONFIG_UNISYSSPAR=y
CONFIG_UNISYS_VISORUTIL=m
# CONFIG_UNISYS_VISORCHANNEL is not set
CONFIG_UNISYS_CHANNELSTUB=y

drivers/built-in.o: In function `channel_mod_init':
chanstub.c:(.init.text+0x10a8f): undefined reference to `unisys_spar_platform'


because CHANNELSTUB=y and VISORUTIL=m.



-- 
~Randy
