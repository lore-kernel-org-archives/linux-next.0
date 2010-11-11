From: Tony Finch <dot@dotat.at>
Subject: Re: linux-next: Tree for November 11 (unifdef)
Date: Thu, 11 Nov 2010 18:26:06 +0000
Message-ID: <alpine.LSU.2.00.1011111820460.8553@hermes-2.csi.cam.ac.uk>
References: <20101111125655.15fa7188.sfr@canb.auug.org.au> <20101111094832.827aaab3.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ppsw-50.csi.cam.ac.uk ([131.111.8.150]:54993 "EHLO
	ppsw-50.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752618Ab0KKSov (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Nov 2010 13:44:51 -0500
In-Reply-To: <20101111094832.827aaab3.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tony Finch <dot@dotat.at>

On Thu, 11 Nov 2010, Randy Dunlap wrote:
>
> Is this a problem with privcmd.h or unifdef or ???

It's a problem with ???, specifically

scripts/headers_install.pl:33:    $line =~ s/([\s(])__user\s/$1/g;

There are a few other files which have the same idiom which potentially
breaks headers_install

drivers/staging/ath6kl/os/linux/include/ar6000_drv.h
drivers/video/sis/sis_main.c
drivers/video/via/ioctl.h

Tony.
-- 
f.anthony.n.finch  <dot@dotat.at>  http://dotat.at/
HUMBER THAMES DOVER WIGHT PORTLAND: NORTH BACKING WEST OR NORTHWEST, 5 TO 7,
DECREASING 4 OR 5, OCCASIONALLY 6 LATER IN HUMBER AND THAMES. MODERATE OR
ROUGH. RAIN THEN FAIR. GOOD.
