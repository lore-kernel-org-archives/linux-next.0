From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Tree for Nov 27 (mm stuff)
Date: Fri, 27 Nov 2015 18:10:47 +0900
Message-ID: <20151127091047.GA585@swordfish>
References: <20151127160514.7b2022f2@canb.auug.org.au>
 <56580097.8050405@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:36487 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751595AbbK0JJr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2015 04:09:47 -0500
Content-Disposition: inline
In-Reply-To: <56580097.8050405@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux MM <linux-mm@kvack.org>

On (11/26/15 23:04), Randy Dunlap wrote:
> 
> on i386:
> 
> mm/built-in.o: In function `page_referenced_one':
> rmap.c:(.text+0x362a2): undefined reference to `pmdp_clear_flush_young'
> mm/built-in.o: In function `page_idle_clear_pte_refs_one':
> page_idle.c:(.text+0x4b2b8): undefined reference to `pmdp_test_and_clear_young'
> 

Hello,

https://lkml.org/lkml/2015/11/24/160

corresponding patch mm-add-page_check_address_transhuge-helper-fix.patch added
to -mm tree.

	-ss
