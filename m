From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with Linus' tree
Date: Mon, 7 Jun 2010 11:03:35 -0600
Message-ID: <AANLkTinfvexAjfzrLtQXqqCLIqootCGhaVLmajLC8rtO@mail.gmail.com>
References: <20100607125343.cd109629.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f187.google.com ([209.85.211.187]:51644 "EHLO
	mail-yw0-f187.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751863Ab0FGREA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jun 2010 13:04:00 -0400
In-Reply-To: <20100607125343.cd109629.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jun 6, 2010 at 8:53 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Grant,
>
> Today's linux-next merge of the devicetree tree got a conflict in
> drivers/usb/host/ehci-hcd.c between commit
> 1f23b2d98c11fed43c552a5dbd00c793f81a8736 ("usb: fix ehci_hcd build
> failure when both generic-OF and xilinx is selected") from the =A0tre=
e and
> commit 4c018c4ab1edd8f4154848868960ebe132c3d138 ("usb/of: fix build
> errors") from the devicetree tree.
>
> They look like two version of the same fix. =A0I used the version fro=
m
> Linus' tree.

Yup, that's right.  The commit in my devicetree-next branch is stale
and has been superseeded.  I just hadn't pushed out the new tree yet.
I'm refresh it today.

Cheers,
g.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
