From: =?ISO-8859-1?Q?Javier_Mu=F1oz?= <jmunhoz@igalia.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Thu, 19 Jul 2012 15:53:37 +0200
Message-ID: <50081161.103@igalia.com>
References: <20120719170827.32067d18457dc0e6c3b644f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp3.mundo-r.com ([212.51.32.191]:36286 "EHLO
	smtp4.mundo-r.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750804Ab2GSNsB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Jul 2012 09:48:01 -0400
In-Reply-To: <20120719170827.32067d18457dc0e6c3b644f5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/19/2012 09:08 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
> 
> drivers/staging/sm7xxfb/sm7xxfb.c: In function 'smtcfb_pci_probe':
> drivers/staging/sm7xxfb/sm7xxfb.c:829:33: error: 'smtc_screen_info' undeclared (first use in this function)
> 
> Caused by commit 013db67415d1 ("staging: sm7xxfb: rename smtc_screen_info
> to smtc_scr_info").  Grep is your friend.
> 
> I have added the following patch for today.

Sorry, my mistake. Thanks Stephen.

javi
