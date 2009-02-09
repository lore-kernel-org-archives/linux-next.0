From: Steve Wise <swise@opengridcomputing.com>
Subject: Re: linux-next: Tree for February 9 (infiniband)
Date: Mon, 09 Feb 2009 11:00:08 -0600
Message-ID: <49906118.3060801@opengridcomputing.com>
References: <20090209193908.1a448944.sfr@canb.auug.org.au> <49905F93.300@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.opengridcomputing.com ([209.198.142.2]:35928 "EHLO
	smtp.opengridcomputing.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753885AbZBIQ7k (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Feb 2009 11:59:40 -0500
In-Reply-To: <49905F93.300@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, swise@chelsio.com, general@lists.openfabrics.org, Roland Dreier <rolandd@cisco.com>

Randy Dunlap wrote:
> Stephen Rothwell wrote:
>   
>> Hi all,
>>
>> [I accidentally deleted the merge and quilt-import logs today :-( - I
>> wonder if any would have noticed :-).  The merge summary still appears
>> below.]
>>
>> Changes since 20090206:
>>     
>
>
> allyesconfig build on i386 fails with:
>
> drivers/built-in.o: In function `iwch_sgl2pbl_map':
> /usr/builds/linux-next-20090209/drivers/infiniband/hw/cxgb3/iwch_qp.c:237: undefined reference to `__umoddi3'
> make: *** [.tmp_vmlinux1] Error 1
>
>
> or allmodconfig on i386 fails with:
>
> ERROR: "__umoddi3" [drivers/infiniband/hw/cxgb3/iw_cxgb3.ko] undefined!
>
>   

Somehow changing offset to a u64 must have caused this.  What is 
__umoddi3?  (it can't be good) :)

Steve
