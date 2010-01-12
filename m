From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 12 (input)
Date: Tue, 12 Jan 2010 08:22:21 -0800
Message-ID: <20100112082221.8c3a4f95.randy.dunlap@oracle.com>
References: <20100112171739.2011a0eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:43027 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753637Ab0ALQXG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2010 11:23:06 -0500
In-Reply-To: <20100112171739.2011a0eb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org

On Tue, 12 Jan 2010 17:17:39 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100109:


drivers/input/input.c:841: warning: right shift count >= width of type

and when CONFIG_PROC_FS is disabled:

drivers/input/input.c:1171: error: implicit declaration of function 'input_bits_to_string'


---
~Randy
