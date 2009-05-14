From: Greg KH <greg@kroah.com>
Subject: Re: staging fails in next-20090514: drivers/staging/agnx/pci.o
Date: Thu, 14 May 2009 08:46:57 -0700
Message-ID: <20090514154657.GA2593@kroah.com>
References: <20090514164120.200e5fe2.sfr@canb.auug.org.au> <20090514152308.GB5880@ikn.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:38397 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752138AbZENPui (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 May 2009 11:50:38 -0400
Content-Disposition: inline
In-Reply-To: <20090514152308.GB5880@ikn.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, May 14, 2009 at 05:23:08PM +0200, Nico -telmich- Schottelius wr=
ote:
> Hehe, just found the staging area today, in which agnx does not want
> to be compiled:
>=20
>=20
>   CC [M]  drivers/staging/agnx/pci.o
> drivers/staging/agnx/pci.c:64:3: warning: "/*" within comment
> drivers/staging/agnx/pci.c:223:2: warning: "/*" within comment
> drivers/staging/agnx/pci.c:307: warning: =E2=80=98struct ieee80211_if=
_conf=E2=80=99 declared inside parameter list
> drivers/staging/agnx/pci.c:307: warning: its scope is only this defin=
ition or declaration, which is probably not what you want
> drivers/staging/agnx/pci.c: In function =E2=80=98agnx_config_interfac=
e=E2=80=99:
> drivers/staging/agnx/pci.c:315: error: dereferencing pointer to incom=
plete type

Known error, due to changes in the wireless tree.  Patches have been
sent to the wireless developer to help resolve these already.

thanks,

greg k-h
