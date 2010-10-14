From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the spi tree
Date: Wed, 13 Oct 2010 19:58:07 -0600
Message-ID: <AANLkTinCh3X7XJQpEVoP-fKqyXtVu1EZ+tVX_nNGQXyb@mail.gmail.com>
References: <20101014125553.dc4ea7be.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:46864 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753325Ab0JNB6b convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Oct 2010 21:58:31 -0400
In-Reply-To: <20101014125553.dc4ea7be.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mingkai Hu <Mingkai.hu@freescale.com>

On Wed, Oct 13, 2010 at 7:55 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> After merging the spi tree, today's linux-next build (x86_64 allmodco=
nfig)
> failed like this:
>
> drivers/mtd/devices/m25p80.c: In function 'm25p_probe':
> drivers/mtd/devices/m25p80.c:927: error: 'struct device' has no membe=
r named 'of_node'
> drivers/mtd/devices/m25p80.c:929: error: 'struct device' has no membe=
r named 'of_node'

Oops, I wasn't supposed to push that patch yet.  I'll pull it out.

g.

>
> Caused by commit 2bf990280d6074228f6e4c18ad01c0674c5c11c8 ("mtd/m25p8=
0:
> add support to parse the partitions by OF node"). CONFIG_OF is not se=
t
> for this build.
>
> I have used the spi tree form next-20101013 for today.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
