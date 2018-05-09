From: Rob Herring <robherring2@gmail.com>
Subject: Re: linux-next: build warning after merge of the devicetree tree
Date: Wed, 9 May 2018 07:17:06 -0500
Message-ID: <CAL_Jsq+nbTv-bnjo=OQR+P49MgjwL7qkcc+47=jRHb4z0V94Vw@mail.gmail.com>
References: <20180509160449.68b865a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509160449.68b865a2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, May 9, 2018 at 1:04 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rob,
>
> After merging the devicetree tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dtb: Warning (graph_endpoint): /fragment@1/__overlay__/port@3/endpoint: graph connection to node '/fragment@0/__overlay__/lvds@feb90000/ports/port@0/endpoint' is not bidirectional
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb: Warning (graph_endpoint): /fragment@1/__overlay__/port@1/endpoint: graph connection to node '/fragment@0/__overlay__/lvds@feb90000/ports/port@0/endpoint' is not bidirectional
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb: Warning (graph_endpoint): /fragment@1/__overlay__/port@2/endpoint: graph connection to node '/fragment@0/__overlay__/lvds@feb94000/ports/port@0/endpoint' is not bidirectional

I forgot about this one hiding in the tree.

> and over 2000 more :-(

I assume you mean on other files. I've already sent out patches for
arm and arm64 dts files.

Rob
