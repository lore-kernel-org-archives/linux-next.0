From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the net tree
Date: Tue, 24 Nov 2009 10:13:47 +0100 (CET)
Message-ID: <alpine.LSU.2.00.0911241011520.6953@wotan.suse.de>
References: <20091124171459.88cb0c0d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47292 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932367AbZKXJNl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Nov 2009 04:13:41 -0500
In-Reply-To: <20091124171459.88cb0c0d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?=22Andr=E9_Goddard_Rosa=22?= <andre.goddard@gmail.com>, Bruce Allan <bruce.w.allan@intel.com>, "David S. Miller" <davem@davemloft.net>

On Tue, 24 Nov 2009, Stephen Rothwell wrote:

> Hi Jiri,
>=20
> Today's linux-next merge of the trivial tree got a conflict in
> drivers/net/e1000e/lib.c between commit
> 3bb99fe226ead584a4db674dab546689f705201f ("e1000e: consolidate two db=
ug
> macros into one simpler one") from the net tree and commit
> 52692d35d013e221137b2fbe800e3e6776111821 ("tree-wide: fix assorted ty=
pos
> all over the place") from the trivial tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary.
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc drivers/net/e1000e/lib.c
> index f690a10,b065ba4..0000000
> --- a/drivers/net/e1000e/lib.c
> +++ b/drivers/net/e1000e/lib.c
> @@@ -563,11 -570,11 +563,11 @@@ s32 e1000e_check_for_serdes_link(stru=
c
>   			if (rxcw & E1000_RXCW_SYNCH) {
>   				if (!(rxcw & E1000_RXCW_IV)) {
>   					mac->serdes_has_link =3D true;
>  -					hw_dbg(hw, "SERDES: Link up - autoneg "
>  +					e_dbg("SERDES: Link up - autoneg "
> - 					   "completed sucessfully.\n");
> + 					   "completed successfully.\n");
>   				} else {
>   					mac->serdes_has_link =3D false;
>  -					hw_dbg(hw, "SERDES: Link down - invalid"
>  +					e_dbg("SERDES: Link down - invalid"
>   					   "codewords detected in autoneg.\n");
>   				}
>   			} else {

Maybe the best resolution would be for Davem to merge the respective hu=
nk=20
through his tree, so that I can drop it on my side. Please let me know=20
if/when this, I will drop the hunk then.


=46rom: Andr=E9 Goddard Rosa <andre.goddard@gmail.com>
Subject: e1000e: fix assorted typos

Signed-off-by: Andr=E9 Goddard Rosa <andre.goddard@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>

--- a/drivers/net/e1000e/82571.c
+++ b/drivers/net/e1000e/82571.c
@@ -282,7 +282,7 @@ static s32 e1000_init_mac_params_82571(struct e1000=
_adapter *adapter)
=20
 	/*
 	 * Ensure that the inter-port SWSM.SMBI lock bit is clear before
-	 * first NVM or PHY acess. This should be done for single-port
+	 * first NVM or PHY access. This should be done for single-port
 	 * devices, and for one port only on dual-port devices so that
 	 * for those devices we can still use the SMBI lock to synchronize
 	 * inter-port accesses to the PHY & NVM.
@@ -1412,7 +1412,7 @@ static s32 e1000_check_for_serdes_link_82571(stru=
ct e1000_hw *hw)
 		case e1000_serdes_link_autoneg_progress:
 			/*
 			 * If the LU bit is set in the STATUS register,
-			 * autoneg has completed sucessfully. If not,
+			 * autoneg has completed successfully. If not,
 			 * try foring the link because the far end may be
 			 * available but not capable of autonegotiation.
 			 */
diff --git a/drivers/net/e1000e/lib.c b/drivers/net/e1000e/lib.c
index 99ba2b8..b065ba4 100644
--- a/drivers/net/e1000e/lib.c
+++ b/drivers/net/e1000e/lib.c
@@ -571,7 +571,7 @@ s32 e1000e_check_for_serdes_link(struct e1000_hw *h=
w)
 				if (!(rxcw & E1000_RXCW_IV)) {
 					mac->serdes_has_link =3D true;
 					hw_dbg(hw, "SERDES: Link up - autoneg "
-					   "completed sucessfully.\n");
+					   "completed successfully.\n");
 				} else {
 					mac->serdes_has_link =3D false;
 					hw_dbg(hw, "SERDES: Link down - invalid"
