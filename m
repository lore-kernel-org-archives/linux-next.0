From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 19 (target)
Date: Thu, 19 Dec 2013 11:32:05 -0800
Message-ID: <52B349B5.6090200@infradead.org>
References: <20131219165106.73f28ea8aa1bd059423cb5f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34781 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754124Ab3LSTcH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Dec 2013 14:32:07 -0500
In-Reply-To: <20131219165106.73f28ea8aa1bd059423cb5f8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, target-devel <target-devel@vger.kernel.org>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>

On 12/18/13 21:51, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20131218:
> 


on i386:

drivers/built-in.o: In function `target_alua_state_check':
(.text+0x3fc859): undefined reference to `__udivdi3'




-- 
~Randy
