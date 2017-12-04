From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with Linus' tree
Date: Tue, 5 Dec 2017 09:59:06 +1100
Message-ID: <20171205095906.76504195@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Pankaj Bansal <pankaj.bansal@nxp.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/can/flexcan.c

between commit:

  29c64b17a0bc ("can: flexcan: fix VF610 state transition issue")

from Linus' tree and commit:

  99b7668c04b2 ("can: flexcan: adding platform specific details for LS1021A")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/net/can/flexcan.c
index 0626dcfd1f3d,3a370d8437b0..000000000000
--- a/drivers/net/can/flexcan.c
+++ b/drivers/net/can/flexcan.c
@@@ -184,12 -184,13 +184,13 @@@
   * Below is some version info we got:
   *    SOC   Version   IP-Version  Glitch- [TR]WRN_INT IRQ Err Memory err RTR re-
   *                                Filter? connected?  Passive detection  ception in MB
 - *   MX25  FlexCAN2  03.00.00.00     no        no         ?       no        no
 + *   MX25  FlexCAN2  03.00.00.00     no        no        no       no        no
   *   MX28  FlexCAN2  03.00.04.00    yes       yes        no       no        no
 - *   MX35  FlexCAN2  03.00.00.00     no        no         ?       no        no
 + *   MX35  FlexCAN2  03.00.00.00     no        no        no       no        no
   *   MX53  FlexCAN2  03.00.00.00    yes        no        no       no        no
   *   MX6s  FlexCAN3  10.00.12.00    yes       yes        no       no       yes
 - *   VF610 FlexCAN3  ?               no       yes         ?      yes       yes?
 + *   VF610 FlexCAN3  ?               no       yes        no      yes       yes?
+  * LS1021A FlexCAN2  03.00.04.00     no       yes        no       no       yes
   *
   * Some SOCs do not have the RX_WARN & TX_WARN interrupt line connected.
   */
@@@ -297,10 -302,15 +302,16 @@@ static const struct flexcan_devtype_dat
  
  static const struct flexcan_devtype_data fsl_vf610_devtype_data = {
  	.quirks = FLEXCAN_QUIRK_DISABLE_RXFG | FLEXCAN_QUIRK_ENABLE_EACEN_RRS |
 -		FLEXCAN_QUIRK_DISABLE_MECR | FLEXCAN_QUIRK_USE_OFF_TIMESTAMP,
 +		FLEXCAN_QUIRK_DISABLE_MECR | FLEXCAN_QUIRK_USE_OFF_TIMESTAMP |
 +		FLEXCAN_QUIRK_BROKEN_PERR_STATE,
  };
  
+ static const struct flexcan_devtype_data fsl_ls1021a_r2_devtype_data = {
+ 	.quirks = FLEXCAN_QUIRK_DISABLE_RXFG | FLEXCAN_QUIRK_ENABLE_EACEN_RRS |
+ 		FLEXCAN_QUIRK_DISABLE_MECR | FLEXCAN_QUIRK_BROKEN_PERR_STATE |
+ 		FLEXCAN_QUIRK_USE_OFF_TIMESTAMP,
+ };
+ 
  static const struct can_bittiming_const flexcan_bittiming_const = {
  	.name = DRV_NAME,
  	.tseg1_min = 4,
