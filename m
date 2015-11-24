From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-panel tree
Date: Tue, 24 Nov 2015 11:38:16 +1100
Message-ID: <20151124113816.3ed66bcc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Werner Johansson <werner.johansson@sonymobile.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: linux-next.vger.kernel.org

Hi Thierry,

After merging the drm-panel tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c: In function 'wuxga_nt_panel_on':
drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c:65:8: error: implicit declaration of function 'mipi_dsi_turn_on_peripheral' [-Werror=implicit-function-declaration]
  ret = mipi_dsi_turn_on_peripheral(dsi);
        ^
drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c: In function 'wuxga_nt_panel_disable':
drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c:79:2: error: implicit declaration of function 'mipi_dsi_shutdown_peripheral' [-Werror=implicit-function-declaration]
  mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
  ^

Caused by commit

  086ceb6b42ca ("drm/panel: Add Panasonic VVX10F034N00 MIPI DSI panel")

I have used the version of the drm-panel tree from next-20151123 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
