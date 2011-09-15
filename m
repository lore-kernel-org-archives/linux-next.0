From: Helmut Schaa <helmut.schaa@googlemail.com>
Subject: Re: linux-next: manual merge of the wireless tree with Linus' tree
Date: Thu, 15 Sep 2011 09:17:07 +0200
Message-ID: <CAGXE3d_eBtgwdxcvzVTmxCJvNbNoTQ5YM9jRi7-6+8NW=hRVog@mail.gmail.com>
References: <20110915131453.7ce8c4e9d6d1bcd7f8ade995@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gw0-f42.google.com ([74.125.83.42]:52404 "EHLO
	mail-gw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754316Ab1IOHRH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Sep 2011 03:17:07 -0400
In-Reply-To: <20110915131453.7ce8c4e9d6d1bcd7f8ade995@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>

On Thu, Sep 15, 2011 at 5:14 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Today's linux-next merge of the wireless tree got a conflict in
> drivers/net/wireless/rt2x00/rt2800usb.c between commit 674db1344443
> ("rt2x00: fix crash in rt2800usb_get_txwi") from Linus' tree and comm=
it
> 31937c423ed3 ("rt2x00: Minor optimizazion in txdone path") from the
> wireless tree.
>
> I fixed it up (see below) anc can carry the fix as necessary.

=46ix looks good to me.

Thanks,
Helmut

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc drivers/net/wireless/rt2x00/rt2800usb.c
> index dbf501c,4b907a5..0000000
> --- a/drivers/net/wireless/rt2x00/rt2800usb.c
> +++ b/drivers/net/wireless/rt2x00/rt2800usb.c
> @@@ -538,11 -529,13 +538,12 @@@ static void rt2800usb_txdone(struct r=
t2
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0entry =3D rt2x00queue_=
get_entry(queue, Q_INDEX_DONE);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (rt2800usb_txdone_e=
ntry_check(entry, reg))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0entry =3D NULL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!entry || rt2x00queue_empty(queue=
))
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0-
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0rt2800_txdone_entry(entry, reg,
> =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (entry)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rt2800_txdone_entry(ent=
ry, reg);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rt2800_txdone_entry(ent=
ry, reg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 rt2800usb_get_txwi(entry));
> =A0 =A0 =A0 =A0}
> =A0}
>
>
