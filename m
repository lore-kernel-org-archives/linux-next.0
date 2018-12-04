From: Dexuan Cui <decui@microsoft.com>
Subject: RE: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Date: Tue, 4 Dec 2018 08:46:41 +0000
Message-ID: <PU1P153MB01699DCE042ACB59AADCC8D3BFAF0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
References: <20181204153513.1e799336@canb.auug.org.au>
 <20181204074241.GB27141@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204074241.GB27141@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, KY Srinivasan <kys@microsoft.com>
List-Id: linux-next.vger.kernel.org

> From: Greg KH <greg@kroah.com>
> Sent: Monday, December 3, 2018 11:43 PM
> On Tue, Dec 04, 2018 at 03:35:13PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the char-misc tree got a conflict in:
> >
> >   drivers/hv/channel_mgmt.c
> >
> > between commit:
> >
> >   37c2578c0c40 ("Drivers: hv: vmbus: Offload the handling of channels t=
o
> two workqueues")
> >
> > from the char-misc.current tree and commit:
> >
> >   4d3c5c69191f ("Drivers: hv: vmbus: Remove the useless API
> vmbus_get_outgoing_channel()")
> >
> > from the char-misc tree.
> >
> > I fixed it up (I used the former version where they conflicted) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
Hi Stephen,=20
Thank you! I can confirm your rebase for next-20181204 is correct:
37c2578c0c40 ("Drivers: hv: vmbus: Offload the handling of channels to two =
workqueues")

> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflictin=
g
> > tree to minimise any particularly complex conflicts.
>=20
> Yeah, this is a mess, I'll wait for the hyper-v developers to send me a
> fixup patch for handling this merge issue, as they know it is happening
> :(
>=20
> greg k-h

Since Stephen has fixed the merge issue correctly, I guess I may not need t=
o send a fixup
patch for linux-next.git. If I didn't get it right, please let me know whic=
h tree/branch I
should work on to send a fixup patch.

It looks the conflict here happened because the two related patches, which =
modify
the same functions, went into different branches of char-misc.git. I didn't=
 realize this
could happen... Sorry. The lesson I learnt is that I should not submit an u=
rgent fix
with an unimportant clean-up patch at the same time, when they can cause a =
conflict.

Thanks,
-- Dexuan
