From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: linux-next: build warning after merge of the wireless-next tree
Date: Tue, 30 Sep 2014 09:41:36 -0500
Message-ID: <542AC120.1080104@lwfinger.net>
References: <20140930184607.081d38de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:33096 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbaI3Olk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Sep 2014 10:41:40 -0400
In-Reply-To: <20140930184607.081d38de@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>

On 09/30/2014 03:46 AM, Stephen Rothwell wrote:
> Hi John,
>
> After merging the wireless-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> WARNING: drivers/staging/rtl8192ee/r8192ee: 'rtl_evm_dbm_jaguar' exported twice. Previous export was in drivers/net/wireless/rtlwifi/rtlwifi.ko
>
> Introduced by commit f3a97e93814a ("rtlwifi: Finish modifying core
> routines for new drivers").
>
> I suspect that there is a staging driver that needs removing/updating?

A new version of the driver for the RTL8192EE has been submitted to the regular 
wireless tree; however, there is a bit of overlap before the staging version can 
be removed as the latter request must go through GregKH. Now that the new driver 
has reached linux-next, I will send the appropriate request to Greg.

Thanks,

Larry
