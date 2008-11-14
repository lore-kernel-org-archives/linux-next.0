From: "J.R. Mauro" <jrm8005@gmail.com>
Subject: Re: linux-next: Tree for November 14 (staging/agnx/)
Date: Fri, 14 Nov 2008 16:28:13 -0500
Message-ID: <3aaafc130811141328n61b3fe43wd838140ef350f219@mail.gmail.com>
References: <20081114184021.ed198f4b.sfr@canb.auug.org.au>
	 <20081114111517.c2d9b2f9.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.189]:3320 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753616AbYKNV2Q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Nov 2008 16:28:16 -0500
Received: by mu-out-0910.google.com with SMTP id g7so1546152muf.1
        for <linux-next@vger.kernel.org>; Fri, 14 Nov 2008 13:28:14 -0800 (PST)
In-Reply-To: <20081114111517.c2d9b2f9.randy.dunlap@oracle.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Nov 14, 2008 at 2:15 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> On Fri, 14 Nov 2008 18:40:21 +1100 Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20081113:
>>
>> New tree:
>>       staging
>
>
> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has no member named 'ssid_len'
> drivers/staging/agnx/pci.c:328: error: 'struct ieee80211_if_conf' has no member named 'ssid'
> drivers/staging/agnx/pci.c:328: error: 'struct ieee80211_if_conf' has no member named 'ssid_len'
> drivers/staging/agnx/pci.c:329: error: 'struct ieee80211_if_conf' has no member named 'ssid'
> drivers/staging/agnx/pci.c:329: error: 'struct ieee80211_if_conf' has no member named 'ssid_len'
> drivers/staging/agnx/pci.c:330: error: 'struct ieee80211_if_conf' has no member named 'ssid_len'
> drivers/staging/agnx/pci.c:331: error: 'struct ieee80211_if_conf' has no member named 'ssid_len'
> drivers/staging/agnx/pci.c:331: error: 'struct ieee80211_if_conf' has no member named 'ssid_len'
> drivers/staging/agnx/pci.c:331: error: 'struct ieee80211_if_conf' has no member named 'ssid'
> drivers/staging/agnx/pci.c:331: error: 'struct ieee80211_if_conf' has no member named 'ssid

It looks like commit 41bb73eeac5ff5fb217257ba33b654747b3abf11 removed
these members from ieee80211_if_conf under the assumption that no
drivers used them.

>
> config attached.
>
> ---
> ~Randy
>
