From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with the m68k
	tree
Date: Wed, 10 Feb 2010 13:17:49 -0700
Message-ID: <fa686aa41002101217x135452cfud3ff750899be852d@mail.gmail.com>
References: <20100210160234.673f32d1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f173.google.com ([209.85.211.173]:41867 "EHLO
	mail-yw0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753911Ab0BJUSK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2010 15:18:10 -0500
In-Reply-To: <20100210160234.673f32d1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>

On Tue, Feb 9, 2010 at 10:02 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> Today's linux-next merge of the devicetree tree got a conflict in
> drivers/serial/pmac_zilog.c between commit
> f0ccf0f0269dfe53ec3f1c58fe130a47b908b907 ("pmac-zilog: cleanup") from
> the m68k tree and commit71a157e8edca55198e808f8561dd49017a54ee34 =A0(=
"of: add
> 'of_' prefix to machine_is_compatible()") from the devicetree tree.
>
> The first removes a space ... I fixed it up (see below) and can carry=
 the
> fix as necessary. =A0(Grant, you could get rid of this by removing th=
e
> space between the tabs on the line "baud =3D 57600;". =A0Not a big is=
sue,
> though.)

Removing the space didn't help.  git still complains about a conflict
on merge if I remove the space.  Probably because both branches show a
diff on the same area against the common base.

What should be done here?  Should I merge Geert's 68k tree into my
next-devicetree branch?  Or is there a better way to prepare for the
merge window?

> Also, there is a further patch in the m68k tree
> (89d58f83cfce675a2054975cc2598ba1979816c7 "pmac-zilog: add platform
> driver") that adds a define for machine_is_compatible. =A0I fixed tha=
t as
> below as well. =A0Hmmm, this file should really include linux/of_fdt.=
h for
> the definition of of_machine_is_compatible(), shouldn't it? =A0And th=
en
> maybe we could have a non OF version of the prototype/define in
> of_fdt.h? =A0Just an idea.

That sounds reasonable.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
