From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: manual merge of the kbuild tree with the kernel-doc
 tree
Date: Wed, 26 May 2010 08:47:50 -0700
Message-ID: <4BFD42A6.6060206@oracle.com>
References: <20100526115346.da5a02aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:38635 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752208Ab0EZPtB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 May 2010 11:49:01 -0400
In-Reply-To: <20100526115346.da5a02aa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, matt mooney <mfm@muteddisk.com>, Kirill Smelkov <kirr@mns.spb.ru>

On 05/25/10 18:53, Stephen Rothwell wrote:
> Hi Michal,
> 
> Today's linux-next merge of the kbuild tree got a conflict in
> Documentation/kbuild/makefiles.txt between commit
> 74bb7003010ff0998e280a6ade09381168ff20ec
> ("docs-kbuild-make-examples-content2") from the kernel-doc tree and
> commit e8d400a933fa44e2fba3849b084e1ae5814d7fca ("kbuild: fix a couple of
> typos in Documentation") from the kbuild tree.
> 
> The former also fixed the typo, so I used that.


If Michal has merged it, I'll drop it.

Michal, can I view your tree by using gitweb?  (i.e., http)
or is it only accessible by pulling/cloning?

thanks,
-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
