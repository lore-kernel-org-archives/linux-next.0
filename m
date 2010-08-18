From: Gwendal Grignou <gwendal@google.com>
Subject: Re: linux-next: build failure after merge of the libata tree
Date: Tue, 17 Aug 2010 17:46:05 -0700
Message-ID: <AANLkTinJ8ks85Ym11wd4csdqFVgQpS7nw=RrfhMrLPUH@mail.gmail.com>
References: <20100818104057.5fdaf20d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:44477 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752114Ab0HRAqI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2010 20:46:08 -0400
In-Reply-To: <20100818104057.5fdaf20d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Garzik <jeff@garzik.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Grundler <grundler@google.com>

Let me fix it and send a patch to Jeff.

Gwendal.

On Tue, Aug 17, 2010 at 5:40 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Jeff,
>
> After merging the libata tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> drivers/ata/libata-transport.c: In function 'ata_attach_transport':
> drivers/ata/libata-transport.c:678: error: implicit declaration of fu=
nction 'kzalloc'
> drivers/ata/libata-transport.c:678: warning: assignment makes pointer=
 from integer without a cast
> drivers/ata/libata-transport.c: In function 'ata_release_transport':
> drivers/ata/libata-transport.c:741: error: implicit declaration of fu=
nction 'kfree'
>
> Caused by commit 97395d39931160a171959ac2e1fbff1caba3374b ("[libata] =
Add
> ATA transport class") neglecting to include linux/slab.h. =A0 See Rul=
e 1 in
> Documentation/SubmitChecklist.
>
> I have used the libata tree form next-20100817 for today.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>
