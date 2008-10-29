From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Wed, 29 Oct 2008 14:11:23 +1100
Message-ID: <20081029141123.38d83ab7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39969 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752020AbYJ2DL2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 23:11:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Christian Lamparter <chunkeey@web.de>, "John W. Linville" <linville@tuxdriver.com>, Johannes Berg <johannes@sipsolutions.net>

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/p54/p54common.c between commit
f2c2e25554991f9c17bcd24028db5e1c50ecb0ad ("p54: fix build warnings") from
the net-current tree and commit e174961ca1a0b28f7abf0be47973ad57cb74e5f0
("net: convert print_mac to %pM") from the net tree.

Just context changes.  I fixed it up (see below) and can carry the fix
(hopefully only until net-current is merged into Linus' tree).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/wireless/p54/p54common.c
index 827ca03,72859de..0000000
--- a/drivers/net/wireless/p54/p54common.c
+++ b/drivers/net/wireless/p54/p54common.c
@@@ -319,8 -319,7 +319,7 @@@ static int p54_parse_eeprom(struct ieee
  	void *tmp;
  	int err;
  	u8 *end = (u8 *)eeprom + len;
 -	u16 synth;
 +	u16 synth = 0;
- 	DECLARE_MAC_BUF(mac);
  
  	wrap = (struct eeprom_pda_wrap *) eeprom;
  	entry = (void *)wrap->data + le16_to_cpu(wrap->len);
