From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: remove the tile tree?
Date: Tue, 5 Dec 2017 14:20:31 +1100
Message-ID: <20171205142031.6941097b@canb.auug.org.au>
References: <20171205072541.6c30d7b9@canb.auug.org.au>
        <d7d86b08-0c9b-6261-5860-712db6eadcee@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54459 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750995AbdLEDUe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Dec 2017 22:20:34 -0500
In-Reply-To: <d7d86b08-0c9b-6261-5860-712db6eadcee@mellanox.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Chris,

On Mon, 4 Dec 2017 20:33:59 -0500 Chris Metcalf <cmetcalf@mellanox.com> wro=
te:
>
> On 12/4/2017 3:25 PM, Stephen Rothwell wrote:
> > Hi Chris,
> >
> > Given commit
> >
> >    8ee5ad1d4c0b ("arch/tile: mark as orphaned")
> >
> > in Linus' tree, should I remove the tile tree from linux-next? =20
>=20
> Yes, that would make sense.=C2=A0 Good catch!

Done, thanks

--=20
Cheers,
Stephen Rothwell
