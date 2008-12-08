From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: Re: linux-next: staging tree build failure
Date: Mon, 08 Dec 2008 13:34:34 +0300
Message-ID: <493CF83A.7020908@gmail.com>
References: <20081208204303.3c99dfa4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1251;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.190]:22525 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751396AbYLHKfr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2008 05:35:47 -0500
Received: by nf-out-0910.google.com with SMTP id d3so502262nfc.21
        for <linux-next@vger.kernel.org>; Mon, 08 Dec 2008 02:35:45 -0800 (PST)
In-Reply-To: <20081208204303.3c99dfa4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

Stephen Rothwell =EF=E8=F8=E5=F2:
> Hi Greg,
>=20
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> drivers/staging/agnx/xmit.c: In function 'fill_agnx_hdr':
> drivers/staging/agnx/xmit.c:629: error: 'struct <anonymous>' has no m=
ember named 'retry_limit'
> drivers/staging/agnx/xmit.c:630: error: 'struct <anonymous>' has no m=
ember named 'retry_limit'
> drivers/staging/agnx/xmit.c: In function 'txm_power_set':
> drivers/staging/agnx/xmit.c:652: error: 'struct ieee80211_tx_info' ha=
s no member named 'tx_rate_idx'
> drivers/staging/agnx/xmit.c:652: error: 'struct ieee80211_tx_info' ha=
s no member named 'tx_rate_idx'
> drivers/staging/agnx/xmit.c:652: error: 'struct ieee80211_tx_info' ha=
s no member named 'tx_rate_idx'
> drivers/staging/agnx/pci.c: In function 'agnx_config_interface':
> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid_len'
> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid'
> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid_len'
> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid_len'
> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid'
> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid_len'
> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid_len'
> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid'
> drivers/staging/agnx/pci.c:327: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid_len'
> drivers/staging/agnx/pci.c:329: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid'
> drivers/staging/agnx/pci.c:329: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid_len'
> drivers/staging/agnx/pci.c:330: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid_len'
> drivers/staging/agnx/pci.c:331: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid'
> drivers/staging/agnx/pci.c:331: error: 'struct ieee80211_if_conf' has=
 no member named 'ssid_len'
> drivers/staging/agnx/pci.c: At top level:
> drivers/staging/agnx/pci.c:432: warning: initialization from incompat=
ible pointer type
> drivers/staging/altpciechdma/altpciechdma.c: In function 'ape_sg_to_c=
hdma_table':
> drivers/staging/altpciechdma/altpciechdma.c:430: warning: format '%08=
x' expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
> drivers/staging/altpciechdma/altpciechdma.c:434: warning: format '%08=
x' expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
> drivers/staging/altpciechdma/altpciechdma.c:450: warning: format '%08=
x' expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
> drivers/staging/altpciechdma/altpciechdma.c:451: warning: format '%08=
x' expects type 'unsigned int', but argument 3 has type 'dma_addr_t'
> drivers/staging/altpciechdma/altpciechdma.c: In function 'dma_test':
> drivers/staging/altpciechdma/altpciechdma.c:548: warning: assignment =
makes integer from pointer without a cast
> drivers/staging/altpciechdma/altpciechdma.c: In function 'probe':
> drivers/staging/altpciechdma/altpciechdma.c:931: warning: label 'err_=
rev' defined but not used
> drivers/staging/altpciechdma/altpciechdma.c:914: warning: label 'err_=
cdev' defined but not used
> drivers/staging/altpciechdma/altpciechdma.c: At top level:
> drivers/staging/altpciechdma/altpciechdma.c:416: warning: 'ape_sg_to_=
chdma_table' defined but not used
>=20
> Commit "STAGING: Move staging drivers back to staging-specific menu"
> allowed them to build in the allmodconfig again.  I have dropped the
> staging tree for today.
>=20

Damn. And w/o that commit staging drivers pollute the main drivers menu=
=2E

--=20
With best wishes
Dmitry
