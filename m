From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the drivers-x86 tree with the pm tree
Date: Fri, 19 Jun 2015 15:04:39 +1000
Message-ID: <1434690279.23771.10.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33577 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751347AbbFSFEk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Jun 2015 01:04:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Corentin Chary <corentin.chary@gmail.com>

Hi Darren,

Today's linux-next merge of the drivers-x86 tree got conflicts in:

  drivers/platform/x86/apple-gmux.c
  drivers/platform/x86/asus-wmi.c
  drivers/platform/x86/samsung-laptop.c

between commits:

  143958e12fc1 "apple-gmux: Port to new backlight interface selection API"
  1ff99803702b "asus-wmi: Port to new backlight interface selection API"
  705669ed8d41 "samsung-laptop: Port to new backlight interface selection API"

from the pm tree and commits:

  85eaa5fb829a "apple_gmux: Use acpi_video_unregister_backlight instead of acpi_video_unregister"
  5f770658747e "asus-wmi: Use acpi_video_unregister_backlight instead of acpi_video_unregister"
  9330dcdd918a "samsung-laptop: Use acpi_video_unregister_backlight instead of acpi_video_unregister"

from the drivers-x86 tree.

This was caused by the patches:

  "apple_gmux: Use acpi_video_unregister_backlight instead of acpi_video_unregister"
  "asus-wmi: Use acpi_video_unregister_backlight instead of acpi_video_unregister"
  "samsung-laptop: Use acpi_video_unregister_backlight instead of acpi_video_unregister"

appearing in both trees as different commits.

I fixed it up and can carry the fix as necessary (no action is required).

cheers
