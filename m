From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 15 (mm/khugepaged.c)
Date: Mon, 15 Aug 2016 08:33:55 -0700
Message-ID: <61b8f95c-652f-c083-80f8-cef587bd5ea6@infradead.org>
References: <20160815132648.575092f2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43472 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752590AbcHOPd7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Aug 2016 11:33:59 -0400
In-Reply-To: <20160815132648.575092f2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>

On 08/14/16 20:26, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160812:
> 

on i386:
when CONFIG_SYSFS is not enabled:

mm/built-in.o: In function `khugepaged_defrag_store':
khugepaged.c:(.text+0x47a37): undefined reference to `single_hugepage_flag_store'
mm/built-in.o: In function `khugepaged_defrag_show':
khugepaged.c:(.text+0x47a5e): undefined reference to `single_hugepage_flag_show'


-- 
~Randy
