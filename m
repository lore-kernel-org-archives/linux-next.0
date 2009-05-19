From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH -next] eeepc: fix kconfig selects
Date: Tue, 19 May 2009 08:04:47 +0200
Message-ID: <71cd59b00905182304q4077b942o6ac41272e8306d90@mail.gmail.com>
References: <20090518184225.d5721ac8.sfr@canb.auug.org.au>
	 <20090518175745.da1f943f.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f224.google.com ([209.85.219.224]:51627 "EHLO
	mail-ew0-f224.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752168AbZESGEr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2009 02:04:47 -0400
In-Reply-To: <20090518175745.da1f943f.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lenb@kernel.org

On Tue, May 19, 2009 at 2:57 AM, Randy Dunlap <randy.dunlap@oracle.com>=
 wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> EEEPC_LAPTOP selects HOTPLUG_PCI. =A0This causes failures (build erro=
r below)
> when CONFIG_HOTPLUG is not enabled, so additionally select HOTPLUG si=
nce
> kconfig 'select' doesn't follow its dependency chain.
> Also, only select HOTPLUG_PCI if PCI is already enabled.
>
> drivers/pci/hotplug/fakephp.c:55: error: implicit declaration of func=
tion 'pci_rescan_bus'

Acked-by: Corentin Chary <corentincj@iksaif.net>

Pushed into acpi4asus tree.
Len, please get it for rc7.

Thanks

--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org
