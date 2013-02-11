From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 11 (intel_pstate.c)
Date: Mon, 11 Feb 2013 08:18:15 -0800
Message-ID: <511919C7.5080502@infradead.org>
References: <20130211184749.565d8e47788f8be8aec1591f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34522 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754987Ab3BKQRW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Feb 2013 11:17:22 -0500
In-Reply-To: <20130211184749.565d8e47788f8be8aec1591f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 02/10/13 23:47, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130208:
> 

on i386:

drivers/built-in.o: In function `intel_pstate_timer_func':
intel_pstate.c:(.text+0x4ce97e): undefined reference to `__udivdi3'
drivers/built-in.o: In function `intel_pstate_cpu_init':
intel_pstate.c:(.cpuinit.text+0x974): undefined reference to `__udivdi3'


-- 
~Randy
