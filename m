From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next 20080526 build failure with CONFIG_BLOCK=y and
 CONFIG_PROC_FS is not set
Date: Mon, 26 May 2008 09:22:24 -0700
Message-ID: <20080526092224.83555d09.randy.dunlap@oracle.com>
References: <1211794094.4408.3.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:64953 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753087AbYEZQKA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 May 2008 12:10:00 -0400
In-Reply-To: <1211794094.4408.3.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Philippe Roussel <p.o.roussel@free.fr>
Cc: linux-next@vger.kernel.org

On Mon, 26 May 2008 11:28:14 +0200 Philippe Roussel wrote:

> Hi,
> 
> I got this
> 
>   CC      block/genhd.o
> block/genhd.c: In function 'diskstats_start':
> block/genhd.c:555: error: 'find_start' undeclared (first use in this
> function)
> block/genhd.c:555: error: (Each undeclared identifier is reported only
> once
> block/genhd.c:555: error: for each function it appears in.)
> 
> while building the following config

I sent a patch for this last Friday:
  http://lkml.org/lkml/2008/5/23/255

---
~Randy
