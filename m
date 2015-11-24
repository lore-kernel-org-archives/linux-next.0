From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: linux-next: build failure after merge of the drm-panel tree
Date: Mon, 23 Nov 2015 22:03:44 -0800
Message-ID: <CAJAp7Oi6iF-=a88SKoCpFubBQapDxwzrHu6zSKwG4MGxByg3WQ@mail.gmail.com>
References: <20151124113816.3ed66bcc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151124113816.3ed66bcc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Werner Johansson <werner.johansson@sonymobile.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 23, 2015 at 4:38 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Thierry,
>
> After merging the drm-panel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c: In function 'wuxga_nt_panel_on':
> drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c:65:8: error: implicit declaration of function 'mipi_dsi_turn_on_peripheral' [-Werror=implicit-function-declaration]
>   ret = mipi_dsi_turn_on_peripheral(dsi);
>         ^
> drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c: In function 'wuxga_nt_panel_disable':
> drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c:79:2: error: implicit declaration of function 'mipi_dsi_shutdown_peripheral' [-Werror=implicit-function-declaration]
>   mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
>   ^
>
> Caused by commit
>
>   086ceb6b42ca ("drm/panel: Add Panasonic VVX10F034N00 MIPI DSI panel")
>
> I have used the version of the drm-panel tree from next-20151123 for today.
>

Thierry,

This means that patch 1 of the series was not picked up. It can be
found here: https://patchwork.kernel.org/patch/7530121/

Regards,
Bjorn
