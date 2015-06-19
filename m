From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the pm tree
Date: Fri, 19 Jun 2015 12:38:17 -0700
Message-ID: <20150619193817.GA70769@vmdeb7>
References: <1434690279.23771.10.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48542 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755440AbbFSTiT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Jun 2015 15:38:19 -0400
Content-Disposition: inline
In-Reply-To: <1434690279.23771.10.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Corentin Chary <corentin.chary@gmail.com>

On Fri, Jun 19, 2015 at 03:04:39PM +1000, Michael Ellerman wrote:
> Hi Darren,
> 
> Today's linux-next merge of the drivers-x86 tree got conflicts in:
> 
>   drivers/platform/x86/apple-gmux.c
>   drivers/platform/x86/asus-wmi.c
>   drivers/platform/x86/samsung-laptop.c
> 
> between commits:
> 
>   143958e12fc1 "apple-gmux: Port to new backlight interface selection API"
>   1ff99803702b "asus-wmi: Port to new backlight interface selection API"
>   705669ed8d41 "samsung-laptop: Port to new backlight interface selection API"
> 
> from the pm tree and commits:
> 
>   85eaa5fb829a "apple_gmux: Use acpi_video_unregister_backlight instead of acpi_video_unregister"
>   5f770658747e "asus-wmi: Use acpi_video_unregister_backlight instead of acpi_video_unregister"
>   9330dcdd918a "samsung-laptop: Use acpi_video_unregister_backlight instead of acpi_video_unregister"
> 
> from the drivers-x86 tree.
> 
> This was caused by the patches:
> 
>   "apple_gmux: Use acpi_video_unregister_backlight instead of acpi_video_unregister"
>   "asus-wmi: Use acpi_video_unregister_backlight instead of acpi_video_unregister"
>   "samsung-laptop: Use acpi_video_unregister_backlight instead of acpi_video_unregister"
> 
> appearing in both trees as different commits.
> 
> I fixed it up and can carry the fix as necessary (no action is required).

OK, thanks.

Rafael, I accepted these three previously from Hans as preparation for the
larger set you recently accepted. Probably nothing to be done as we'll be
sending the pull's to Linus shortly and this will be behind us.

If you really wanted to, you could pick up the three preparatory patches from my
tree and I could drop them... but I try not to rebase my next branch if I can
avoid it.

-- 
Darren Hart
Intel Open Source Technology Center
