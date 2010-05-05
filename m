From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for April 28 (logfs)
Date: Wed, 5 May 2010 09:20:20 -0700
Message-ID: <20100505092020.66a461fa.randy.dunlap@oracle.com>
References: <20100428164341.cee2911a.sfr@canb.auug.org.au>
	<20100428085604.0566092a.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:22118 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932922Ab0EEQUs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 May 2010 12:20:48 -0400
In-Reply-To: <20100428085604.0566092a.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Joern Engel <joern@logfs.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, logfs@logfs.org

On Wed, 28 Apr 2010 08:56:04 -0700 Randy Dunlap wrote:

> 
> When CONFIG_BLOCK is not enabled:
> 
> fs/logfs/super.c:142: error: implicit declaration of function 'bdev_get_queue'
> fs/logfs/super.c:142: error: invalid type argument of '->' (have 'int')


Still have this build error in linux-next-May 5-2010.

[and L:      logfs@logfs.org
is moderated for non-subscribers]

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
