From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: staging tree build failure
Date: Mon, 8 Dec 2008 07:08:32 -0800
Message-ID: <20081208150832.GB19711@kroah.com>
References: <20081208204303.3c99dfa4.sfr@canb.auug.org.au> <493CF83A.7020908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:42519 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752219AbYLHPRa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 10:17:30 -0500
Content-Disposition: inline
In-Reply-To: <493CF83A.7020908@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Mon, Dec 08, 2008 at 01:34:34PM +0300, Dmitry Baryshkov wrote:
> Stephen Rothwell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi Greg,
>> Today's linux-next build (x86_64 allmodconfig) failed like this:
>> drivers/staging/agnx/xmit.c: In function 'fill_agnx_hdr':
>> drivers/staging/agnx/xmit.c:629: error: 'struct <anonymous>' has no =
member=20
>> named 'retry_limit'
>> drivers/staging/agnx/xmit.c:630: error: 'struct <anonymous>' has no =
member=20
>> named 'retry_limit'
>> drivers/staging/agnx/xmit.c: In function 'txm_power_set':
>> drivers/staging/agnx/xmit.c:652: error: 'struct ieee80211_tx_info' h=
as no=20
>> member named 'tx_rate_idx'
>> drivers/staging/agnx/xmit.c:652: error: 'struct ieee80211_tx_info' h=
as no=20
>> member named 'tx_rate_idx'
>> drivers/staging/agnx/xmit.c:652: error: 'struct ieee80211_tx_info' h=
as no=20
>> member named 'tx_rate_idx'
>> drivers/staging/agnx/pci.c: In function 'agnx_config_interface':
>> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid_len'
>> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid'
>> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid_len'
>> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid_len'
>> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid'
>> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid_len'
>> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid_len'
>> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid'
>> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid_len'
>> drivers/staging/agnx/pci.c:329: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid'
>> drivers/staging/agnx/pci.c:329: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid_len'
>> drivers/staging/agnx/pci.c:330: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid_len'
>> drivers/staging/agnx/pci.c:331: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid'
>> drivers/staging/agnx/pci.c:331: error: 'struct ieee80211_if_conf' ha=
s no=20
>> member named 'ssid_len'
>> drivers/staging/agnx/pci.c: At top level:
>> drivers/staging/agnx/pci.c:432: warning: initialization from incompa=
tible=20
>> pointer type
>> drivers/staging/altpciechdma/altpciechdma.c: In function=20
>> 'ape_sg_to_chdma_table':
>> drivers/staging/altpciechdma/altpciechdma.c:430: warning: format '%0=
8x'=20
>> expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
>> drivers/staging/altpciechdma/altpciechdma.c:434: warning: format '%0=
8x'=20
>> expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
>> drivers/staging/altpciechdma/altpciechdma.c:450: warning: format '%0=
8x'=20
>> expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
>> drivers/staging/altpciechdma/altpciechdma.c:451: warning: format '%0=
8x'=20
>> expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
>> drivers/staging/altpciechdma/altpciechdma.c: In function 'dma_test':
>> drivers/staging/altpciechdma/altpciechdma.c:548: warning: assignment=
 makes=20
>> integer from pointer without a cast
>> drivers/staging/altpciechdma/altpciechdma.c: In function 'probe':
>> drivers/staging/altpciechdma/altpciechdma.c:931: warning: label 'err=
_rev'=20
>> defined but not used
>> drivers/staging/altpciechdma/altpciechdma.c:914: warning: label 'err=
_cdev'=20
>> defined but not used
>> drivers/staging/altpciechdma/altpciechdma.c: At top level:
>> drivers/staging/altpciechdma/altpciechdma.c:416: warning:=20
>> 'ape_sg_to_chdma_table' defined but not used
>> Commit "STAGING: Move staging drivers back to staging-specific menu"
>> allowed them to build in the allmodconfig again.  I have dropped the
>> staging tree for today.
>
> Damn. And w/o that commit staging drivers pollute the main drivers me=
nu.

Very wierd.  Dmitry, care to look into this today?

thanks,

greg k-h
