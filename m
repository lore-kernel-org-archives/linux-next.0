From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] spi: update for of_device to platform_device replacement
Date: Mon, 16 Aug 2010 15:19:40 -0600
Message-ID: <AANLkTinNyf4TYpz0iSe2ArYk6X_AMVu1nKTuWFsHxaik@mail.gmail.com>
References: <20100809120509.be36a4fa.sfr@canb.auug.org.au> <20100816122059.c3ee7f6a.sfr@canb.auug.org.au>
 <df0c23b2-b602-4555-a363-795deb0cde28@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:51228 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755313Ab0HPVUA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Aug 2010 17:20:00 -0400
In-Reply-To: <df0c23b2-b602-4555-a363-795deb0cde28@email.android.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linus <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Aug 15, 2010 at 11:22 PM, Grant Likely
<grant.likely@secretlab.ca> wrote:
>
>
> "Stephen Rothwell" <sfr@canb.auug.org.au> wrote:
>
>>
>>Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
>>This patch now is needed in Linus' tree. =A0I will add it to my fixes=
 tree
>>for today. =A0Linus, can you take this, please?

Linus, I'm collecting a number of OF-related fixup patches anyway, so
I'll pick this up into my tree, make sure I haven't broken anything,
and send you a pull req this afternoon.

Cheers,
g.

>>
>>diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460e=
x.c
>>index ea24c1e..2673a3d 100644
>>--- a/drivers/ata/sata_dwc_460ex.c
>>+++ b/drivers/ata/sata_dwc_460ex.c
>>@@ -1588,7 +1588,7 @@ static const struct ata_port_info sata_dwc_port=
_info[] =3D {
>> =A0 =A0 =A0 },
>> };
>>
>>-static int sata_dwc_probe(struct of_device *ofdev,
>>+static int sata_dwc_probe(struct platform_device *ofdev,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const struct of_device_i=
d *match)
>> {
>> =A0 =A0 =A0 struct sata_dwc_device *hsdev;
>>@@ -1702,7 +1702,7 @@ error_out:
>> =A0 =A0 =A0 return err;
>> }
>>
>>-static int sata_dwc_remove(struct of_device *ofdev)
>>+static int sata_dwc_remove(struct platform_device *ofdev)
>> {
>> =A0 =A0 =A0 struct device *dev =3D &ofdev->dev;
>> =A0 =A0 =A0 struct ata_host *host =3D dev_get_drvdata(dev);
>>--
>>1.7.1
>>
>>--
>>Cheers,
>>Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>>http://www.canb.auug.org.au/~sfr/
>
> --
> Sent from my Android phone with K-9 Mail. Please excuse my brevity.
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
