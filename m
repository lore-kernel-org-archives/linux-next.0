From: Mariusz Kozlowski <mk@lab.zgora.pl>
Subject: Re: linux-next: Tree for March 4
Date: Sun, 6 Mar 2011 23:52:10 +0100
Message-ID: <20110306225210.GA9085@mako-laptop>
References: <20110304180027.20deb6c4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110304180027.20deb6c4.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>
List-Id: linux-next.vger.kernel.org

Hi,

sound/soc/soc-core.c: In function 'snd_soc_instantiate_card':
sound/soc/soc-core.c:1882: error: 'struct snd_soc_dapm_context' has no member named 'debugfs_dapm'
sound/soc/soc-core.c:1883: error: 'struct snd_soc_card' has no member named 'debugfs_card_root'
sound/soc/soc-core.c:1884: error: 'struct snd_soc_dapm_context' has no member named 'debugfs_dapm'

Looking at surrounding code it's missing ifdef for CONFIG_DEBUG_FS.

-- 
Mariusz Kozlowski
