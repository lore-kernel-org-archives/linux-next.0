From: Fernando Luis =?ISO-8859-1?Q?V=E1zquez?= Cao
	<fernando@oss.ntt.co.jp>
Subject: Re: linux-next: Tree for July 29
Date: Tue, 29 Jul 2008 16:48:14 +0900
Message-ID: <1217317694.11957.12.camel@sebastian.kern.oss.ntt.co.jp>
References: <20080729172337.b3d74100.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756075AbYG2Hs2@vger.kernel.org>
In-Reply-To: <20080729172337.b3d74100.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

The patch below gets rid of a compile error that would be nice to get
fixed in Linus' tree.

-------- Forwarded Message --------
=46rom: Fernando Luis V=E1zquez Cao <fernando@oss.ntt.co.jp>
To: yi.zhu@intel.com, reinette.chatre@intel.com
Cc: ipw3945-devel@lists.sourceforge.net, akpm@linux-foundation.org, lin=
ux-kernel@vger.kernel.org
Subject: [PATCH] iwlwifi: fix iwl-led compile issue when CONFIG_IWLWIFI=
_DEBUG is not set
Date: 	Tue, 29 Jul 2008 14:58:42 +0900

=46ix compile error when CONFIG_IWLWIFI_DEBUG not defined.

Signed-off-by: Fernando Luis Vazquez Cao <fernando@oss.ntt.co.jp>
---

--- linux-2.6.27-rc1/drivers/net/wireless/iwlwifi/iwl-led.c	2008-07-29 =
13:51:26.000000000 +0900
+++ linux-2.6.27-rc1-iocontext/drivers/net/wireless/iwlwifi/iwl-led.c	2=
008-07-29 14:47:13.000000000 +0900
@@ -194,9 +194,10 @@ static void iwl_led_brightness_set(struc
 	if (test_bit(STATUS_EXIT_PENDING, &priv->status))
 		return;
=20
-
+#ifdef CONFIG_IWLWIFI_DEBUG
 	IWL_DEBUG_LED("Led type =3D %s brightness =3D %d\n",
 			led_type_str[led->type], brightness);
+#endif /* CONFIG_IWLWIFI_DEBUG */
 	switch (brightness) {
 	case LED_FULL:
 		if (led->type =3D=3D IWL_LED_TRG_ASSOC)


--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/
