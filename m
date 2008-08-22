From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 22 (hdlc/wanbook)
Date: Fri, 22 Aug 2008 15:20:59 -0700
Message-ID: <20080822152059.c83ea19a.randy.dunlap@oracle.com>
References: <20080822173415.6958cbcc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:37483 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754203AbYHVWUd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Aug 2008 18:20:33 -0400
In-Reply-To: <20080822173415.6958cbcc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Krzysztof Halasa <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Merging hdlc/hdlc-next


Hi Krzysztof,

wanbook.tmpl was removed!?!  why?
Is there some replacement for it or is it just not useful?

I seem to have missed the patch(es) that did this...

Anyway, "make htmldocs" now fails with:

head: cannot open `/local/linsrc/linux-next-20080822/Documentation/DocBook/wanbook.xml' for reading: No such file or directory
make[1]: *** [Documentation/DocBook/wanbook.html] Error 1



Looks like Documentation/DocBook/Makefile was missed in the patch.



---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
