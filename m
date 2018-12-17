From: Horia Geanta <horia.geanta@nxp.com>
Subject: Re: [PATCH v3 7/9] arm64: defconfig: Enable FSL_MC_BUS and
 FSL_MC_DPIO
Date: Mon, 17 Dec 2018 15:33:12 +0000
Message-ID: <VI1PR0402MB3485A452549CF37694720A7B98BC0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <49a5d199-4eeb-a7c2-b539-13356162547f@free.fr>
 <beb32683-fbd0-fc17-8e71-4f4f51163223@free.fr>
 <VI1PR0402MB3485824A9FB3BC878E7B83D498C60@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20181213064803.kd7p7fzsegu6nhnl@localhost>
 <1541367377.58314.1544910265605@email.ionos.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Olof Johansson <olof@lixom.net>
Cc: arm-soc <arm@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On 12/15/2018 11:44 PM, Stefan Wahren wrote:=0A=
> Hi,=0A=
> =0A=
>> Olof Johansson <olof@lixom.net> hat am 13. Dezember 2018 um 07:48 geschr=
ieben:=0A=
>>=0A=
>>=0A=
>> On Fri, Nov 09, 2018 at 06:05:24AM +0000, Horia Geanta wrote:=0A=
>>> On 11/9/2018 3:11 AM, Marc Gonzalez wrote:=0A=
>>>> Commit e8342cc7954e ("enable CAAM crypto engine on QorIQ DPAA2 SoCs")=
=0A=
>>>> enabled CRYPTO_DEV_FSL_DPAA2_CAAM, which depends on FSL_MC_DPIO,=0A=
>>>> which is not set. Enable FSL_MC_BUS, and build FSL_MC_DPIO and=0A=
>>>> CRYPTO_DEV_FSL_DPAA2_CAAM as modules.=0A=
>>>>=0A=
>>>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>=0A=
>>> Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
>>=0A=
>> I had to redo this one, and when I did I noticed that there's also an et=
hernet=0A=
>> driver. Should that be enabled as well?=0A=
>>=0A=
> =0A=
> this patch in next-20181214 breaks "make modules_install" for arm64/defco=
nfig on my Ubuntu machine:=0A=
> =0A=
> DEPMOD  4.20.0-rc6-next-20181214=0A=
> depmod: ERROR: Found 6 modules in dependency cycles!=0A=
> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> authenc=0A=
> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> fsl_mc_dpio=
=0A=
> depmod: ERROR: Cycle detected: dpaa2_caam -> caamhash_desc -> dpaa2_caam=
=0A=
> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> caamhash_des=
c -> error=0A=
> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> caamhash_des=
c -> caamalg_desc=0A=
> =0A=
> After reverting of this patch the issue disappeared.=0A=
> =0A=
Seems there's a dependency cycle b/w dpaa2_caam and caam{alg,hash}_desc, as=
 follows:=0A=
=0A=
A->B=0A=
---=0A=
dpaa2_caam needs cnstr_* exported by caam{alg,hash}_desc=0A=
=0A=
B->A=0A=
---=0A=
caam{alg,hash}_desc need caam_imx, caam_little_end:=0A=
caam{hash,alg}_desc.c=0A=
	--> desc_constr.h (included for descriptors generation functions)=0A=
		--> regs.h (included for endianness helpers)=0A=
			--> extern bool caam_imx, caam_little_end=0A=
caam_imx, caam_little_end are exported by dpaa2_caam - caamalg_qi2.c (when=
=0A=
CONFIG_CRYPTO_DEV_FSL_CAAM=3Dn)=0A=
=0A=
Could we drop this patch, until CAAM driver gets a proper fix (which is not=
=0A=
straightforward)?=0A=
=0A=
Thanks,=0A=
Horia=0A=
