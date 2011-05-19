From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Wed, 18 May 2011 19:54:48 -0700
Message-ID: <1305773688.2856.449.camel@haakon2.linux-iscsi.org>
References: <20110518114912.dfdf8835.sfr@canb.auug.org.au>
	 <1305684362.2856.349.camel@haakon2.linux-iscsi.org>
	 <20110518135823.a809f829.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linux-iscsi.org ([67.23.28.174]:33427 "EHLO
	linux-iscsi.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756019Ab1ESDDA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 May 2011 23:03:00 -0400
In-Reply-To: <20110518135823.a809f829.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kiran Patil <kiran.patil@intel.com>, Christoph Hellwig <hch@lst.de>, Yi Zou <yi.zou@intel.com>, Joe Eykholt <joe.eykholt@gmail.com>

On Wed, 2011-05-18 at 13:58 +1000, Stephen Rothwell wrote:
> Hi Nicholas,
>=20
> On Tue, 17 May 2011 19:06:02 -0700 "Nicholas A. Bellinger" <nab@linux=
-iscsi.org> wrote:
> >
> > On Wed, 2011-05-18 at 11:49 +1000, Stephen Rothwell wrote:
> > >=20
> > > After merging the scsi tree, today's linux-next build (x86_64 all=
modconfig)
> > > produced this warning:
> > >=20
> > > drivers/target/tcm_fc/tfc_io.c: In function 'ft_queue_data_in':
> > > drivers/target/tcm_fc/tfc_io.c:209: warning: format '%x' expects =
type 'unsigned int', but argument 5 has type 'size_t'
> > >=20
> > > Introduced by commit 3699d92a4d7b ("[SCSI] tcm_fc: Adding FC_FC4 =
provider
> > > (tcm_fc) for FCoE target (TCM - target core) support").
> > >=20
> >=20
> > It appears that this warning was fixed in LIO upstream a while back=
, but
> > did not make it into this morning scsi-misc merge.  Please apply.
> >=20
> > >From b830de5068d0c3745e83393f81d87f745ef7a4f2 Mon Sep 17 00:00:00 =
2001
> > From: Nicholas Bellinger <nab@linux-iscsi.org>
> > Date: Thu, 17 Feb 2011 21:56:16 +0000
> > Subject: [PATCH] tcm_fc: Fix conversion spec compile warning in ft_=
queue_data_in
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
> >=20
> > This patch fixes the following compile warning in ft_queue_data_in(=
):
> >=20
> > drivers/target/tcm_fc/tfc_io.c: In function =E2=80=98ft_queue_data_=
in=E2=80=99:
> > drivers/target/tcm_fc/tfc_io.c:209: warning: format =E2=80=98%x=E2=80=
=99 expects type =E2=80=98unsigned int=E2=80=99, but argument 5 has typ=
e =E2=80=98size_t=E2=80=99
> >=20
> > Signed-off-by: Nicholas A. Bellinger <nab@linux-iscsi.org>
> > ---
> >  drivers/target/tcm_fc/tfc_io.c |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/drivers/target/tcm_fc/tfc_io.c b/drivers/target/tcm_fc=
/tfc_io.c
> > index 4c3c0ef..3936bb1 100644
> > --- a/drivers/target/tcm_fc/tfc_io.c
> > +++ b/drivers/target/tcm_fc/tfc_io.c
> > @@ -206,7 +206,8 @@ int ft_queue_data_in(struct se_cmd *se_cmd)
> >                                                 "xid <0x%x>, remain=
ing <0x%x>, "
> >                                                 "lso_max <0x%x>\n",
> >                                                 __func__, fp, ep->x=
id,
> > -                                               remaining, lport->l=
so_max);
> > +                                               (unsigned int)remai=
ning,
> > +                                               lport->lso_max);
>=20
> Given that "remaining" really is a length, surely it makes more sense=
 to
> print it with %zd than to cast it and print it with %x ...
>=20

This is fine with me.  Bad habit of explictly casting conversion
specifications from sector_t type usage..

Kiran, would you mind fixing this to use %zd in your tree, and include
this along with the TMR LUN_RESET bugfix for James to include in
scsi-misc..?

Thanks,

--nab
