From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 14 (lustre)
Date: Thu, 14 Nov 2013 11:04:28 -0800
Message-ID: <52851EBC.9010803@infradead.org>
References: <20131114152253.105a4978427b3cd0555ee877@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34790 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755260Ab3KNTE4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2013 14:04:56 -0500
In-Reply-To: <20131114152253.105a4978427b3cd0555ee877@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, peng tao <bergwolf@gmail.com>, Peng Tao <tao.peng@emc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, andreas.dilger@intel.com, hpdd-discuss <hpdd-discuss@ml01.01.org>

On 11/13/13 20:22, Stephen Rothwell wrote:
> Hi all,
> 
> Please do *not* add any v3.14 material to linux-next until after
> v3.13-rc1 is released.
> 
> Changes since 20131113:
> 

Please fix MANY build errors that show up when CONFIG_PROC_FS is not enabled.

thanks.
-- 
~Randy
