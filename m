From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 26 (mm/page_owner.c)
Date: Thu, 26 Nov 2015 08:05:05 -0800
Message-ID: <56572DB1.5070605@infradead.org>
References: <20151126161655.281096bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:53204 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751368AbbKZQFN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2015 11:05:13 -0500
In-Reply-To: <20151126161655.281096bb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linux MM <linux-mm@kvack.org>

On 11/25/15 21:16, Stephen Rothwell wrote:
> Hi all,
> 
> Reminder: there will be no linux-next release next week (Nov 30 - Dec 4).
> 
> Changes since 20151124:
> 

on i386:

mm/built-in.o: In function `read_page_owner':
page_owner.c:(.text+0x25d89): undefined reference to `migrate_reason_names'
mm/built-in.o: In function `__dump_page_owner':
(.text+0x26137): undefined reference to `migrate_reason_names'


when CONFIG_MIGRATION is not enabled.


-- 
~Randy
