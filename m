From: Horia Geanta <horia.geanta@nxp.com>
Subject: Re: [PATCH] Revert "arm64: defconfig: Enable FSL_MC_BUS and
 FSL_MC_DPIO"
Date: Thu, 20 Dec 2018 20:43:19 +0000
Message-ID: <VI1PR0402MB34856DA189C2B6677967E9CA98BF0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <2071995319.127120.1545163830046@email.ionos.de>
 <20181219101844.6362-1-horia.geanta@nxp.com>
 <CAK8P3a3RLdRtY2ND0r4VQ5447V1WLYD6b9NcWjYvYR2AUCV1tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>, Marc Gonzalez <marc.w.gonzalez@free.fr>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Stefan Wahren <stefan.wahren@i2se.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On 12/20/2018 5:28 PM, Arnd Bergmann wrote:=0A=
> On Wed, Dec 19, 2018 at 11:18 AM Horia Geant=E3 <horia.geanta@nxp.com> wr=
ote:=0A=
>>=0A=
>> This reverts commit d9678adbe733a770428a98651beaa2817d503ed3.=0A=
>>=0A=
>> Received below report from Stefan.=0A=
>> Revert the commit until CAAM driver dependency cycles are fixed.=0A=
>>=0A=
>> this patch in next-20181214 breaks "make modules_install" for=0A=
>> arm64/defconfig on my Ubuntu machine:=0A=
>>=0A=
>> DEPMOD  4.20.0-rc6-next-20181214=0A=
>> depmod: ERROR: Found 6 modules in dependency cycles!=0A=
>> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> authenc=0A=
>> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> fsl_mc_dpio=
=0A=
>> depmod: ERROR: Cycle detected: dpaa2_caam -> caamhash_desc -> dpaa2_caam=
=0A=
>> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> caamhash_de=
sc -> error=0A=
>> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> caamhash_de=
sc -> caamalg_desc=0A=
>>=0A=
>> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>=0A=
>> Signed-off-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
> =0A=
> I've applied the revert, but I think there is still a problem, since=0A=
> anyone could manually enable those options and should not=0A=
> see those cycles in the module dependencies.=0A=
> =0A=
Agree, root cause has to be fixed.=0A=
=0A=
> Horia, can you have a look at what caused that and how to fix it?=0A=
> It's probably a commit in the caam drivers. I have also created=0A=
> a patch to address a problem with that driver but forgot=0A=
> to send that out, it might fix this one as well, see my follow-up=0A=
> patch "crypto: caam/qi2 - add a CRYPTO_DEV_FSL_CAAM=0A=
> dependency".=0A=
> =0A=
Yes, will continue discussion there.=0A=
=0A=
Thanks,=0A=
Horia=0A=
=0A=
