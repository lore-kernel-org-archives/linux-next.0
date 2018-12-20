From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Revert "arm64: defconfig: Enable FSL_MC_BUS and FSL_MC_DPIO"
Date: Thu, 20 Dec 2018 16:27:56 +0100
Message-ID: <CAK8P3a3RLdRtY2ND0r4VQ5447V1WLYD6b9NcWjYvYR2AUCV1tg@mail.gmail.com>
References: <2071995319.127120.1545163830046@email.ionos.de> <20181219101844.6362-1-horia.geanta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219101844.6362-1-horia.geanta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>
Cc: Olof Johansson <olof@lixom.net>, Marc Gonzalez <marc.w.gonzalez@free.fr>, arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Stefan Wahren <stefan.wahren@i2se.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 19, 2018 at 11:18 AM Horia Geantă <horia.geanta@nxp.com> wrote:
>
> This reverts commit d9678adbe733a770428a98651beaa2817d503ed3.
>
> Received below report from Stefan.
> Revert the commit until CAAM driver dependency cycles are fixed.
>
> this patch in next-20181214 breaks "make modules_install" for
> arm64/defconfig on my Ubuntu machine:
>
> DEPMOD  4.20.0-rc6-next-20181214
> depmod: ERROR: Found 6 modules in dependency cycles!
> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> authenc
> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> fsl_mc_dpio
> depmod: ERROR: Cycle detected: dpaa2_caam -> caamhash_desc -> dpaa2_caam
> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> caamhash_desc -> error
> depmod: ERROR: Cycle detected: caamalg_desc -> dpaa2_caam -> caamhash_desc -> caamalg_desc
>
> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Horia Geantă <horia.geanta@nxp.com>

I've applied the revert, but I think there is still a problem, since
anyone could manually enable those options and should not
see those cycles in the module dependencies.

Horia, can you have a look at what caused that and how to fix it?
It's probably a commit in the caam drivers. I have also created
a patch to address a problem with that driver but forgot
to send that out, it might fix this one as well, see my follow-up
patch "crypto: caam/qi2 - add a CRYPTO_DEV_FSL_CAAM
dependency".

       Arnd
