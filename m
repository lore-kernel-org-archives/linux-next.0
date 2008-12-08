From: Paul Moore <paul.moore@hp.com>
Subject: Re: linux-next: manual merge of the lblnet tree
Date: Mon, 8 Dec 2008 14:38:04 -0500
Message-ID: <200812081438.04489.paul.moore@hp.com>
References: <20081208184957.ae6f1726.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g4t0016.houston.hp.com ([15.201.24.19]:33624 "EHLO
	g4t0016.houston.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751495AbYLHTic (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Dec 2008 14:38:32 -0500
In-Reply-To: <20081208184957.ae6f1726.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Jean Delvare <khali@linux-fr.org>

On Monday 08 December 2008 2:49:57 am Stephen Rothwell wrote:
> Hi Paul,
>
> Today's linux-next merge of the lblnet tree got a conflict in
> Documentation/feature-removal-schedule.txt between commit
> 839361440c4cf848dddc5705fa4ac7c25d00dddf ("hwmon: Deprecate the
> fscher and fscpos drivers") from the jdelvare-hwmon tree and commit
> d45075ffb96a78c0f7137cfcec9fe816a6d23cfb ("selinux: Deprecate and
> schedule the removal of the the compat_net functionality") from the
> lblnet tree.
>
> Just overlapping additions.  I fixed it up (see below) and can carry
> it as necessary.

Thanks.  Other than pulling in the jdelvare-hwmon tree or moving the 
entry somewhere else in the file (not solving anything, just 
moving/delaying the problem) I'm not sure how to resolve the conflict.  
If you don't mind carrying your fix-up patch until the merge window 
opens that sounds like the best approach to me.

-- 
paul moore
linux @ hp
