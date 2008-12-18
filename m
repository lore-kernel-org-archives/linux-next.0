From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: Tree for December 18 (slow-work)
Date: Thu, 18 Dec 2008 17:45:42 +0000
Message-ID: <6427.1229622342@redhat.com>
References: <20081218092145.7e1566ef.randy.dunlap@oracle.com> <20081218230637.c879a046.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:51409 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751041AbYLRRpx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Dec 2008 12:45:53 -0500
In-Reply-To: <20081218092145.7e1566ef.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Randy Dunlap <randy.dunlap@oracle.com> wrote:

> when CONFIG_SYSCTL=n:
> 
> build-r7380.out:/local/linsrc/linux-next-20081218/kernel/slow-work.c:612: error: 'slow_work_max_max_threads' undeclared (first use in this function)
> build-r7380.out:make[2]: *** [kernel/slow-work.o] Error 1

Bah.

David
