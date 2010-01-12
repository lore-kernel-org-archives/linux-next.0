From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 12 (unlzo)
Date: Tue, 12 Jan 2010 08:30:13 -0800
Message-ID: <20100112083013.1dad8a8d.randy.dunlap@oracle.com>
References: <20100112171739.2011a0eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:42712 "EHLO
	rcsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754231Ab0ALQbZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2010 11:31:25 -0500
In-Reply-To: <20100112171739.2011a0eb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, albin.tonnerre@free-electrons.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 12 Jan 2010 17:17:39 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100109:



arch/x86/boot/compressed/../../../../lib/decompress_unlzo.c:53: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'parse_header'
arch/x86/boot/compressed/../../../../lib/decompress_unlzo.c:90: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'unlzo'

Problem is the "INIT" there, seems to be undefined.

---
~Randy
