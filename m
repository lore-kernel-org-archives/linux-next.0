From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for September 1 (recordmcount.pl)
Date: Mon, 1 Sep 2008 11:25:49 -0700
Message-ID: <20080901112549.9849ab39.randy.dunlap@oracle.com>
References: <20080901191946.4c35ffc9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:14596 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751104AbYIAS0A (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Sep 2008 14:26:00 -0400
In-Reply-To: <20080901191946.4c35ffc9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 1 Sep 2008 19:19:46 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since next-20080829:

When using patch tarballs and applying that to kernel bases,
scripts/recordmcount.pl fails because it is not executable.
(Yes, I know, using the git would/should fix this.)

Is there any way to make (new) scripts executable when using
tarballs?

I'll handle it on a case-by-case basis for now.

Thanks,
---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
