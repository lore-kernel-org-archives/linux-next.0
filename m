From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 29 (btrfs)
Date: Fri, 29 Apr 2016 08:35:55 -0700
Message-ID: <57237F5B.7040709@infradead.org>
References: <20160429171354.3b98c8f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:48391 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752964AbcD2Pf6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2016 11:35:58 -0400
In-Reply-To: <20160429171354.3b98c8f3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org

On 04/29/16 00:13, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160428:
> 

on i386:

fs/built-in.o: In function `scrub_raid56_parity':
scrub.c:(.text+0x2d06fb): undefined reference to `__udivdi3'


-- 
~Randy
