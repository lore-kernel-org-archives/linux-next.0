From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: i2c quilt series incomplete
Date: Wed, 21 May 2008 08:13:08 +0200
Message-ID: <20080521081308.79ab309d@hyperion.delvare>
References: <20080521104041.0e99ac35.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:1897 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757915AbYEUGNT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 May 2008 02:13:19 -0400
In-Reply-To: <20080521104041.0e99ac35.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen

On Wed, 21 May 2008 10:40:41 +1000, Stephen Rothwell wrote:
> When fetching the i2c series this morning, I got a 404 error for
> i2c-core-use-list_for_each_entry_safe.diff, so I have commented it out of
> the series file for today.

Oops, sorry for the trouble once again. This is fixed now. My upload
script only picks *.patch files so it missed that one. I've modified
my script to warn me when a file is referenced in series but doesn't
exist, so it should not happen again.

Thanks,
-- 
Jean Delvare
