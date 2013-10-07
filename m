From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: manual merge of the wireless-next tree
Date: Mon, 07 Oct 2013 09:17:36 -0700
Message-ID: <1381162656.2081.179.camel@joe-AO722>
References: <1381159127-11067-1-git-send-email-treding@nvidia.com>
	 <1381159127-11067-5-git-send-email-treding@nvidia.com>
	 <5252D7E4.2050509@lwfinger.net> <1381161393.2081.177.camel@joe-AO722>
	 <5252DC9C.8090803@lwfinger.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0069.hostedemail.com ([216.40.44.69]:46398 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755529Ab3JGQRk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Oct 2013 12:17:40 -0400
In-Reply-To: <5252DC9C.8090803@lwfinger.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, "John W. Linville" <linville@tuxdriver.com>, Arend van Spriel <arend@broadcom.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2013-10-07 at 11:09 -0500, Larry Finger wrote:
> On 10/07/2013 10:56 AM, Joe Perches wrote:
> > On Mon, 2013-10-07 at 10:48 -0500, Larry Finger wrote:
> >> On 10/07/2013 10:18 AM, Thierry Reding wrote:
> >>> Today's linux-next merge of the wireless-next tree got conflicts in:
> >>>
> >>> 	drivers/net/wireless/brcm80211/brcmfmac/dhd_bus.h
> >>> 	drivers/net/wireless/rtlwifi/rtl8188ee/phy.h
> >>> 	drivers/net/wireless/rtlwifi/rtl8192ce/phy.h
> >>> 	drivers/net/wireless/rtlwifi/rtl8192de/phy.h
> >>> 	drivers/net/wireless/rtlwifi/rtl8723ae/phy.h
> > []
> >> Yes, the patches for rtlwifi problems are correct. All of these problems would
> >> have been avoided if changes to wireless drivers were sent to the wireless tree
> >> rather than direct submission to net-next!!!!
> >
> > They were and you acked it.
> > https://lkml.org/lkml/2013/9/25/589
> >
> > Who picks it up first and applies it is
> > not in my domain.
> 
> Fair enough. I should have asked DaveM to let John apply those changes.

Or maybe John could merge changes from net-next
into wireless-next a bit more often.
