From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: manual merge of the trivial tree with the pci tree
Date: Tue, 24 Nov 2009 13:51:50 -0800
Message-ID: <20091124135150.0ccfd366@jbarnes-piketon>
References: <20091117155417.e0514040.sfr@canb.auug.org.au>
	<alpine.LSU.2.00.0911172318340.15039@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-137.bluehost.com ([67.222.39.27]:59899 "HELO
	outbound-mail-137.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S933966AbZKXVvt convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Nov 2009 16:51:49 -0500
In-Reply-To: <alpine.LSU.2.00.0911172318340.15039@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?QW5kcsOp?= Goddard Rosa <andre.goddard@gmail.com>, Yinghai Lu <yinghai@kernel.org>

On Tue, 17 Nov 2009 23:19:53 +0100 (CET)
Jiri Kosina <jkosina@suse.cz> wrote:

> On Tue, 17 Nov 2009, Stephen Rothwell wrote:
>=20
> > Today's linux-next merge of the trivial tree got a conflict in
> > arch/x86/pci/amd_bus.c between commit
> > 99935a7a59eaca0292c1a5880e10bae03f4a5e3d ("x86/PCI: read root
> > resources from IOH on Intel") from the pci tree and commit
> > 17530b1c635dfd1f258afc6b07b986b425d66ebd ("tree-wide: fix assorted
> > typos all over the place") from the trivial tree.
> >=20
> > The comment fixed up by the trivial tree patch has moved to
> > arch/x86/pci/bus_numa.h and I haven't bothered to fix it there.
>=20
> Thanks for letting me know.
>=20
> I have dropped the hunk from my queue. Jesse, could you please merge
> this patch to your tree instead?
>=20
>=20
>=20
>=20
> From: Andr=C3=A9 Goddard Rosa <andre.goddard@gmail.com>
> Subject: pci: fix comment typo
>=20
> Signed-off-by: Andr=C3=A9 Goddard Rosa <andre.goddard@gmail.com>
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>
>=20
> diff --git a/arch/x86/pci/amd_bus.c b/arch/x86/pci/amd_bus.c
> index 572ee97..575f6fe 100644
> --- a/arch/x86/pci/amd_bus.c
> +++ b/arch/x86/pci/amd_bus.c
> @@ -19,7 +19,7 @@
>  /*
>   * sub bus (transparent) will use entres from 3 to store extra from
> root,
> - * so need to make sure have enought slot there, increase
> PCI_BUS_NUM_RESOURCES?
> + * so need to make sure have enough slot there, increase
> PCI_BUS_NUM_RESOURCES? */
>  #define RES_NUM 16

=46ixed this up.  The comment is in bus_numa.h now.

--=20
Jesse Barnes, Intel Open Source Technology Center
