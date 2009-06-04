From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 4 (staging)
Date: Thu, 04 Jun 2009 08:56:40 -0700
Message-ID: <4A27EEB8.6030408@oracle.com>
References: <20090604175657.1565ecba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:24356 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755063AbZFDPxg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2009 11:53:36 -0400
In-Reply-To: <20090604175657.1565ecba.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090603:

drivers/staging/vt6655/built-in.o: In function `rotr1':
(.text+0x1a883): multiple definition of `rotr1'
drivers/staging/rt2860/built-in.o:(.text+0x17a9a): first defined here
drivers/staging/vt6655/built-in.o: In function `tkip_sbox':
(.text+0x1a850): multiple definition of `tkip_sbox'
drivers/staging/rt2860/built-in.o:(.text+0x17a6b): first defined here
drivers/staging/vt6655/built-in.o: In function `xor_32':
(.text+0x1e938): multiple definition of `xor_32'
drivers/staging/rt2860/built-in.o:(.text+0x1803c): first defined here
drivers/staging/vt6655/built-in.o: In function `xor_128':
(.text+0x1e910): multiple definition of `xor_128'
drivers/staging/rt2860/built-in.o:(.text+0x18018): first defined here


-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
