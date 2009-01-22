From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 22 (staging/rtl8187se)
Date: Thu, 22 Jan 2009 09:18:55 -0800
Message-ID: <4978AA7F.5070306@oracle.com>
References: <20090122180543.1ab0baa6.sfr@canb.auug.org.au> <4978A975.60002@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:45897 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754378AbZAVRTO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Jan 2009 12:19:14 -0500
In-Reply-To: <4978A975.60002@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

Randy Dunlap wrote:
> Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20090121:
> 
> 
> drivers/staging/rtl8187se/r8180_core.c:5973: error: 'struct net_device' has no member named 'wireless_handlers'
> drivers/staging/rtl8187se/r8180_core.c:5982: error: 'struct net_device' has no member named 'wireless_handlers'
> 
> 

and
drivers/staging/rtl8187se/ieee80211/ieee80211_wx.c:845: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'
drivers/staging/rtl8187se/ieee80211/ieee80211_wx.c:852: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'

-- 
~Randy
