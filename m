From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: Re: linux-next: build warning after merge of the pci tree
Date: Fri, 24 Jun 2016 10:07:55 +0200
Message-ID: <20160624080755.wjqvaunta3vsdp7i@c203.arch.suse.de>
References: <20160623115154.62730f7f@canb.auug.org.au>
 <20160623164848.GE17987@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56359 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751010AbcFXIIC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Jun 2016 04:08:02 -0400
Content-Disposition: inline
In-Reply-To: <20160623164848.GE17987@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Helgaas <bhelgaas@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 23, 2016 at 11:48:49AM -0500, Bjorn Helgaas wrote:
> On Thu, Jun 23, 2016 at 11:51:54AM +1000, Stephen Rothwell wrote:
> > Hi Bjorn,
> >=20
> > After merging the pci tree, today's linux-next build (x86_64 allmod=
config)
> > produced this warning:
> >=20
> > drivers/misc/genwqe/card_base.c: In function 'genwqe_pci_remove':
> > drivers/misc/genwqe/card_base.c:1155:6: warning: unused variable 'b=
ars' [-Wunused-variable]
> >   int bars;
> >       ^
> > drivers/misc/genwqe/card_base.c: In function 'genwqe_pci_setup':
> > drivers/misc/genwqe/card_base.c:1143:2: warning: 'bars' may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
> >   pci_release_selected_regions(pci_dev, bars);
> >   ^
> >=20
> > Introduced by commit
> >=20
> >   370b01694826 ("GenWQE: Use pci_(request|release)_mem_regions")
>=20
> Thanks, Stephen.  I made the following edits, which should resolve th=
ese
> warnings.  Johannes, let me know if they look right to you.
>=20

Looks good, thanks.
	Johannes

--=20
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
Key fingerprint =3D EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
