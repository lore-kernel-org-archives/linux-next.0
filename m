From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 28 (mm/khugepaged.c)
Date: Wed, 28 Sep 2016 09:42:40 -0700
Message-ID: <88dcf0bd-90f6-ed22-ddd8-f5e237bedcd6@infradead.org>
References: <20160928165618.56208c39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58166 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933528AbcI1Qmn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2016 12:42:43 -0400
In-Reply-To: <20160928165618.56208c39@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linux MM <linux-mm@kvack.org>

On 09/27/16 23:56, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160927:
> 


on i386, when SYSFS is not enabled (and PROC_FS is not enabled):

mm/built-in.o: In function `khugepaged_defrag_store':
khugepaged.c:(.text+0x58cb7): undefined reference to `single_hugepage_flag_store'
mm/built-in.o: In function `khugepaged_defrag_show':
khugepaged.c:(.text+0x58cc8): undefined reference to `single_hugepage_flag_show'


-- 
~Randy
