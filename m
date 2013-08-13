From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 13 (xfs)
Date: Tue, 13 Aug 2013 09:59:51 -0700
Message-ID: <520A6607.7060002@infradead.org>
References: <20130813182832.16d18ef3dbc267c1a229bcd6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:60004 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754645Ab3HMQ74 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Aug 2013 12:59:56 -0400
In-Reply-To: <20130813182832.16d18ef3dbc267c1a229bcd6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

On 08/13/13 01:28, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130812:
> 

on i386:

fs/built-in.o: In function `xfs_log_calc_minimum_size':
(.text+0x1797a9): undefined reference to `__udivdi3'


-- 
~Randy
