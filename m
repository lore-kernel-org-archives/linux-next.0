From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: manual merge of the kbuild tree with the kernel-doc
 tree
Date: Wed, 26 May 2010 17:00:11 -0700
Message-ID: <4BFDB60B.50106@oracle.com>
References: <20100526115346.da5a02aa.sfr@canb.auug.org.au>	<4BFD42A6.6060206@oracle.com>	<20100527025020.da0c1bb7.sfr@canb.auug.org.au>	<20100526095606.beed820e.randy.dunlap@oracle.com> <20100527090923.c17a7ed4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:24263 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428Ab0E0Ag6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 May 2010 20:36:58 -0400
In-Reply-To: <20100527090923.c17a7ed4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, matt mooney <mfm@muteddisk.com>, Kirill Smelkov <kirr@mns.spb.ru>

On 05/26/10 16:09, Stephen Rothwell wrote:
> Hi Randy,
> 
> On Wed, 26 May 2010 09:56:06 -0700 Randy Dunlap <randy.dunlap@oracle.com> wrote:
>>
>>> The kernel-doc tree is a quilt series :-(
>>
>> Yes.  and it's viewable without pulling/cloning.  ;)
> 
> Ah, I shouldn't reply to emails so late at night :-(
> 
>>> You can, of course, see the above commit in the linux-next tree via
>>> gitweb on kernel.org.
>>
>> Thanks.  Michal, I droppped these 3 patches.  Please keep them in the
>> kbuild tree.
> 
> If anything, the kernel-doc patches should be kept as they are much more
> extensive.  And the conflict was trivial.  The kbuild patch was just
> fixing a typo (tey -> they).

uh oh.  OK, thanks, I'll restore them.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
