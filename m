From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the pm, mfd
 and regulator trees
Date: Thu, 27 Nov 2014 08:49:02 +0000
Message-ID: <20141127084902.GC4628@x1>
References: <20141126154406.434ab873@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141126154406.434ab873@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Grant Likely <grant.likely@secretlab.ca>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Romain Perier <romain.perier@gmail.com>
List-Id: linux-next.vger.kernel.org

> Today's linux-next merge of the devicetree tree got a conflict in
> include/linux/of.h between commits b31384fa5de3 ("Driver core: Unifie=
d
> device properties interface for platform firmware") from the pm tree
> and a4b4e0461ec5 ("of: Add standard property for poweroff capability"=
)
> from the mfd and regulator trees and commit 7518b5890d8a ("of/overlay=
:
> Introduce DT overlay support") from the devicetree tree.

This patch actually originated from the Regulator tree.  I pulled it in
to avoid conflicts between MFD and Regulator.  I guess OF needs to do
the same to avoid a conflict when Linus pulls them in.

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
