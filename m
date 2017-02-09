From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the input tree with the input-current
 tree
Date: Thu, 9 Feb 2017 13:06:24 +1100
Message-ID: <20170209130624.362f2048@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

Hi Dmitry,

Today's linux-next merge of the input tree got a conflict in:

  drivers/input/rmi4/Kconfig

between commit:

  413d37326700 ("Input: synaptics-rmi4 - select 'SERIO' when needed")

from the input-current tree and commit:

  b29c139a15b6 ("Input: synaptics-rmi4 - use Kconfig "if" to express dependency")

from the input tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/input/rmi4/Kconfig
index bb7762bf2879,78a78b99ec31..000000000000
--- a/drivers/input/rmi4/Kconfig
+++ b/drivers/input/rmi4/Kconfig
@@@ -40,24 -42,16 +42,21 @@@ config RMI4_SM
  	  called rmi_smbus.
  
  config RMI4_F03
-         bool "RMI4 Function 03 (PS2 Guest)"
- 	depends on RMI4_CORE
-         help
-           Say Y here if you want to add support for RMI4 function 03.
+ 	bool "RMI4 Function 03 (PS2 Guest)"
 -	depends on SERIO=y || RMI4_CORE=SERIO
+ 	help
+ 	  Say Y here if you want to add support for RMI4 function 03.
  
-           Function 03 provides PS2 guest support for RMI4 devices. This
-           includes support for TrackPoints on TouchPads.
+ 	  Function 03 provides PS2 guest support for RMI4 devices. This
+ 	  includes support for TrackPoints on TouchPads.
  
 +config RMI4_F03_SERIO
 +	tristate
- 	depends on RMI4_CORE
 +	depends on RMI4_F03
 +	default RMI4_CORE
 +	select SERIO
 +
  config RMI4_2D_SENSOR
  	bool
- 	depends on RMI4_CORE
  
  config RMI4_F11
  	bool "RMI4 Function 11 (2D pointing)"
