From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Thu, 17 Apr 2014 09:17:32 -0700
Message-ID: <20140417161732.GD22187@kroah.com>
References: <20140417143137.a66d4f53a928fd454911fa50@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:42360 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751110AbaDQQR2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 17 Apr 2014 12:17:28 -0400
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1508421462
	for <linux-next@vger.kernel.org>; Thu, 17 Apr 2014 12:17:27 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20140417143137.a66d4f53a928fd454911fa50@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jes Sorensen <Jes.Sorensen@redhat.com>

On Thu, Apr 17, 2014 at 02:31:37PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got conflicts in
> drivers/staging/rtl8723au/core/rtw_ieee80211.c,
> drivers/staging/rtl8723au/core/rtw_mlme_ext.c,
> drivers/staging/rtl8723au/core/rtw_p2p.c and
> drivers/staging/rtl8723au/core/rtw_wlan_util.c between commit
> f5d197b614d8 ("staging: rtl8723au: Fix buffer overflow in rtw_get_wfd_ie
> ()") from the staging.current tree and various commits from the staging
> tree.
> 
> I fixed it up (I just use dthe version from the staging tree) and can
> carry the fix as necessary (no action is required).

Sounds good, thanks.

greg k-h
