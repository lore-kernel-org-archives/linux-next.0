From: Vakul Garg <vakul.garg@nxp.com>
Subject: RE: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 18 Sep 2018 09:10:18 +0000
Message-ID: <DB7PR04MB42522B223D4E04F5DA519A8B8B1D0@DB7PR04MB4252.eurprd04.prod.outlook.com>
References: <20180918101107.74d8689a@canb.auug.org.au>
 <93982e9d-dc78-6423-bb9b-c5773d98e244@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <93982e9d-dc78-6423-bb9b-c5773d98e244@iogearbox.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



> -----Original Message-----
> From: Daniel Borkmann <daniel@iogearbox.net>
> Sent: Tuesday, September 18, 2018 2:14 PM
> To: Stephen Rothwell <sfr@canb.auug.org.au>; David Miller
> <davem@davemloft.net>; Networking <netdev@vger.kernel.org>
> Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel
> Mailing List <linux-kernel@vger.kernel.org>; Vakul Garg
> <vakul.garg@nxp.com>
> Subject: Re: linux-next: manual merge of the net-next tree with the net t=
ree
>=20
> On 09/18/2018 02:11 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the net-next tree got a conflict in:
> >
> >   tools/testing/selftests/net/tls.c
> >
> > between commit:
> >
> >   50c6b58a814d ("tls: fix currently broken MSG_PEEK behavior")
> >
> > from the net tree and commit:
> >
> >   c2ad647c6442 ("selftests/tls: Add test for recv(PEEK) spanning
> > across multiple records")
> >
> > from the net-next tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This is
> > now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your
> > tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise
> > any particularly complex conflicts.
>=20
> The test from 50c6b58a814d supersedes the one from c2ad647c6442 so the
> recv_peek_large_buf_mult_recs could be removed; latter was also not
> working correctly due to this bug.

Why remove recv_peek_large_buf_mult_recs if its correct?
Why not the newly added one which achieves the same thing?

Regards, Vakul

>=20
> Thanks,
> Daniel
