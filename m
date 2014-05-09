From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the mmc tree with Linus' tree
Date: Fri, 9 May 2014 08:14:23 +0100
Message-ID: <20140509071423.GF5767@lee--X1>
References: <20140509134455.07d7de4d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:51197 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755881AbaEIHO2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 May 2014 03:14:28 -0400
Received: by mail-ie0-f178.google.com with SMTP id lx4so3691833iec.37
        for <linux-next@vger.kernel.org>; Fri, 09 May 2014 00:14:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140509134455.07d7de4d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chris Ball <chris@printf.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Micky Ching <micky_ching@realsil.com.cn>, Ulf Hansson <ulf.hansson@linaro.org>

> Today's linux-next merge of the mmc tree got a conflict in
> drivers/mmc/host/rtsx_pci_sdmmc.c between commit 98fcc5762dce ("mmc:
> rtsx: Revert "mmc: rtsx: add support for pre_req and post_req"") from
> the  tree and commit 1f7b581b3ffc ("mmc: rtsx: modify error handle an=
d
> remove smatch warnings") from the mmc tree.
>=20
> I fixed it up (maybe - see below and in the final tree) and can carry
> the fix as necessary (no action is required).

=46YI: From what Ulf (co-maintainer of MMC) says, this was expected and
will continue to happen until a pending revert is merged.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
