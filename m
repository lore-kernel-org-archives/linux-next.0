From: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: RE: linux-next: build failure after merge of the net-next tree
Date: Mon, 6 Aug 2018 04:43:28 +0000
Message-ID: <DB6PR0401MB2536DA6B7603233D29307595F8200@DB6PR0401MB2536.eurprd04.prod.outlook.com>
References: <20180806121026.7c4b956b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180806121026.7c4b956b@canb.auug.org.au>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Sorry for the trouble.
Just sent out the fix-up patch.
https://patchwork.ozlabs.org/patch/953695/

Thanks a lot.

Best regards,
Yangbo Lu

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Monday, August 6, 2018 10:10 AM
> To: David Miller <davem@davemloft.net>; Networking
> <netdev@vger.kernel.org>
> Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Ma=
iling
> List <linux-kernel@vger.kernel.org>; Y.b. Lu <yangbo.lu@nxp.com>
> Subject: linux-next: build failure after merge of the net-next tree
>=20
> Hi all,
>=20
> After merging the net-next tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/ptp/ptp_qoriq.o: In function `qoriq_ptp_probe':
> ptp_qoriq.c:(.text+0xd0c): undefined reference to `__aeabi_uldivmod'
>=20
> Caused by commit
>=20
>   91305f281262 ("ptp_qoriq: support automatic configuration for ptp timer=
")
>=20
> I just reverted that commit for today.
>=20
> --
> Cheers,
> Stephen Rothwell
