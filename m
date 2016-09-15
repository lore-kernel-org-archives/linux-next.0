From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the amlogic tree with the pinctrl tree
Date: Thu, 15 Sep 2016 10:19:08 +1000
Message-ID: <20160915101908.08f24fe1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Deepak <deepak_das@mentor.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the amlogic tree got a conflict in:

  drivers/base/pinctrl.c

between commit:

  23b4ed268076 ("driver: base: pinctrl: return error from pinctrl_bind_pins()")

from the pinctrl tree and commit:

  eb4ec68acf5e ("driver: base: pinctrl: return error from pinctrl_bind_pins()")

from the amlogic tree.

I fixed it up (I used the version from the pinctrl tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
