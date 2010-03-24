From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 24 (staging/vt66*)
Date: Wed, 24 Mar 2010 12:44:08 -0700
Message-ID: <4BAA6B88.2080803@oracle.com>
References: <20100324161746.85edc5a3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:59392 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752562Ab0CXTqW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Mar 2010 15:46:22 -0400
In-Reply-To: <20100324161746.85edc5a3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org, Greg KH <gregkh@suse.de>, Forest Bond <forest@alittletooquiet.net>

On 03/23/10 22:17, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100323:



(.text+0x5d140): multiple definition of `hostap_set_hostapd'
(.text+0x5ccab): multiple definition of `hostap_ioctl'

when
CONFIG_HOSTAP=y
and
CONFIG_VT665[56]=y

or just both of the latter are =y.

-- 
~Randy
