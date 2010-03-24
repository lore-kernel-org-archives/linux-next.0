From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: [PATCH] iwlwifi: fix build error for CONFIG_IWLAGN=n
Date: Wed, 24 Mar 2010 19:38:32 -0400
Message-ID: <20100324233832.GB32563@tuxdriver.com>
References: <4BAA73D2.1000301@oracle.com>
 <1269465799-19060-1-git-send-email-linville@tuxdriver.com>
 <1269466426.6935.8.camel@jlt3.sipsolutions.net>
 <1269466948.2446.3216.camel@rchatre-DESK>
 <20100324223719.GA32563@tuxdriver.com>
 <1269470489.2446.3217.camel@rchatre-DESK>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:43460 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750772Ab0CXXkf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Mar 2010 19:40:35 -0400
Content-Disposition: inline
In-Reply-To: <1269470489.2446.3217.camel@rchatre-DESK>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: reinette chatre <reinette.chatre@intel.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Wed, Mar 24, 2010 at 03:41:29PM -0700, reinette chatre wrote:

> I am very sorry, here is the correct link:
> http://git.kernel.org/?p=3Dlinux/kernel/git/iwlwifi/iwlwifi-2.6.git;a=
=3Dcommit;h=3Dbc745eb7d28285f3b437c00253bf01ef501eb3f1

=46WIW, that one misses the definition of iwl_good_ack_health in iwl-co=
re.h.

I already put the other one in wireless-next-2.6.  I'll just resolve
the conflict when I pull your tree.

Thanks,

John
--=20
John W. Linville =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Someday the world will =
need a hero, and you
linville@tuxdriver.com =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0might be all =
we have. =A0Be ready.
